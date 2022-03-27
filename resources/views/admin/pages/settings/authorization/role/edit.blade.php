@extends('layouts.app-admin')
@section('title', 'Add New Role')

@push('styles')
    <style>

    </style>
@endpush

@section('add-new-button')
    <a type="button" href="{{ route('admin.settings.authorization.groupPermission.index') }}" class="btn btn-info btn-sm float-sm-right">View List</a>
@endsection

@section('content')
    <div class="card">
        <div class="card-header">
            <h3 class="card-title">Add New Role</h3>
        </div>
        <!-- /.card-header -->
        <div class="card-body">
            <form action="{{ route('admin.settings.authorization.groupPermission.update', $role->id) }}" method="POST">
                @csrf @method('PATCH')
                <div class="form-group">
                    <label class="col-form-label" for="inputError">
                        Role Name
                    </label>
                    <input type="text" name="role_name" value="{{ $role->name ?? old('role_name') }}" class="form-control {{ $errors->has('role_name') ? ' is-invalid' : '' }}" id="inputError" placeholder="">
                    <span class="ref">***Use lowercase letter and underscores. (i.e. admin, super_admin)</span>
                    @if($errors->has('role_name'))
                        <span class="invalid-feedback">
                            <strong>{{ $errors->first('role_name') }}</strong>
                        </span>
                    @endif
                </div>

                <hr>


                <div class="row">
                    <div class="col-sm-6">
                        <label class="col-form-label">
                            Assign Permissions
                        </label>
                    </div>

                    <div class="col-sm-6 text-right">
                        @if($errors->has('dashboard'))
                            <span class="text-danger" style="font-size: 80%">
                                <strong>{{ $errors->first('dashboard') }}</strong>
                            </span>
                        @elseif($errors->has('administration'))
                            <span class="text-danger" style="font-size: 80%">
                                <strong>{{ $errors->first('administration') }}</strong>
                            </span>
                        @elseif($errors->has('group_permission'))
                            <span class="text-danger" style="font-size: 80%">
                                <strong>{{ $errors->first('group_permission') }}</strong>
                            </span>
                        @endif
                    </div>
                </div>

                <hr>

                <div class="row">
                    <div class="col-sm-12">

                        {{-- All Permission --}}
                        <div>
                            <div class="form-group">
                                <label class="checkbox">
                                    <input class="form-check-input"
                                           id="all"
                                           name="all"
                                           type="checkbox"
                                        {{ old('all') == 'on' || checkIfGroupHasPermission($role, $dashboardPermissions, $administrationPermissions, $groupPermissions, 'all') ? 'checked="checked"' : '' }}
                                    >
                                    <span>All Permissions</span>
                                </label>
                            </div>
                        </div>

                        <hr>

                        {{-- Dashboard Permission --}}
                        <div class="row">
                            <div class="col-sm-12">
                                <div>
                                    <div class="form-group">
                                        <label class="checkbox">
                                            <input class="form-check-input all"
                                                   id="dashboard"
                                                   name="allDashboard"
                                                   type="checkbox"
                                                {{ old('allDashboard') == 'on' || checkIfGroupHasPermission($role, $dashboardPermissions, 'dashboard') ? 'checked="checked"' : '' }}
                                            >
                                            <span>{{ permissionGroupName($dashboardPermissions) }}</span>
                                        </label>
                                    </div>
                                </div>
                                <hr>

                                <div class="row">
                                    <div class="col-sm-12">
                                        <div class="form-group">
                                            @foreach($dashboardPermissions as $dashboardPermission)
                                                <label class="checkbox">
                                                    <input class="form-check-input dashboard all"
                                                           value="{{ $dashboardPermission->id }}"
                                                           name="dashboard[]"
                                                           type="checkbox"
                                                        {{ (is_array(old('dashboard')) && in_array($dashboardPermission->id, old('dashboard'))) || count($role->permissions->where('id', $dashboardPermission->id)) ? 'checked="checked"' : '' }}
                                                    >
                                                    <span>{{ ucfirst($dashboardPermission->title) }}</span>
                                                </label>
                                            @endforeach
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <hr>

                        {{-- Product Permission --}}
                        <div class="row">
                            <div class="col-sm-12">
                                <label class="form-check-label text-bold" for="settings">Products</label>
                                <hr>

                                <div class="row">
                                    {{-- Products Permission --}}
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <label class="checkbox" for="product">
                                                <input class="form-check-input all"
                                                       id="product"
                                                       name="allProduct"
                                                       type="checkbox"
                                                    {{ old('allProduct') == 'on' || checkIfGroupHasPermission($role, $productPermissions, 'product') ? 'checked="checked"' : '' }}
                                                >
                                                <span>{{ permissionGroupName($productPermissions) }}</span>
                                            </label>
                                            <hr>

                                            @foreach($productPermissions as $productPermission)
                                                <label class="checkbox">
                                                    <input class="form-check-input product all"
                                                           value="{{ $productPermission->id }}"
                                                           name="product[]"
                                                           type="checkbox"
                                                        {{ (is_array(old('product')) && in_array($productPermission->id, old('product'))) || count($role->permissions->where('id', $productPermission->id)) ? 'checked="checked"' : '' }}
                                                    >
                                                    <span>{{ ucfirst($productPermission->title) }}</span>
                                                </label>
                                            @endforeach
                                        </div>
                                    </div>

                                    {{-- Product Type Permission --}}
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <label class="checkbox" for="product_type">
                                                <input class="form-check-input all"
                                                       id="product_type"
                                                       name="allProduct_type"
                                                       type="checkbox"
                                                    {{ old('allProduct_type') == 'on' || checkIfGroupHasPermission($role, $productTypePermissions, 'product_type') ? 'checked="checked"' : '' }}
                                                >
                                                <span>{{ permissionGroupName($productTypePermissions) }}</span>
                                            </label>
                                            <hr>

                                            @foreach($productTypePermissions as $productTypePermission)
                                                <label class="checkbox">
                                                    <input class="form-check-input product_type all"
                                                           value="{{ $productTypePermission->id }}"
                                                           name="product_type[]"
                                                           type="checkbox"
                                                        {{ (is_array(old('product_type')) && in_array($productTypePermission->id, old('product_type'))) || count($role->permissions->where('id', $productTypePermission->id)) ? 'checked="checked"' : '' }}
                                                    >
                                                    <span>{{ ucfirst($productTypePermission->title) }}</span>
                                                </label>
                                            @endforeach
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <hr>

                        {{-- sales Permission --}}
                        <div class="row">
                            <div class="col-sm-12">
                                <label class="form-check-label text-bold" for="settings">Sales</label>
                                <hr>

                                <div class="row">
                                    {{-- Products Permission --}}
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <label class="checkbox" for="sales">
                                                <input class="form-check-input all"
                                                       id="sales"
                                                       name="allsales"
                                                       type="checkbox"
                                                    {{ old('allsales') == 'on' || checkIfGroupHasPermission($role, $salesPermissions, 'sales') ? 'checked="checked"' : '' }}
                                                >
                                                <span>{{ permissionGroupName($salesPermissions) }}</span>
                                            </label>
                                            <hr>

                                            @foreach($salesPermissions as $salesPermission)
                                                <label class="checkbox">
                                                    <input class="form-check-input sales all"
                                                           value="{{ $salesPermission->id }}"
                                                           name="sales[]"
                                                           type="checkbox"
                                                        {{ (is_array(old('sales')) && in_array($salesPermission->id, old('sales'))) || count($role->permissions->where('id', $salesPermission->id)) ? 'checked="checked"' : '' }}
                                                    >
                                                    <span>{{ ucfirst($salesPermission->title) }}</span>
                                                </label>
                                            @endforeach
                                        </div>
                                    </div>

                                    {{-- Product Type Permission --}}
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <label class="checkbox" for="purchase">
                                                <input class="form-check-input all"
                                                       id="purchase"
                                                       name="allpurchase"
                                                       type="checkbox"
                                                    {{ old('allpurchase') == 'on' || checkIfGroupHasPermission($role, $purchasePermissions, 'purchase') ? 'checked="checked"' : '' }}
                                                >
                                                <span>{{ permissionGroupName($purchasePermissions) }}</span>
                                            </label>
                                            <hr>

                                            @foreach($purchasePermissions as $purchasePermission)
                                                <label class="checkbox">
                                                    <input class="form-check-input purchase all"
                                                           value="{{ $purchasePermission->id }}"
                                                           name="purchase[]"
                                                           type="checkbox"
                                                        {{ (is_array(old('purchase')) && in_array($purchasePermission->id, old('purchase'))) || count($role->permissions->where('id', $purchasePermission->id)) ? 'checked="checked"' : '' }}
                                                    >
                                                    <span>{{ ucfirst($purchasePermission->title) }}</span>
                                                </label>
                                            @endforeach
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <hr>
                        {{-- Expense Permission --}}
                        <div class="row">
                            <div class="col-sm-12">
                                <label class="form-check-label text-bold" for="settings">Expense</label>
                                <hr>

                                <div class="row">
                                    {{-- Products Permission --}}
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <label class="checkbox" for="expense">
                                                <input class="form-check-input all"
                                                       id="expense"
                                                       name="allexpense"
                                                       type="checkbox"
                                                    {{ old('allexpense') == 'on' || checkIfGroupHasPermission($role, $expensePermissions, 'expense') ? 'checked="checked"' : '' }}
                                                >
                                                <span>{{ permissionGroupName($expensePermissions) }}</span>
                                            </label>
                                            <hr>

                                            @foreach($expensePermissions as $expensePermission)
                                                <label class="checkbox">
                                                    <input class="form-check-input expense all"
                                                           value="{{ $expensePermission->id }}"
                                                           name="expense[]"
                                                           type="checkbox"
                                                        {{ (is_array(old('expense')) && in_array($expensePermission->id, old('expense'))) || count($role->permissions->where('id', $expensePermission->id)) ? 'checked="checked"' : '' }}
                                                    >
                                                    <span>{{ ucfirst($expensePermission->title) }}</span>
                                                </label>
                                            @endforeach
                                        </div>
                                    </div>

                                    {{-- Product Type Permission --}}
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <label class="checkbox" for="category">
                                                <input class="form-check-input all"
                                                       id="category"
                                                       name="allcategory"
                                                       type="checkbox"
                                                    {{ old('allcategory') == 'on' || checkIfGroupHasPermission($role, $expenseCategoryPermissions, 'category') ? 'checked="checked"' : '' }}
                                                >
                                                <span>{{ permissionGroupName($expenseCategoryPermissions) }}</span>
                                            </label>
                                            <hr>

                                            @foreach($expenseCategoryPermissions as $expenseCategoryPermission)
                                                <label class="checkbox">
                                                    <input class="form-check-input category all"
                                                           value="{{ $expenseCategoryPermission->id }}"
                                                           name="category[]"
                                                           type="checkbox"
                                                        {{ (is_array(old('category')) && in_array($expenseCategoryPermission->id, old('category'))) || count($role->permissions->where('id', $expenseCategoryPermission->id)) ? 'checked="checked"' : '' }}
                                                    >
                                                    <span>{{ ucfirst($expenseCategoryPermission->title) }}</span>
                                                </label>
                                            @endforeach
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <hr>
                        {{-- Transfer Permission --}}
                        <div class="row">
                            <div class="col-sm-12">
                                <label class="form-check-label text-bold" for="settings">Transfer</label>
                                <hr>

                                <div class="row">
                                    {{-- Products Permission --}}
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <label class="checkbox" for="transfer">
                                                <input class="form-check-input all"
                                                       id="transfer"
                                                       name="alltransfer"
                                                       type="checkbox"
                                                    {{ old('alltransfer') == 'on' || checkIfGroupHasPermission($role, $transferPermissions, 'transfer') ? 'checked="checked"' : '' }}
                                                >
                                                <span>{{ permissionGroupName($transferPermissions) }}</span>
                                            </label>
                                            <hr>

                                            @foreach($transferPermissions as $transferPermission)
                                                <label class="checkbox">
                                                    <input class="form-check-input transfer all"
                                                           value="{{ $transferPermission->id }}"
                                                           name="transfer[]"
                                                           type="checkbox"
                                                        {{ (is_array(old('transfer')) && in_array($transferPermission->id, old('transfer'))) || count($role->permissions->where('id', $transferPermission->id)) ? 'checked="checked"' : '' }}
                                                    >
                                                    <span>{{ ucfirst($transferPermission->title) }}</span>
                                                </label>
                                            @endforeach
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>
                        <hr>
                        {{-- stock Permission --}}
                        <div class="row">
                            <div class="col-sm-12">
                                <label class="form-check-label text-bold" for="settings">Stock</label>
                                <hr>

                                <div class="row">
                                    {{-- Products Permission --}}
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <label class="checkbox" for="stock">
                                                <input class="form-check-input all"
                                                       id="stock"
                                                       name="allstock"
                                                       type="checkbox"
                                                    {{ old('allstock') == 'on' || checkIfGroupHasPermission($role, $stockPermissions, 'stock') ? 'checked="checked"' : '' }}
                                                >
                                                <span>{{ permissionGroupName($stockPermissions) }}</span>
                                            </label>
                                            <hr>

                                            @foreach($stockPermissions as $stockPermission)
                                                <label class="checkbox">
                                                    <input class="form-check-input stock all"
                                                           value="{{ $stockPermission->id }}"
                                                           name="stock[]"
                                                           type="checkbox"
                                                        {{ (is_array(old('stock')) && in_array($stockPermission->id, old('stock'))) || count($role->permissions->where('id', $stockPermission->id)) ? 'checked="checked"' : '' }}
                                                    >
                                                    <span>{{ ucfirst($stockPermission->title) }}</span>
                                                </label>
                                            @endforeach
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>
                        <hr>
                        {{-- release Permission --}}
                        <div class="row">
                            <div class="col-sm-12">
                                <label class="form-check-label text-bold" for="settings">Release</label>
                                <hr>

                                <div class="row">
                                    {{-- Products Permission --}}
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <label class="checkbox" for="release">
                                                <input class="form-check-input all"
                                                       id="release"
                                                       name="allrelease"
                                                       type="checkbox"
                                                    {{ old('allrelease') == 'on' || checkIfGroupHasPermission($role, $releasePermissions, 'release') ? 'checked="checked"' : '' }}
                                                >
                                                <span>{{ permissionGroupName($releasePermissions) }}</span>
                                            </label>
                                            <hr>

                                            @foreach($releasePermissions as $releasePermission)
                                                <label class="checkbox">
                                                    <input class="form-check-input release all"
                                                           value="{{ $releasePermission->id }}"
                                                           name="release[]"
                                                           type="checkbox"
                                                        {{ (is_array(old('release')) && in_array($releasePermission->id, old('release'))) || count($role->permissions->where('id', $releasePermission->id)) ? 'checked="checked"' : '' }}
                                                    >
                                                    <span>{{ ucfirst($releasePermission->title) }}</span>
                                                </label>
                                            @endforeach
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>

                        <hr>

                        {{-- Settings Permission --}}
                        <div class="row">
                            <div class="col-sm-12">
                                <label class="form-check-label text-bold" for="settings">Settings</label>
                                <hr>
                                <div class="row">
                                    {{-- Administration Permission --}}
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <label class="checkbox" for="unit">
                                                <input class="form-check-input all"
                                                       id="unit"
                                                       name="allunit"
                                                       type="checkbox"
                                                    {{ old('allunit') == 'on' || checkIfGroupHasPermission($role, $unitPermissions, 'unit') ? 'checked="checked"' : '' }}
                                                >
                                                <span>{{ permissionGroupName($unitPermissions) }}</span>
                                            </label>
                                            <hr>

                                            @foreach($unitPermissions as $unitPermission)
                                                <label class="checkbox">
                                                    <input class="form-check-input unit all"
                                                           value="{{ $unitPermission->id }}"
                                                           name="unit[]"
                                                           type="checkbox"
                                                        {{ (is_array(old('unit')) && in_array($unitPermission->id, old('unit'))) || count($role->permissions->where('id', $unitPermission->id)) ? 'checked="checked"' : '' }}
                                                    >
                                                    <span>{{ ucfirst($unitPermission->title) }}</span>
                                                </label>
                                            @endforeach
                                        </div>
                                    </div>

                                    {{-- Group permission Permission --}}
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <label class="checkbox" for="warehouse">
                                                <input class="form-check-input all"
                                                       id="warehouse"
                                                       name="allwarehousen"
                                                       type="checkbox"
                                                    {{ old('allwarehouse') == 'on' || checkIfGroupHasPermission($role, $warehousePermissions, 'warehouse') ? 'checked="checked"' : '' }}
                                                >
                                                <span>{{ permissionGroupName($warehousePermissions) }}</span>
                                            </label>
                                            <hr>

                                            @foreach($warehousePermissions as $warehousePermissions)
                                                <label class="checkbox">
                                                    <input class="form-check-input warehouse all"
                                                           value="{{ $warehousePermissions->id }}"
                                                           name="warehouse[]"
                                                           type="checkbox"
                                                        {{ (is_array(old('warehouse')) && in_array($warehousePermissions->id, old('warehouse'))) || count($role->permissions->where('id', $warehousePermissions->id)) ? 'checked="checked"' : '' }}
                                                    >
                                                    <span>{{ ucfirst($warehousePermissions->title) }}</span>
                                                </label>
                                            @endforeach
                                        </div>
                                    </div>
                                </div>
                                <hr>
                                <div class="row">
                                    {{-- Administration Permission --}}
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <label class="checkbox" for="clients">
                                                <input class="form-check-input all"
                                                       id="clients"
                                                       name="allclients"
                                                       type="checkbox"
                                                    {{ old('allclients') == 'on' || checkIfGroupHasPermission($role, $clientsPermissions, 'clients') ? 'checked="checked"' : '' }}
                                                >
                                                <span>{{ permissionGroupName($clientsPermissions) }}</span>
                                            </label>
                                            <hr>

                                            @foreach($clientsPermissions as $clientsPermission)
                                                <label class="checkbox">
                                                    <input class="form-check-input clients all"
                                                           value="{{ $clientsPermission->id }}"
                                                           name="clients[]"
                                                           type="checkbox"
                                                        {{ (is_array(old('clients')) && in_array($clientsPermission->id, old('clients'))) || count($role->permissions->where('id', $clientsPermission->id)) ? 'checked="checked"' : '' }}
                                                    >
                                                    <span>{{ ucfirst($clientsPermission->title) }}</span>
                                                </label>
                                            @endforeach
                                        </div>
                                    </div>

                                    {{-- Group permission Permission --}}
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <label class="checkbox" for="suppliers">
                                                <input class="form-check-input all"
                                                       id="suppliers"
                                                       name="allsuppliers"
                                                       type="checkbox"
                                                    {{ old('allsuppliers') == 'on' || checkIfGroupHasPermission($role, $suppliersPermissions, 'suppliers') ? 'checked="checked"' : '' }}
                                                >
                                                <span>{{ permissionGroupName($suppliersPermissions) }}</span>
                                            </label>
                                            <hr>

                                            @foreach($suppliersPermissions as $suppliersPermission)
                                                <label class="checkbox">
                                                    <input class="form-check-input suppliers all"
                                                           value="{{ $suppliersPermission->id }}"
                                                           name="suppliers[]"
                                                           type="checkbox"
                                                        {{ (is_array(old('suppliers')) && in_array($suppliersPermission->id, old('suppliers'))) || count($role->permissions->where('id', $suppliersPermission->id)) ? 'checked="checked"' : '' }}
                                                    >
                                                    <span>{{ ucfirst($suppliersPermission->title) }}</span>
                                                </label>
                                            @endforeach
                                        </div>
                                    </div>
                                </div>
                                <hr>
                                <div class="row">
                                    {{-- Administration Permission --}}
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <label class="checkbox" for="administration">
                                                <input class="form-check-input all"
                                                       id="administration"
                                                       name="allAdministration"
                                                       type="checkbox"
                                                    {{ old('allAdministration') == 'on' || checkIfGroupHasPermission($role, $administrationPermissions, 'administration') ? 'checked="checked"' : '' }}
                                                >
                                                <span>{{ permissionGroupName($administrationPermissions) }}</span>
                                            </label>
                                            <hr>

                                            @foreach($administrationPermissions as $administrationPermission)
                                                <label class="checkbox">
                                                    <input class="form-check-input administration all"
                                                           value="{{ $administrationPermission->id }}"
                                                           name="administration[]"
                                                           type="checkbox"
                                                        {{ (is_array(old('administration')) && in_array($administrationPermission->id, old('administration'))) || count($role->permissions->where('id', $administrationPermission->id)) ? 'checked="checked"' : '' }}
                                                    >
                                                    <span>{{ ucfirst($administrationPermission->title) }}</span>
                                                </label>
                                            @endforeach
                                        </div>
                                    </div>

                                    {{-- Group permission Permission --}}
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <label class="checkbox" for="group_permission">
                                                <input class="form-check-input all"
                                                       id="group_permission"
                                                       name="allGroup_permission"
                                                       type="checkbox"
                                                    {{ old('allGroup_permission') == 'on' || checkIfGroupHasPermission($role, $groupPermissions, 'group_permission') ? 'checked="checked"' : '' }}
                                                >
                                                <span>{{ permissionGroupName($groupPermissions) }}</span>
                                            </label>
                                            <hr>

                                            @foreach($groupPermissions as $groupPermission)
                                                <label class="checkbox">
                                                    <input class="form-check-input group_permission all"
                                                           value="{{ $groupPermission->id }}"
                                                           name="group_permission[]"
                                                           type="checkbox"
                                                        {{ (is_array(old('group_permission')) && in_array($groupPermission->id, old('group_permission'))) || count($role->permissions->where('id', $groupPermission->id)) ? 'checked="checked"' : '' }}
                                                    >
                                                    <span>{{ ucfirst($groupPermission->title) }}</span>
                                                </label>
                                            @endforeach
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>




                        <div class="row">
                            <div class="col-sm-12">
                                <button type="submit" class="btn btn-info btn-sm float-right">Submit</button>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
        <!-- /.card-body -->
    </div>
@endsection

@push('scripts')
    <script src="{{ mix('_assets/plugins/group_permission_checkbox/js/group_permission.js') }}"></script>
@endpush
