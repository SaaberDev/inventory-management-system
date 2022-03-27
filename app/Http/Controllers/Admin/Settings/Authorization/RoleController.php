<?php

    namespace App\Http\Controllers\Admin\Settings\Authorization;

    use App\Http\Controllers\Controller;
    use App\Http\Requests\Admin\Settings\Authorization\RoleRequest;
    use Arr;
    use DB;
    use Exception;
    use Illuminate\Contracts\Foundation\Application;
    use Illuminate\Contracts\View\Factory;
    use Illuminate\Contracts\View\View;
    use Illuminate\Http\JsonResponse;
    use Illuminate\Http\RedirectResponse;
    use Illuminate\Http\Request;
    use Illuminate\Http\Response;
    use Spatie\Permission\Models\Permission;
    use Spatie\Permission\Models\Role;
    use Throwable;

    class RoleController extends Controller
    {
        /**
         * Display a listing of the resource.
         *
         * @return Application|Factory|View|Response
         */
        public function index()
        {
            return view('admin.pages.settings.authorization.role.index');
        }

        /**
         * Show the form for creating a new resource.
         *
         * @return Application|Factory|View|Response
         */
        public function create()
        {
            $dashboardPermissions = Permission::where('group_name', '=', 'dashboard')->get();
            $clientsPermissions = Permission::where('group_name', '=', 'clients')->get();
            $suppliersPermissions = Permission::where('group_name', '=', 'suppliers')->get();
            $unitPermissions = Permission::where('group_name', '=', 'unit')->get();
            $warehousePermissions = Permission::where('group_name', '=', 'warehouse')->get();
            $releasePermissions = Permission::where('group_name', '=', 'release')->get();
            $stockPermissions = Permission::where('group_name', '=', 'stock')->get();
            $transferPermissions = Permission::where('group_name', '=', 'transfer')->get();
            $expenseCategoryPermissions = Permission::where('group_name', '=', 'expense_category')->get();
            $expensePermissions = Permission::where('group_name', '=', 'expense')->get();
            $purchasePermissions = Permission::where('group_name', '=', 'purchase')->get();
            $salesPermissions = Permission::where('group_name', '=', 'sales')->get();
            $productPermissions = Permission::where('group_name', '=', 'product')->get();
            $productTypePermissions = Permission::where('group_name', '=', 'product_type')->get();
            $administrationPermissions = Permission::where('group_name', '=', 'administration')->get();
            $groupPermissions = Permission::where('group_name', '=', 'group_permission')->get();

            return view('admin.pages.settings.authorization.role.create',
                compact('dashboardPermissions', 'unitPermissions','suppliersPermissions','clientsPermissions','administrationPermissions','warehousePermissions','stockPermissions','releasePermissions','transferPermissions','expenseCategoryPermissions','expensePermissions','salesPermissions','purchasePermissions','groupPermissions', 'productTypePermissions', 'productPermissions')
            );
        }

        /**
         * Store a newly created resource in storage.
         *
         * @param RoleRequest $request
         * @return RedirectResponse
         * @throws Throwable
         */
        public function store(RoleRequest $request)
        {
            $dashboardPermissions = $request->input('dashboard');
            $administrationPermissions = $request->input('administration');
            $groupPermissions = $request->input('group_permission');
            $clientsPermissions = $request->input('clients');
            $suppliersPermissions = $request->input('suppliers');
            $unitPermissions = $request->input('unit');
            $warehousePermissions = $request->input('warehouse');
            $releasePermissions = $request->input('release');
            $stockPermissions = $request->input('stock');
            $transferPermissions = $request->input('transfer');
            $expenseCategoryPermissions = $request->input('expense_category');
            $expensePermissions = $request->input('expense');
            $purchasePermissions = $request->input('purchase');
            $salesPermissions = $request->input('sales');
            $productPermissions = $request->input('product');
            $productTypePermissions = $request->input('product_type');

            DB::beginTransaction();
            try {
                $role = Role::create([
                    'name' => $request->input('role_name'),
                    'guard_name' => 'web'
                ]);


                $role->givePermissionTo([$dashboardPermissions, $administrationPermissions, $groupPermissions,$clientsPermissions,$suppliersPermissions,$unitPermissions,$warehousePermissions
                    ,$releasePermissions,$stockPermissions,$transferPermissions,$expenseCategoryPermissions,$expensePermissions
                    ,$purchasePermissions,$salesPermissions,$productPermissions,$productTypePermissions]);

                DB::commit();
                return back()->with([
                    'alert-type' => 'success_toast',
                    'message' => 'Role Created Successfully!',
                ]);
            } catch (Exception $exception) {
                DB::rollBack();
                report($exception);
                return back()->with([
                    'alert-type' => 'warning_toast',
                    'message' => 'Opps, Something went wrong!',
                ]);
            }
        }

        /**
         * Show the form for editing the specified resource.
         *
         * @param int $id
         * @return Application|Factory|View
         */
        public function edit(int $id)
        {
            $role = Role::findById($id);
            $dashboardPermissions = Permission::where('group_name', '=', 'dashboard')->get();
            $clientsPermissions = Permission::where('group_name', '=', 'clients')->get();
            $suppliersPermissions = Permission::where('group_name', '=', 'suppliers')->get();
            $unitPermissions = Permission::where('group_name', '=', 'unit')->get();
            $warehousePermissions = Permission::where('group_name', '=', 'warehouse')->get();
            $releasePermissions = Permission::where('group_name', '=', 'release')->get();
            $stockPermissions = Permission::where('group_name', '=', 'stock')->get();
            $transferPermissions = Permission::where('group_name', '=', 'transfer')->get();
            $expenseCategoryPermissions = Permission::where('group_name', '=', 'expense_category')->get();
            $expensePermissions = Permission::where('group_name', '=', 'expense')->get();
            $purchasePermissions = Permission::where('group_name', '=', 'purchase')->get();
            $salesPermissions = Permission::where('group_name', '=', 'sales')->get();
            $productPermissions = Permission::where('group_name', '=', 'product')->get();
            $productTypePermissions = Permission::where('group_name', '=', 'product_type')->get();
            $administrationPermissions = Permission::where('group_name', '=', 'administration')->get();
            $groupPermissions = Permission::where('group_name', '=', 'group_permission')->get();

            return \view('admin.pages.settings.authorization.role.edit',
                compact('role','dashboardPermissions', 'unitPermissions','suppliersPermissions','clientsPermissions','administrationPermissions','warehousePermissions','stockPermissions','releasePermissions','transferPermissions','expenseCategoryPermissions','expensePermissions','salesPermissions','purchasePermissions','groupPermissions', 'productTypePermissions', 'productPermissions'));
        }

        /**
         * Update the specified resource in storage.
         *
         * @param RoleRequest $request
         * @param int $id
         * @return RedirectResponse
         * @throws Throwable
         */
        public function update(RoleRequest $request, int $id): RedirectResponse
        {
            $role = Role::findById($id);
            $dashboardPermissions = $request->input('dashboard');
            $administrationPermissions = $request->input('administration');
            $groupPermissions = $request->input('group_permission');
            $clientsPermissions = $request->input('clients');
            $suppliersPermissions = $request->input('suppliers');
            $unitPermissions = $request->input('unit');
            $warehousePermissions = $request->input('warehouse');
            $releasePermissions = $request->input('release');
            $stockPermissions = $request->input('stock');
            $transferPermissions = $request->input('transfer');
            $expenseCategoryPermissions = $request->input('expense_category');
            $expensePermissions = $request->input('expense');
            $purchasePermissions = $request->input('purchase');
            $salesPermissions = $request->input('sales');
            $productPermissions = $request->input('product');
            $productTypePermissions = $request->input('product_type');

            DB::beginTransaction();
            try {
                $role->update([
                    'name' => $request->input('role_name'),
                    'guard_name' => 'web'
                ]);
                DB::table('role_has_permissions')->where('role_id',$id)->delete();

                $role->givePermissionTo([$dashboardPermissions, $administrationPermissions, $groupPermissions,$clientsPermissions,$suppliersPermissions,$unitPermissions,$warehousePermissions
                    ,$releasePermissions,$stockPermissions,$transferPermissions,$expenseCategoryPermissions,$expensePermissions
                    ,$purchasePermissions,$salesPermissions,$productPermissions,$productTypePermissions]);


                DB::commit();
                return back()->with([
                    'alert-type' => 'success_toast',
                    'message' => 'Role Created Successfully!',
                ]);
            } catch (Exception $exception) {
                DB::rollBack();
                report($exception);
                return back()->with([
                    'alert-type' => 'warning_toast',
                    'message' => 'Opps, Something went wrong!',
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
        public function destroy(int $id): JsonResponse
        {
            DB::beginTransaction();
            try {
                $role = Role::findOrFail($id);
                $role->delete();
                DB::commit();
                return \response()->json([
                    'alert_type' => 'success',
                    'message' => 'Role Deleted Successfully!',
                ]);
            } catch (Exception $exception) {
                DB::rollBack();
                report($exception);
                return \response()->json([
                    'alert_type' => 'warning',
                    'message' => 'Opps, Something went wrong!',
                ]);
            }
        }
    }
