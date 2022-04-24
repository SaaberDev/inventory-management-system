<?php

    namespace App\Http\Controllers\Admin\Transfer;

    use App\Http\Controllers\Controller;
    use App\Http\Requests\Admin\Transfer\TransferRequest;
    use App\Models\Product;
    use App\Models\Stock;
    use App\Models\Transfer;
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
    use Illuminate\Http\Response;
    use Throwable;

    class TransferController extends Controller
    {
        private $_className;

        public function __construct()
        {
            $this->_className = getClassName($this);
        }

        /**
         * Display a listing of the resource.
         *
         * @return Factory|Application|View
         */
        public function index()
        {
            $transfers = Transfer::with('transferDetails.products', 'from_warehouses', 'to_warehouses')->get();

            $data = [];
            foreach ($transfers as $transfer) {
                $detail = [];
                foreach ($transfer->transferDetails as $transferDetail) {
                    $detail[] = [
                        'code' => $transferDetail->products->code,
                        'name' => $transferDetail->products->name,
                        'qty' => $transferDetail->qty,
                    ];
                }

                $data[] = [
                    'id' => $transfer->id,
                    'transfer_date' => $transfer->transfer_date,
                    'code' => $transfer->code,
                    'from_warehouse' => $transfer->from_warehouses->name,
                    'to_warehouse' => $transfer->to_warehouses->name,
                    'note' => $transfer->note,
                    'transfer_details' => $detail,
                ];
            }

            $transfer_infos = collect(json_decode(json_encode($data)));

            return view('admin.pages.transfer.index', compact('transfer_infos'));
        }

        /**
         * Show the form for creating a new resource.
         *
         * @return Application|Factory|View
         */
        public function create()
        {
            $warehouses = Warehouse::orderBy('position')->get();
            $from_warehouses = $warehouses->sortByDesc(function ($item) {
                return $item['id'] == 1;
            })->except(Warehouse::FINISHED)->pluck('name', 'id');
            $to_warehouses = $warehouses->sortBy(function ($item) {
                return $item['id'] == 2;
            })->except(Warehouse::PURCHASE)->pluck('name', 'id');

            return view('admin.pages.transfer.create', compact('from_warehouses', 'to_warehouses'));
        }

        /**
         * Store a newly created resource in storage.
         *
         * @param TransferRequest $request
         * @param CodeGenerator $codeGenerator
         * @return RedirectResponse
         * @throws Throwable
         */
        public function store(TransferRequest $request, CodeGenerator $codeGenerator)
        {
            DB::beginTransaction();
            try {
                $from_warehouse = Warehouse::findOrFail($request->input('transfer_from'));
                $to_warehouse = Warehouse::findOrFail($request->input('transfer_to'));
                $transfer = Transfer::create([
                    'code' => $codeGenerator->reference(Transfer::class, ['TR', $to_warehouse->shortcut], 'code', 'to_warehouse_id', $request->input('transfer_to')),
                    'transfer_date' => $request->input('transfer_date'),
                    'from_warehouse_id' => $request->input('transfer_from'),
                    'to_warehouse_id' => $request->input('transfer_to'),
                    'note' => $request->input('note')
                ]);

                $product_details = self::getProductDetails($request);

                $product_details->each(function ($item) use ($transfer, $from_warehouse, $to_warehouse) {
                    $transfer->transferDetails()->create([
                        'product_id' => $item['product_id'],
                        'qty' => $item['qty']
                    ]);

                    // Update Stock - Increment -> to_warehouse
                    Stock::where('product_id', '=', $item['product_id'])
                        ->where('warehouse_id', '=', $to_warehouse->id)
                        ->increment('qty', $item['qty']);

                    // Update Stock - Decrement -> from_warehouse
                    Stock::where('product_id', '=', $item['product_id'])
                        ->where('warehouse_id', '=', $from_warehouse->id)
                        ->decrement('qty', $item['qty']);
                });

                DB::commit();
                return back()->with([
                    'alert-type' => 'success_toast',
                    'message' => $this->_className . ' Created Successfully!',
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

        private function getProductDetails($request)
        {
            $products = [];
            $product_id = $request->input('products');
            $qty = $request->input('quantities');

            for ($i = 0; $i < count($product_id); $i++) {
                $data = [
                    'product_id' => $product_id[$i],
                    'qty' => $qty[$i]
                ];
                $products[] = collect($data);
            }

            return collect($products);
        }

        /**
         * Show the form for editing the specified resource.
         *
         * @param int $id
         * @return Application|Factory|View
         */
        public function edit($id, StockDetail $stockDetail)
        {
            $transfer = Transfer::findOrFail($id);
            $to_warehouses = Warehouse::pluck('name', 'id')
                ->sortKeys()
                ->sortBy(function ($item, $key) {
                    return $key == 2;
                })
                ->except(Warehouse::PURCHASE);

            $transfer_details = $stockDetail->availableStock($transfer->transferDetails, $transfer->from_warehouse_id)->get();

            return view('admin.pages.transfer.edit', compact('transfer', 'transfer_details', 'to_warehouses'));
        }

        /**
         * Update the specified resource in storage.
         *
         * @param TransferRequest $request
         * @param int $id
         * @return RedirectResponse
         * @throws Throwable
         */
        public function update(TransferRequest $request, $id)
        {
            DB::beginTransaction();
            try {
                $transfer = Transfer::findOrFail($id);

                foreach ($transfer->transferDetails as $old_transfer_detail) {
                    // Update Stock - Decrement -> to_warehouse
                    Stock::where('product_id', '=', $old_transfer_detail['product_id'])
                        ->where('warehouse_id', '=', $transfer->to_warehouse_id)
                        ->decrement('qty', $old_transfer_detail['qty']);

                    // Update Stock - Increment -> from_warehouse
                    Stock::where('product_id', '=', $old_transfer_detail['product_id'])
                        ->where('warehouse_id', '=', $transfer->from_warehouse_id)
                        ->increment('qty', $old_transfer_detail['qty']);
                }
                $transfer->transferDetails()->delete();

                $new_product_details = self::getProductDetails($request);
                foreach ($new_product_details as $new_product_detail) {
                    // Update Stock - Increment -> to_warehouse
                    Stock::where('product_id', '=', $new_product_detail['product_id'])
                        ->where('warehouse_id', '=', $request->input('transfer_to'))
                        ->increment('qty', $new_product_detail['qty']);

                    // Update Stock - Decrement -> from_warehouse
                    Stock::where('product_id', '=', $new_product_detail['product_id'])
                        ->where('warehouse_id', '=', $transfer->from_warehouse_id)
                        ->decrement('qty', $new_product_detail['qty']);

                    $transfer->transferDetails()->create([
                        'product_id' => $new_product_detail['product_id'],
                        'qty' => $new_product_detail['qty']
                    ]);
                }

                $transfer->update([
                    'code' => $transfer->code,
                    'transfer_date' => $request->input('transfer_date'),
                    'from_warehouse_id' => $transfer->from_warehouse_id,
                    'to_warehouse_id' => $request->input('transfer_to'),
                    'note' => $request->input('note')
                ]);

                DB::commit();
                return redirect()
                    ->route('admin.transfer.index')
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
            $stocks = $products_by_warehouse->stocks()
                ->where('qty', '!=', 0)
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
    }
