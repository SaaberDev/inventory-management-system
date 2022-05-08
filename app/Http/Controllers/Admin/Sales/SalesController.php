<?php

    namespace App\Http\Controllers\Admin\Sales;

    use App\Http\Controllers\Controller;
    use App\Http\Requests\Admin\Sales\SalesRequest;
    use App\Models\Client;
    use App\Models\Product;
    use App\Models\ProductType;
    use App\Models\Sale;
    use App\Models\SaleDetail;
    use App\Models\Stock;
    use App\Models\Warehouse;
    use App\Services\Dropzone\Dropzone;
    use App\Services\Generator\CodeGenerator;
    use App\Services\MediaLibrary\MediaHandler;
    use Illuminate\Database\Eloquent\Builder;
    use Illuminate\Http\Request;
    use DB;
    use Exception;
    use Illuminate\Contracts\Foundation\Application;
    use Illuminate\Contracts\View\Factory;
    use Illuminate\Contracts\View\View;
    use Illuminate\Http\JsonResponse;
    use Illuminate\Http\RedirectResponse;
    use Illuminate\Http\Response;
    use Spatie\MediaLibrary\MediaCollections\Models\Media;
    use Throwable;

    class SalesController extends Controller
    {
        private $_className;

        public function __construct()
        {
            $this->_className = getClassName($this);
        }

        /**
         * Display a listing of the resource.
         *
         * @return Application|Factory|View|Response
         */
        public function index()
        {
            $sales = Sale::leftJoin('clients', 'clients.id', '=', 'sales.client_id')
                ->get(['sales.*','clients.name'])
                ->sortByDesc(function ($query) {
                    return $query->code;
                });
            return view('admin.pages.sales.index', compact('sales'));
        }

        /**
         * Show the form for creating a new resource.
         *
         * @return Application|Factory|View|Response
         */
        public function create()
        {
            $client = Client::all();
            $product_types = ProductType::with(['products' => function ($query) {
                $query->whereHas('stocks', function ($query) {
                    $query->where('warehouse_id', '=', Warehouse::FINISHED)->where('qty', '!=', 0);
                })->whereIn('product_type_id', [ProductType::REL, ProductType::FIN]);
            }])->get();

            return view('admin.pages.sales.create', compact('product_types','client'));
        }

        /**
         * Store a newly created resource in storage.
         *
         * @param SalesRequest $request
         * @param MediaHandler $mediaHandler
         * @param CodeGenerator $codeGenerator
         * @return RedirectResponse
         * @throws Throwable
         */
        public function store(SalesRequest $request, CodeGenerator $codeGenerator)
        {
            DB::beginTransaction();
            try {
                $warehouse = Warehouse::findOrFail(Warehouse::FINISHED);
                $sales = Sale::create([
                    'code' => $codeGenerator->reference(Sale::class, $warehouse->shortcut, 'code'),
                    'sale_date' => $request->input('sales_date'),
                    'client_id' => $request->input('client'),
                    'sub_total' => formatNumber($request->input('subTotal')),
                    'total_discount' => formatNumber($request->input('totalDiscount')),
                    'transport_cost' => formatNumber($request->input('transportCost')),
                    'grand_total' => formatNumber($request->input('total')),
                    'total_paid' => formatNumber($request->input('total_paid')),
                    'total_due' => totalDue($request->input('total'), $request->input('total_paid')),
                    'payment_method' => $request->input('payment_method'),
                    'payment_status' => $request->input('payment_status'),
                    'note' => strip_tags($request->input('note'), '<br>')
                ]);

                $product_details = self::getProductDetails($request);

                $product_details->each(function ($item) use ($sales, $warehouse) {
                    $sales->salesDetails()->create([
                        'product_id' => $item['product_id'],
                        'qty' => $item['qty'],
                        'unit_price' => $item['unit_price'],
                        'single_discount' => $item['single_discount'],
                        'single_total' => $item['single_total'],
                    ]);


                    // Update Stock
                    Stock::where('product_id', $item['product_id'])
                        ->where('warehouse_id', $warehouse->id)
                        ->decrement('qty', $item['qty']);
                });


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

        private function getProductDetails($request)
        {
            $products = [];
            $product_id = $request->input('products');
            $qty = $request->input('quantities');
            $unit_prices = $request->input('unitPrices');
            $single_discount = $request->input('discounts');
            $single_total = $request->input('singleTotal');

            for ($i = 0; $i < count($product_id); $i++) {
                $data = [
                    'product_id' => $product_id[$i],
                    'qty' => $qty[$i],
                    'unit_price' => formatNumber($unit_prices[$i]),
                    'single_discount' => formatNumber($single_discount[$i]),
                    'single_total' => formatNumber($single_total[$i]),
                ];
                $products[] = collect($data);
            }

            return collect($products);
        }

        /**
         * Display the specified resource.
         *
         * @param $code
         * @return Application|Factory|View|Response
         */
        public function show($code)
        {
            $sale = Sale::where('code', '=', $code)->firstOrFail();
//            $saleDetail = SaleDetail::where('sale_id', '=', $sale->id)->get();
//            dd($saleDetail);
            session()->put('url.intended', route('admin.sales.self.show', $sale->code));
            return view('admin.pages.sales.show', compact('sale'));
        }

        /**
         * Show the form for editing the specified resource.
         *
         * @param int $id
         * @return Application|Factory|View|Response
         */
        public function edit($id)
        {
            $sale = Sale::findOrFail($id);
            $client = Client::all();
            $product_type = ProductType::with('products')
                ->findOrFail(ProductType::FIN);

            // array of each purchase detail with stock
            $sales_detail = [];
            foreach ($sale->salesDetails as $sales_details) {
                $stocks = $sales_details->products->stocks()
                    ->where('product_id', '=', $sales_details->product_id)
                    ->where('warehouse_id', '=', Warehouse::FINISHED)
                    ->get();

                foreach ($stocks as $stock) {
                    $sales_detail[] = (object)[
                        'product_id' => $sales_details->product_id,
                        'qty' => $sales_details->qty,
                        'unit_shortcut' => $sales_details->products->units->shortcut,
                        'unit_price' => $sales_details->unit_price,
                        'single_discount' => $sales_details->single_discount,
                        'single_total' => $sales_details->single_total,
                        'stock' => $stock->pivot->qty,
                    ];
                }
            }

            return view('admin.pages.sales.edit', compact('sale', 'sales_detail', 'client', 'product_type'));
        }

        /**
         * Update the specified resource in storage.
         *
         * @param SalesRequest $request
         * @param int $id
         * @param MediaHandler $mediaHandler
         * @return RedirectResponse
         * @throws Throwable
         */
        public function update(SalesRequest $request, $id, MediaHandler $mediaHandler)
        {
            DB::beginTransaction();
            try {
                $warehouse = Warehouse::findOrFail(Warehouse::FINISHED);
                $sale = Sale::findOrFail($id);
                foreach ($sale->salesDetails as $old_sale_detail) {
                    Stock::where('product_id', '=', $old_sale_detail->product_id)
                        ->where('warehouse_id', '=', $warehouse->id)
                        ->decrement('qty', $old_sale_detail->qty);
                }
                $sale->salesDetails()->delete();

                $new_product_details = self::getProductDetails($request);

                foreach ($new_product_details as $new_product_detail) {
                    Stock::where('product_id', '=', $new_product_detail['product_id'])
                        ->where('warehouse_id', '=', $warehouse->id)
                        ->increment('qty', $new_product_detail['qty']);

                    $sale->salesDetails()->create([
                        'product_id' => $new_product_detail['product_id'],
                        'qty' => $new_product_detail['qty'],
                        'unit_price' => $new_product_detail['unit_price'],
                        'single_discount' => $new_product_detail['single_discount'],
                        'single_total' => $new_product_detail['single_total'],
                    ]);
                }

                $sale->update([
                    'code' => $sale->code,
                    'sale_date' => $request->input('sales_date'),
                    'client_id' => $request->input('client'),
                    'sub_total' => formatNumber($request->input('subTotal')),
                    'total_discount' => formatNumber($request->input('totalDiscount')),
                    'transport_cost' => formatNumber($request->input('transportCost')),
                    'grand_total' => formatNumber($request->input('total')),
                    'total_paid' => formatNumber($request->input('total_paid')),
                    'total_due' => totalDue($request->input('total'), $request->input('total_paid')),
                    'payment_method' => $request->input('payment_method'),
                    'payment_status' => $request->input('payment_status'),
                    'note' => strip_tags($request->input('note'), '<br>')
                ]);



                DB::commit();
                return redirect()->route('admin.sales.self.index')->with([
                    'alert-type' => 'success_toast',
                    'message' => $this->_className . ' Updated Successfully!',
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
                $sale = Sale::findOrFail($id);
                $product_id=SaleDetail::where('sale_id',$id)->get();
                $warehouse = Warehouse::findOrFail(Warehouse::FINISHED);
                foreach ($product_id as $product ){
                    Stock::where('product_id', $product->id)
                        ->where('warehouse_id', $warehouse->id)
                        ->increment('qty', $product->qty);
                }

                $sale->delete();
                DB::commit();
                return \response()->json([
                    'alert_type' => 'success',
                    'message' => $this->_className . ' Deleted Successfully!',
                ]);
            } catch (Exception $exception) {
                DB::rollBack();
                report($exception);
                return \response()->json([
                    'alert_type' => 'warning',
                    'message' => 'Oops, Something went wrong!',
                ]);
            }
        }

        /**
         * @return JsonResponse
         */
        public function getProducts()
        {
            $product_types = ProductType::with('products')
                ->findOrFail(ProductType::FIN)
                ->toArray();
            return \response()->json($product_types);
        }

        /**
         * @param Request $request
         * @return JsonResponse
         */
        public function getStock(Request $request)
        {
            $product = Product::findOrFail($request->get('id'));
            $stock_by_purchase_warehouse = $product->stocks()->where('warehouse_id', '=', Warehouse::FINISHED)->get();
            $qty = [];
            foreach ($stock_by_purchase_warehouse as $stock) {
                $qty = $stock->pivot->qty;
            }

            $data = [
                'stock' => $qty,
                'shortcut' => $product->units->shortcut
            ];
            return \response()->json($data);
        }

        public function report()
        {
            return view('admin.pages.sales.sales-report');
        }

        public function reportData(Request $request)
        {
            $start_date = $request->get('startDate');
            $end_date = $request->get('endDate');
             $sale = Sale::leftJoin('clients','clients.id','=','sales.client_id')
                ->whereBetween('sale_date', [$start_date, $end_date])
                ->get([
                    'sales.code as S_Code',
                    'sales.sale_date',
                    'clients.name as c_name',
                ]);
            $data = ['responseCode' => 1, 'data' => $sale];
            return response()->json($data);
        }
    }
