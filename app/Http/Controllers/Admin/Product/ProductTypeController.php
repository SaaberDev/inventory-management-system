<?php

    namespace App\Http\Controllers\Admin\Product;

    use App\Http\Controllers\Controller;
    use App\Http\Requests\Admin\Product\ProductTypeRequest;
    use App\Models\ProductType;
    use App\Services\Generator\CodeGenerator;
    use DB;
    use Exception;
    use Illuminate\Contracts\Foundation\Application;
    use Illuminate\Contracts\View\Factory;
    use Illuminate\Contracts\View\View;
    use Illuminate\Http\RedirectResponse;
    use Illuminate\Http\Request;
    use Illuminate\Http\Response;

    class ProductTypeController extends Controller
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
            $product_types = ProductType::orderByDesc('updated_at')->get();
            return view('admin.pages.products.product-types.index', compact('product_types'));
        }

        /**
         * Show the form for creating a new resource.
         *
         * @return Application|Factory|View
         */
        public function create()
        {
            return view('admin.pages.products.product-types.create');
        }

        /**
         * Store a newly created resource in storage.
         *
         * @param ProductTypeRequest $request
         * @return RedirectResponse
         * @throws \Throwable
         */
        public function store(ProductTypeRequest $request)
        {
            DB::beginTransaction();
            try {
                ProductType::create([
                    'name' => $request->input('name'),
                    'shortcut' => $request->input('shortcut')
                ]);
                DB::commit();

                return redirect()
                    ->route('admin.product.type.index')
                    ->with([
                    'alert-type' => 'success_toast',
                    'message' => $this->_className . ' Created Successfully!',
                ]);
            } catch (Exception $exception) {
                DB::rollBack();
                report($exception);
                return redirect()
                    ->with([
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
            $product_type = ProductType::findOrFail($id);
            return view('admin.pages.products.product-types.edit', compact('product_type'));
        }

        /**
         * Update the specified resource in storage.
         *
         * @param Request $request
         * @param int $id
         * @return RedirectResponse
         * @throws \Throwable
         */
        public function update(Request $request, $id)
        {
            DB::beginTransaction();
            try {
                $product_type = ProductType::findOrFail($id);
                $product_type->update([
                    'name' => $request->input('name'),
                    'shortcut' => $request->input('shortcut')
                ]);
                DB::commit();
                return redirect()
                    ->route('admin.product.type.index')
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
         * @return \Illuminate\Http\JsonResponse
         * @throws \Throwable
         */
        public function destroy($id)
        {
            DB::beginTransaction();
            try {
                $product_type = ProductType::findOrFail($id);
                $product_type->delete();
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
