<?php

    namespace App\Http\Controllers\Admin\Settings;

    use App\Http\Controllers\Controller;
    use App\Http\Requests\Admin\Settings\SupplierRequest;
    use App\Models\Supplier;
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
    use function response;

    class SupplierController extends Controller
    {
        /**
         * Display a listing of the resource.
         *
         * @return Application|Factory|View|Response
         */
        public function index()
        {
            $suppliers = Supplier::all();
            return view('admin.pages.settings.suppliers.index', compact('suppliers'));
        }

        /**
         * Show the form for creating a new resource.
         *
         * @return Application|Factory|View|Response
         */
        public function create()
        {
            return view('admin.pages.settings.suppliers.create');
        }

        /**
         * Store a newly created resource in storage.
         *
         * @param SupplierRequest $request
         * @return RedirectResponse
         * @throws Throwable
         */
        public function store(SupplierRequest $request)
        {
            DB::beginTransaction();
            try {
                Supplier::create([
                    'name' => $request->input('name'),
                    'phone' => $request->input('phone'),
                    'email' => $request->input('email'),
                    'country' => $request->input('country'),
                    'city' => $request->input('city'),
                    'address' => $request->input('address'),
                ]);
                DB::commit();
                return back()->with([
                    'alert-type' => 'success_toast',
                    'message' => 'Supplier Created Successfully!',
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
         * @return Application|Factory|View|Response
         */
        public function edit($id)
        {
            $supplier = Supplier::findOrFail($id);
            return view('admin.pages.settings.suppliers.edit', compact('supplier'));
        }

        /**
         * Update the specified resource in storage.
         *
         * @param SupplierRequest $request
         * @param int $id
         * @return RedirectResponse
         * @throws Throwable
         */
        public function update(SupplierRequest $request, $id)
        {
            $supplier = Supplier::findOrFail($id);
            DB::beginTransaction();
            try {
                $supplier->update([
                    'name' => $request->input('name'),
                    'phone' => $request->input('phone'),
                    'email' => $request->input('email'),
                    'country' => $request->input('country'),
                    'city' => $request->input('city'),
                    'address' => $request->input('address'),
                ]);
                DB::commit();
                return redirect()
                    ->route('admin.settings.suppliers.index')
                    ->with([
                        'alert-type' => 'success_toast',
                        'message' => 'Supplier Updated Successfully!',
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
                $supplier = Supplier::findOrFail($id);
                $supplier->delete();
                DB::commit();
                return response()->json([
                    'alert_type' => 'success',
                    'message' => 'Supplier Deleted Successfully!',
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
