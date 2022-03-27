<?php

    namespace App\Http\Controllers\Admin\Product;

    use App\Http\Controllers\Controller;
    use App\Http\Requests\Admin\Product\ProductRequest;
    use App\Models\Product;
    use App\Models\ProductType;
    use App\Models\Unit;
    use App\Models\Warehouse;
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

    class ProductController extends Controller
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
            return view('admin.pages.products.index');
        }

        /**
         * Show the form for creating a new resource.
         *
         * @return Application|Factory|View
         */
        public function create()
        {
            $product_types = ProductType::orderByDesc('id')->get();
            $units = Unit::orderByDesc('id')->get();
            return view('admin.pages.products.create', compact('product_types', 'units'));
        }

        /**
         * Store a newly created resource in storage.
         *
         * @param ProductRequest $request
         * @param CodeGenerator $codeGenerator
         * @return RedirectResponse
         * @throws Throwable
         */
        public function store(ProductRequest $request, CodeGenerator $codeGenerator)
        {
            DB::beginTransaction();
            try {
                $product_type = ProductType::findOrFail($request->input('product_type'));
                $product = Product::create([
                    'code' => $codeGenerator->reference(Product::class, $product_type->shortcut, 'code'),
                    'name' => $request->input('name'),
                    'product_type_id' => $request->input('product_type'),
                    'unit_id' => $request->input('unit'),
                    'stock_alert_limit' => $request->input('stock_alert_limit'),
                ]);

                // attach product stock with each warehouses
                $warehouse_ids = Warehouse::pluck('id')->toArray();
                foreach ($warehouse_ids as $warehouse_id) {
                    $product->stocks()->attach($warehouse_id);
                }

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

        /**
         * Show the form for editing the specified resource.
         *
         * @param int $id
         * @return Application|Factory|View
         */
        public function edit($id)
        {
            $product = Product::findOrFail($id);
            $product_types = ProductType::orderByDesc('id')->get();
            $units = Unit::orderByDesc('id')->get();
            return view('admin.pages.products.edit', compact('product', 'product_types', 'units'));
        }

        /**
         * Update the specified resource in storage.
         *
         * @param ProductRequest $request
         * @param int $id
         * @param CodeGenerator $codeGenerator
         * @return RedirectResponse
         * @throws Throwable
         */
        public function update(ProductRequest $request, $id, CodeGenerator $codeGenerator)
        {
            DB::beginTransaction();
            try {
                $product_type = ProductType::findOrFail($request->input('product_type'));

                $product = Product::findOrFail($id);
                $product->update([
                    'code' => $product->product_type_id != $request->input('product_type') ? $codeGenerator->reference(Product::class, [$product_type->shortcut], 'code') : $product->code,
                    'name' => $request->input('name'),
                    'product_type_id' => $request->input('product_type'),
                    'unit_id' => $request->input('unit'),
                    'stock_alert_limit' => $request->input('stock_alert_limit'),
                ]);
                DB::commit();
                return redirect()
                    ->route('admin.product.self.index')
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
                $product = Product::findOrFail($id);
                $product->delete();
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
    }
