<?php

    namespace App\Http\Controllers\Admin\Purchase;

    use App\Http\Controllers\Controller;
    use App\Http\Requests\Admin\Purchase\PurchaseDamageRequest;
    use App\Models\Purchase;
    use App\Models\PurchaseDamage;
    use App\Models\PurchaseDetail;
    use DB;
    use Exception;
    use Illuminate\Contracts\Foundation\Application;
    use Illuminate\Contracts\View\Factory;
    use Illuminate\Contracts\View\View;
    use Illuminate\Http\JsonResponse;
    use Illuminate\Http\RedirectResponse;
    use Throwable;

    class DamagedController extends Controller
    {
        /**
         * Display a listing of the resource.
         *
         * @return Application|Factory|View
         */
        public function index()
        {
            $damaged_purchases = PurchaseDamage::with('purchases', 'purchaseInventories')->get();
            return view('admin.pages.purchase.damaged.index', compact('damaged_purchases'));
        }

        /**
         * Show the form for creating a new resource.
         *
         * @return Application|Factory|View
         */
        public function create()
        {
            $purchases = Purchase::all();
            return view('admin.pages.purchase.damaged.create', compact('purchases'));
        }

        /**
         * @param $id
         * @return JsonResponse
         */
        public function getPurchase($id)
        {
            $purchaseInventories = PurchaseDetail::with('units', 'rawMaterials')->where('purchase_id', '=', $id)->get();
            return \response()->json($purchaseInventories);
        }

        /**
         * Store a newly created resource in storage.
         *
         * @param PurchaseDamageRequest $request
         * @return RedirectResponse
         * @throws Throwable
         */
        public function store(PurchaseDamageRequest $request)
        {
            DB::beginTransaction();
            try {
                PurchaseDamage::create([
                    'purchase_id' => $request->input('purchase'),
                    'reason' => $request->input('reason'),
                    'damage_date' => $request->input('damage_date'),
                    'note' => $request->input('note'),
                ]);

                $purchases = Purchase::findOrFail($request->input('purchase'));
                $damaged_qty = $request->input('damageQuantities');
                $available_qty = $purchases->purchaseInventories->pluck('available_quantity');

                foreach ($purchases->purchaseInventories as $key => $purchase) {
                    $purchase->update([
                        'available_quantity' => availableQty($available_qty[$key], $damaged_qty[$key] ?? 0),
                        'damaged_quantity' => $damaged_qty[$key] ?? 0,
                    ]);
                }

                DB::commit();
                return back()->with([
                    'alert-type' => 'success_toast',
                    'message' => 'DamagedController Created Successfully!',
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
        public function edit($id)
        {
            $damaged_purchase = PurchaseDamage::findOrFail($id);
            $purchases = Purchase::all();
            return view('admin.pages.purchase.damaged.edit', compact('damaged_purchase', 'purchases'));
        }

        /**
         * Update the specified resource in storage.
         *
         * @param PurchaseDamageRequest $request
         * @param int $id
         * @return RedirectResponse
         * @throws Throwable
         */
        public function update(PurchaseDamageRequest $request, int $id)
        {
            DB::beginTransaction();
            try {
                $damaged_purchase = PurchaseDamage::findOrFail($id);
                $damaged_purchase->update([
                    'purchase_id' => $request->input('purchase'),
                    'reason' => $request->input('reason'),
                    'damage_date' => $request->input('damage_date'),
                    'note' => $request->input('note'),
                ]);

                $purchases = Purchase::findOrFail($request->input('purchase'));
                $damaged_qty = $request->input('damageQuantities');
                $existingDamagedQty = $purchases->purchaseInventories->pluck('damaged_quantity')->toArray();
                $purchase_qty = $purchases->purchaseInventories->pluck('quantity');

                if ($damaged_qty !== $existingDamagedQty){
                    foreach ($purchases->purchaseInventories as $key => $purchase) {
                        $purchase->update([
                            'available_quantity' => availableQty($purchase_qty[$key], $damaged_qty[$key] ?? 0),
                            'damaged_quantity' => $damaged_qty[$key] ?? 0,
                        ]);
                    }
                    DB::commit();
                }

                DB::commit();
                return redirect()
                    ->route('admin.purchase.damaged.index')
                    ->with([
                        'alert-type' => 'success_toast',
                        'message' => 'DamagedController Updated Successfully!',
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
    }
