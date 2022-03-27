<?php

namespace App\Http\Controllers\Admin\Purchase;

use App\Http\Controllers\Controller;
use App\Http\Requests\Admin\Purchase\PurchaseRequest;
use App\Models\Product;
use App\Models\ProductType;
use App\Models\Purchase;
use App\Models\Stock;
use App\Models\Supplier;
use App\Models\Unit;
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
use Yajra\DataTables\Facades\DataTables;

class PurchaseController extends Controller
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
        $purchases = Purchase::with('suppliers:id,name')
            ->get()
            ->sortByDesc(function ($query) {
                return $query->code;
            });
        return view('admin.pages.purchase.index', compact('purchases'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return Application|Factory|View|Response
     */
    public function create()
    {
        $suppliers = Supplier::all();
        $product_type = ProductType::with('products')
            ->findOrFail(ProductType::RAW);

        return view('admin.pages.purchase.create', compact('suppliers', 'product_type'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param PurchaseRequest $request
     * @param MediaHandler $mediaHandler
     * @param CodeGenerator $codeGenerator
     * @return RedirectResponse
     * @throws Throwable
     */
    public function store(PurchaseRequest $request, MediaHandler $mediaHandler, CodeGenerator $codeGenerator)
    {
        DB::beginTransaction();
        try {
            $warehouse = Warehouse::findOrFail(Warehouse::PURCHASE);
            $purchase = Purchase::create([
                'code' => $codeGenerator->reference(Purchase::class, $warehouse->shortcut, 'code'),
                'purchase_date' => $request->input('purchase_date'),
                'supplier_id' => $request->input('supplier'),
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

            $product_details->each(function ($item) use ($purchase, $warehouse) {
                $purchase->purchaseDetails()->create([
                    'warehouse_id' => $warehouse->id,
                    'product_id' => $item['product_id'],
                    'qty' => $item['qty'],
                    'unit_price' => $item['unit_price'],
                    'single_discount' => $item['single_discount'],
                    'single_total' => $item['single_total'],
                ]);

                // Update Stock
                Stock::where('product_id', $item['product_id'])
                    ->where('warehouse_id', $warehouse->id)
                    ->increment('qty', $item['qty']);
            });

            // Purchase Documents
            $mediaHandler->uploadMultipleMedia($purchase, 'multiple_media', 'document');

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
        $purchase = Purchase::where('code', '=', $code)->firstOrFail();
        session()->put('url.intended', route('admin.purchase.self.show', $purchase->code));
        return view('admin.pages.purchase.show', compact('purchase'));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param int $id
     * @return Application|Factory|View|Response
     */
    public function edit($id)
    {
        $purchase = Purchase::findOrFail($id);
        $suppliers = Supplier::all();
        $product_type = ProductType::with('products')
            ->findOrFail(ProductType::RAW);

        // array of each purchase detail with stock
        $purchase_details = [];
        foreach ($purchase->purchaseDetails as $purchase_detail) {
            $stocks = $purchase_detail->products->stocks()
                ->where('product_id', '=', $purchase_detail->product_id)
                ->where('warehouse_id', '=', Warehouse::PURCHASE)
                ->get();

            foreach ($stocks as $stock) {
                $purchase_details[] = (object)[
                    'product_id' => $purchase_detail->product_id,
                    'qty' => $purchase_detail->qty,
                    'unit_shortcut' => $purchase_detail->products->units->shortcut,
                    'unit_price' => $purchase_detail->unit_price,
                    'single_discount' => $purchase_detail->single_discount,
                    'single_total' => $purchase_detail->single_total,
                    'stock' => $stock->pivot->qty,
                ];
            }
        }

        return view('admin.pages.purchase.edit', compact('purchase', 'purchase_details', 'suppliers', 'product_type'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param PurchaseRequest $request
     * @param int $id
     * @param MediaHandler $mediaHandler
     * @return RedirectResponse
     * @throws Throwable
     */
    public function update(PurchaseRequest $request, $id, MediaHandler $mediaHandler)
    {
        DB::beginTransaction();
        try {
            $warehouse = Warehouse::findOrFail(Warehouse::PURCHASE);
            $purchase = Purchase::findOrFail($id);

            foreach ($purchase->purchaseDetails as $old_purchase_detail) {
                Stock::where('product_id', '=', $old_purchase_detail->product_id)
                    ->where('warehouse_id', '=', $warehouse->id)
                    ->decrement('qty', $old_purchase_detail->qty);
            }
            $purchase->purchaseDetails()->delete();

            $new_product_details = self::getProductDetails($request);
            foreach ($new_product_details as $new_product_detail) {
                Stock::where('product_id', '=', $new_product_detail['product_id'])
                    ->where('warehouse_id', '=', $warehouse->id)
                    ->increment('qty', $new_product_detail['qty']);

                $purchase->purchaseDetails()->create([
                    'warehouse_id' => $warehouse->id,
                    'product_id' => $new_product_detail['product_id'],
                    'qty' => $new_product_detail['qty'],
                    'unit_price' => $new_product_detail['unit_price'],
                    'single_discount' => $new_product_detail['single_discount'],
                    'single_total' => $new_product_detail['single_total'],
                ]);
            }

            $purchase->update([
                'code' => $purchase->code,
                'purchase_date' => $request->input('purchase_date'),
                'supplier_id' => $request->input('supplier'),
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


            // Purchase Documents
            $mediaHandler->updateMultipleMedia($purchase, 'multiple_media', 'document');

            DB::commit();
            return redirect()->route('admin.purchase.self.index')->with([
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
            $purchase = Purchase::findOrFail($id);
            $product_id=PurchaseDetail::where('purchase_id',$id)->get();
            $warehouse = Warehouse::findOrFail(Warehouse::PURCHASE);
            foreach ($product_id as $product ){
                Stock::where('product_id', $product->id)
                    ->where('warehouse_id', $warehouse->id)
                    ->increment('qty', $product->qty);
            }
            $purchase->delete();
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
     * @param Dropzone $dropzone
     * @param Request $request
     * @return JsonResponse|void
     */
    public function getMedia(Dropzone $dropzone, Request $request)
    {
        // 'request' is the parameter which is coming from the ajax response
        if ($request->get('request') === 'purchase') {
            return $dropzone->getMedia(Purchase::class, 'document', 'id');
        }
    }

    /**
     * @param Dropzone $dropzone
     * @return JsonResponse
     */
    public function storeMedia(Dropzone $dropzone): JsonResponse
    {
        return $dropzone->storeMedia();
    }

    /**
     * @param Dropzone $dropzone
     * @param Request $request
     * @return JsonResponse
     */
    public function destroyMedia(Dropzone $dropzone, Request $request): JsonResponse
    {
        if ($request->input('single_media')) {
            return $dropzone->deleteMedia(Media::class, 'single_media', 'uuid', 'spatie');
        }
        return $dropzone->deleteMedia(Media::class, 'multiple_media', 'uuid', 'spatie');
    }

    /**
     * @return JsonResponse
     */
    public function getProducts()
    {
        $product_types = ProductType::with('products')
            ->findOrFail(ProductType::RAW)
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
        $stock_by_purchase_warehouse = $product->stocks()->where('warehouse_id', '=', Warehouse::PURCHASE)->get();
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

        return view('admin.pages.purchase.purchase-report');
    }

    public function reportData(Request $request)
    {
        $start_date = $request->get('startDate');
        $end_date = $request->get('endDate');
        $purchases = Purchase::leftJoin('suppliers','suppliers.id','=','purchases.supplier_id')
            ->leftJoin('purchase_details','purchase_details.purchase_id','=','purchases.id')
            ->leftJoin('products','products.id','=','purchase_details.product_id')
            ->leftJoin('units','units.id','=','products.unit_id')
            ->leftJoin('warehouses','warehouses.id','=','purchase_details.warehouse_id')
            ->whereBetween('purchase_date', [$start_date, $end_date])
            ->get([
                'purchases.code as puCode',
                'purchases.purchase_date',
                'purchases.sub_total',
                'purchases.total_discount',
                'purchases.transport_cost',
                'purchases.grand_total',
                'purchases.total_paid',
                'purchases.total_due',
                'purchases.payment_method',
                'purchases.payment_status',
                'purchases.note',
                'purchase_details.unit_price',
                'purchase_details.single_discount',
                'purchase_details.single_total',
                'suppliers.name as su_name',
                'warehouses.name as wh_name',
                'products.name as p_name',
                'products.code as p_code',
                'units.name  as u_name',

            ]);
        $data = ['responseCode' => 1, 'data' => $purchases];
        return response()->json($data);
        }
}
