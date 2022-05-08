<?php

    namespace App\Http\Controllers\Admin\ReleasedProduct;

    use App\Http\Controllers\Controller;
    use App\Http\Requests\Admin\ReleasedProduct\ReleasedProductRequest;
    use App\Models\Product;
    use App\Models\ProductType;
    use App\Models\ReleasedProduct;
    use App\Models\Stock;
    use App\Models\Warehouse;
    use App\Repository\Stock\StockDetail;
    use App\Services\Generator\CodeGenerator;
    use DB;
    use Exception;
    use Illuminate\Contracts\Foundation\Application;
    use Illuminate\Contracts\View\Factory;
    use Illuminate\Contracts\View\View;
    use Illuminate\Http\JsonResponse;
    use Illuminate\Http\RedirectResponse;
    use Illuminate\Http\Request;
    use Illuminate\Support\Collection;
    use Throwable;

    class ReleasedProductController extends Controller
    {
        private $_className;

        public function __construct()
        {
            $this->_className = getClassName($this);
        }

        /**
         * Display a listing of the resource.
         *
         * @return Application|Factory|View
         */
        public function index()
        {
            $released_products = ReleasedProduct::with(
                    'releasedProductDetails:id,released_product_id,product_id,qty',
                    'releasedProductDetails.products:id,code,name',
                    'products:id,name,product_type_id',
                    'products.productTypes:id,name',
                    'warehouses:id,name'
                )
                ->orderBy('updated_at', 'desc')
                ->get();

            $data = [];
            foreach ($released_products as $released_product) {
                $details = [];
                foreach ($released_product->releasedProductDetails as $released_product_detail) {
                    $details[] = [
                        'code' => $released_product_detail->products->code,
                        'name' => $released_product_detail->products->name,
                        'qty' => $released_product_detail->qty,
                    ];
                }

                $data[] = [
                    'id' => $released_product->id,
                    'date' => $released_product->released_date,
                    'code' => $released_product->code,
                    'released_from' => $released_product->warehouses->name,
                    'product_type' => $released_product->products->productTypes->name,
                    'released_product' => $released_product->products->name,
                    'quantity' => $released_product->qty,
                    'note' => $released_product->note,

                    'released_product_details' => $details
                ];
            }

            $released_product_infos = collect(json_decode(json_encode($data)));

            return view('admin.pages.release-product.index', compact('released_product_infos'));
        }

        /**
         * Show the form for creating a new resource.
         *
         * @return Application|Factory|View
         */
        public function create()
        {
            $warehouses = Warehouse::orderBy('position')->get();
            $released_from = $warehouses->sortBy(function ($item) {
                return $item['id'] == 2;
            })->except([Warehouse::PURCHASE, Warehouse::FINISHED])->pluck('name', 'id');
            $product_types = ProductType::pluck('name', 'id')->except(ProductType::RAW);

            return view('admin.pages.release-product.create', compact('released_from', 'product_types'));
        }

        /**
         * Store a newly created resource in storage.
         *
         * @param ReleasedProductRequest $request
         * @param CodeGenerator $codeGenerator
         * @return RedirectResponse
         * @throws Throwable
         */
        public function store(ReleasedProductRequest $request, CodeGenerator $codeGenerator)
        {
            DB::beginTransaction();
            try {
                $released_from = $request->input('released_from');
                $from_warehouse = Warehouse::findOrFail($released_from);
                $product_type = ProductType::where('id', '=', $request->input('product_type'))->firstOrFail();

                $released_products = ReleasedProduct::create([
                    'code' => $codeGenerator->reference(ReleasedProduct::class, [$product_type->shortcut, $from_warehouse->shortcut], 'code', 'from_warehouse_id', $request->input('released_from')),
                    'released_date' => $request->input('released_date'),
                    'from_warehouse_id' => $request->input('released_from'),
                    'product_type_id' => $request->input('product_type'),
                    'product_id' => $request->input('released_product'),
                    'qty' => $request->input('quantity'),
                    'note' => $request->input('note'),
                ]);

                $released_product_details = self::getProductDetails($request);

                // Store released product details data
                $released_product_details->each(function ($item) use ($released_products, $released_from) {
                    $released_products->releasedProductDetails()->create([
                        'product_id' => $item['product_id'],
                        'qty' => $item['qty'],
                    ]);

                    // update used product stock - decrement -> released_from (warehouse)
                    Stock::where('product_id', '=', $item['product_id'])
                        ->where('warehouse_id', '=', $released_from)
                        ->decrement('qty', $item['qty']);
                });

                // update released product stock - increment -> released_from (warehouse)
                Stock::where('product_id', '=', $request->input('released_product'))
                    ->where('warehouse_id', '=', $released_from)
                    ->increment('qty', $request->input('quantity'));


                DB::commit();
                return back()->with([
                    'alert-type' => 'success_toast',
                    'message' => $this->_className . ' Created Successfully!',
                ]);
            } catch (Exception $exception) {
                DB::rollBack();
                report_log($exception);
                return back()->with([
                    'alert-type' => 'warning_toast',
                    'message' => 'Oops, Something went wrong!',
                ]);
            }
        }


        /**
         * Show the form for editing the specified resource.
         *
         * @param int $id
         * @return Application|Factory|View
         */
        public function edit($id, StockDetail $stockDetail)
        {
            $released_product = ReleasedProduct::findOrFail($id);
            $product_types = ProductType::pluck('name', 'id')->except(ProductType::RAW);
            $products = Product::where('product_type_id', '=', $released_product->product_type_id)->get();
            $used_products = $stockDetail->availableStock($released_product->releasedProductDetails, $released_product->from_warehouse_id)->get();

            $released_product_stock = $released_product->products->stocks()->where('warehouse_id', '=', $released_product->from_warehouse_id)->first();

            $data = [
                'released_product' => [
                    'id' => $released_product->id,
                    'date' => $released_product->released_date,
                    'product_type_id' => $released_product->product_type_id,

                    'released_from' => [
                        'id' => $released_product->from_warehouse_id,
                        'name' => $released_product->warehouses->name
                    ],

                    'released_product' => [
                        'id' => $released_product->product_id,
                        'name' => $released_product->products->name,
                        'qty' => $released_product->qty,
                        'stock' => $released_product_stock->pivot->qty ?? '',
                    ],

                    'note' => $released_product->note,
                ],

                'used_products' => $used_products
            ];

            $released_product_info = collect(json_decode(json_encode($data)));

            return view('admin.pages.release-product.edit', compact('released_product_info', 'product_types', 'products'));
        }

        /**
         * Update the specified resource in storage.
         *
         * @param ReleasedProductRequest $request
         * @param int $id
         * @param CodeGenerator $codeGenerator
         * @return RedirectResponse
         * @throws Throwable
         */
        public function update(ReleasedProductRequest $request, $id, CodeGenerator $codeGenerator)
        {
            DB::beginTransaction();
            try {
                $released_product = ReleasedProduct::findOrFail($id);
                foreach ($released_product->releasedProductDetails as $old_released_product_detail) {
                    // Update Stock - increment -> from_warehouse
                    Stock::where('product_id', '=', $old_released_product_detail['product_id'])
                        ->where('warehouse_id', '=', $released_product->from_warehouse_id)
                        ->increment('qty', $old_released_product_detail['qty']);
                }
                $released_product->releasedProductDetails()->delete();

                $new_released_product_details = self::getProductDetails($request);
                foreach ($new_released_product_details as $new_released_product_detail) {
                    // Update Stock - decrement -> to_warehouse
                    Stock::where('product_id', '=', $new_released_product_detail['product_id'])
                        ->where('warehouse_id', '=', $released_product->from_warehouse_id)
                        ->decrement('qty', $new_released_product_detail['qty']);

                    $released_product->releasedProductDetails()->create([
                        'product_id' => $new_released_product_detail['product_id'],
                        'qty' => $new_released_product_detail['qty']
                    ]);
                }

                if ($released_product->product_id) {
                    // update old released product stock - increment -> released_from (warehouse)
                    Stock::where('product_id', '=', $released_product->product_id)
                        ->where('warehouse_id', '=', $released_product->from_warehouse_id)
                        ->decrement('qty', $released_product->qty);

                    // update new released product stock - decrement -> released_from (warehouse)
                    Stock::where('product_id', '=', $request->input('released_product'))
                        ->where('warehouse_id', '=', $request->input('released_from'))
                        ->increment('qty', $request->input('quantity'));
                } else {
                    // update old released product stock - increment -> released_from (warehouse)
                    Stock::where('product_id', '=', $released_product->product_id)
                        ->where('warehouse_id', '=', $released_product->from_warehouse_id)
                        ->increment('qty', $released_product->qty);

                    // update new released product stock - decrement -> released_from (warehouse)
                    Stock::where('product_id', '=', $request->input('released_product'))
                        ->where('warehouse_id', '=', $request->input('released_from'))
                        ->decrement('qty', $request->input('quantity'));
                }

                $released_from = $request->input('released_from');
                $from_warehouse = Warehouse::findOrFail($released_from);
                $product_type = ProductType::where('id', '=', $request->input('product_type'))->firstOrFail();

                $released_product->update([
                    'code' => $released_product->product_type_id != $request->input('product_type') ? $codeGenerator->reference(ReleasedProduct::class, [$product_type->shortcut, $from_warehouse->shortcut], 'code') : $released_product->code,
                    'released_date' => $request->input('released_date'),
                    'from_warehouse_id' => $request->input('released_from'),
                    'product_type_id' => $request->input('product_type'),
                    'product_id' => $request->input('released_product'),
                    'qty' => $request->input('quantity'),
                    'note' => $request->input('note'),
                ]);
                DB::commit();
                return /*redirect()
                    ->route('admin.release.index')*/
                back()
                    ->with([
                        'alert-type' => 'success_toast',
                        'message' => $this->_className . ' Updated Successfully!',
                    ]);
            } catch (Exception $exception) {
                DB::rollBack();
                report($exception);
                return back()->with([
                    'alert-type' => 'warning_toast',
                    'message' => 'Oops, Something went wrong!',
                ]);
            }
        }

        /**
         * Remove the specified resource from storage.
         *
         * @param int $id
         * @return JsonResponse
         * @throws Throwable
         */
        public function destroy($id)
        {
            DB::beginTransaction();
            try {
                // query here
                DB::commit();
                return response()->json([
                    'alert_type' => 'success',
                    'message' => $this->_className . ' Deleted Successfully!',
                ]);
            } catch (Exception $exception) {
                DB::rollBack();
                report($exception);
                return response()->json([
                    'alert_type' => 'warning',
                    'message' => 'Oops, Something went wrong!',
                ]);
            }
        }


        /**
         * @param Request $request
         * @return JsonResponse
         */
        public function getProductsByWarehouse(Request $request)
        {
            $products_by_warehouse = Warehouse::findOrFail($request->get('id'));
//            $released_products = ReleasedProduct::where('from_warehouse_id', '=', $request->get('id'))->distinct()->pluck('product_id')->toArray();

            $stocks = $products_by_warehouse->stocks()
                ->where('qty', '!=', 0)
                ->whereIn('product_type_id', [ProductType::RAW, ProductType::REL])
                // if released product warehouse_id is equals to released_from do not display
//                ->whereNotIn('product_id', $released_products)
                ->get();

            $data = [];
            foreach ($stocks as $stock) {
                $products['id'] = $stock->id;
                $products['code'] = $stock->code;
                $products['name'] = $stock->name;

                $data[] = $products;
            }
            return \response()->json($data, '200');
        }


        /**
         * @param Request $request
         * @return JsonResponse
         */
        public function getProducts(Request $request)
        {
            if ($request->get('query') == ProductType::REL) {
                $released_products = Product::where('product_type_id', '=', ProductType::REL)->select(['id', 'name', 'code'])->get();
                return \response()->json($released_products);
            } elseif ($request->get('query') == ProductType::FIN) {
                $released_products = Product::where('product_type_id', '=', ProductType::FIN)->select(['id', 'name', 'code'])->get();
                return \response()->json($released_products);
            } else {
                return response()->json([
                    'alert_type' => 'warning',
                    'message' => 'Oops, Something went wrong!',
                ], '400');
            }
        }


        /**
         * @param Request $request
         * @return JsonResponse
         */
        public function getStock(Request $request)
        {
            $product = Product::findOrFail($request->get('product_id'));
            $stock_by_warehouse = $product->stocks()->where('warehouse_id', '=', $request->get('warehouse_id'))->get();
            $qty = [];
            foreach ($stock_by_warehouse as $stock) {
                $qty = $stock->pivot->qty;
            }

            $data = [
                'stock' => $qty,
                'shortcut' => $product->units->shortcut
            ];
            return \response()->json($data);
        }

        /**
         * @param $request
         * @return Collection
         */
        private function getProductDetails($request)
        {
            $products = [];
            $product_id = $request->input('products');
            $qty = $request->input('quantities');

            for ($i = 0; $i < count($product_id); $i++) {
                $data = [
                    'product_id' => $product_id[$i],
                    'qty' => $qty[$i],
                ];
                $products[] = collect($data);
            }

            return collect($products);
        }
    }
