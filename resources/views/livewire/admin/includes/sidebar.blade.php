<ul class="nav nav-pills nav-sidebar flex-column nav-compact nav-child-indent nav-legacy" data-widget="treeview" role="menu" data-accordion="false">
    {{-- Add icons to the links using the .nav-icon class
    with font-awesome or any other icon font library --}}

    {{-- Dashboard --}}
    <li class="nav-item">
        <a href="{{ route('admin.dashboard.index') }}" class="nav-link {{ Route::is('admin.dashboard.*') ? 'active' : '' }}">
            <i class="nav-icon fas fa-tachometer-alt"></i>
            <p>
                Dashboard
            </p>
        </a>
    </li>

    {{-- Products --}}
    @can('product.*')
        <li class="nav-header">PRODUCTS</li>
        @can('product.index')
            <li wire:ignore class="nav-item">
                <a href="{{ route('admin.product.self.index') }}" class="nav-link {{ Route::is('admin.product.self.*') ? 'active' : '' }}">
                    <i class="nav-icon fas fa-list-alt"></i>
                    <p>
                        Products
                    </p>
                </a>
            </li>
        @endcan
        @can('product_type.index')
            <li wire:ignore class="nav-item">
                <a href="{{ route('admin.product.type.index') }}" class="nav-link {{ Route::is('admin.product.type.*') ? 'active' : '' }}">
                    <i class="nav-icon fas fa-tags"></i>
                    <p>
                        Types
                    </p>
                </a>
            </li>
        @endcan
    @endcan

    {{-- Purchase --}}
    @can('purchase.index')
        <li class="nav-header">PURCHASE</li>
        <li wire:ignore class="nav-item">
            <a href="{{ route('admin.purchase.self.index') }}" class="nav-link {{ Route::is('admin.purchase.self.*') ? 'active' : '' }}">
                <i class="nav-icon fas fa-truck-loading"></i>
                <p>
                    Purchases
                </p>
            </a>
        </li>
    @endcan

    {{--<li class="nav-item">
        <a href="/dashboard/purchase/damaged" class="nav-link {{ Route::is('admin.purchase.damaged.*') ? 'active' : '' }}">
            <i class="nav-icon fas fa-trash-alt"></i>
            <p>
                Damaged
            </p>
        </a>
    </li>

    <li class="nav-item">
        <a href="/dashboard/purchase/inventory" class="nav-link {{ Route::is('admin.purchase.inventory.*') ? 'active' : '' }}">
            <i class="nav-icon fas fa-undo-alt"></i>
            <p>
                Return
            </p>
        </a>
    </li>--}}

    {{-- Expense --}}
    @if('expense_category.*'||'expense.*')
        @canany(['expense_category.index', 'expense.index'])
            <li class="nav-header">EXPENDITURE</li>
        @endcanany

        @can('expense_category.index')
            <li wire:ignore class="nav-item">
                <a href="{{ route('admin.expense.self.index') }}" class="nav-link {{ Route::is('admin.expense.self.*') ? 'active' : '' }}">
                    <i class="nav-icon fas fa-wallet"></i>
                    <p>
                        Expense
                    </p>
                </a>
            </li>
        @endcan
        @can('expense.index')
            <li wire:ignore class="nav-item">
                <a href="{{ route('admin.expense.category.index') }}" class="nav-link {{ Route::is('admin.expense.category.*') ? 'active' : '' }}">
                    <i class="nav-icon fas fa-tags"></i>
                    <p>
                        Category
                    </p>
                </a>
            </li>
        @endcan
    @endif

    {{-- Transfer --}}
    @can('transfer.index')
        <li class="nav-header">TRANSFER</li>
        <li wire:ignore class="nav-item">
            <a href="{{ route('admin.transfer.index') }}" class="nav-link {{ Route::is('admin.transfer.*') ? 'active' : '' }}">
                <i class="nav-icon fas fa-random"></i>
                <p>
                    Transfer
                </p>
            </a>
        </li>
    @endcan
    {{-- Released Stock --}}
    @can('release.index')
        <li class="nav-header">RELEASED STOCK</li>
        <li wire:ignore class="nav-item">
            <a href="{{ route('admin.release.index') }}" class="nav-link {{ Route::is('admin.release.*') ? 'active' : '' }}">
                <i class="nav-icon fas fa-rocket"></i>
                <p>
                    Released Products
                </p>
            </a>
        </li>
    @endcan

    @can('stock.index')
        {{-- Dynamic Warehouse List --}}
        <li class="nav-header">STOCK BY WAREHOUSES</li>
        @forelse($warehouses as $warehouse)
            <li wire:key="warehouse-{{ $loop->index }}" class="nav-item">
                <a href="{{ route('admin.stock.index', ['id' => $warehouse->id, 'name' => sanitizeQueryParamToUrl($warehouse->name)]) }}" class="nav-link {{ request()->route('id') == $warehouse->id ? 'active' : '' }}">
                    <i class="nav-icon {{ $warehouse->icon }}"></i>
                    <p>
                        {{ ucwords($warehouse->name) }}
                    </p>
                </a>
            </li>
        @empty
            No Warehouses
        @endforelse
    @endcan

    @can('sales.index')
        {{-- Sale --}}
        <li class="nav-header">SALE</li>
        <li wire:ignore class="nav-item">
            <a href="{{ route('admin.sales.self.index') }}" class="nav-link {{ Route::is('admin.sales.self.*') ? 'active' : '' }}">
                <i class="nav-icon fas fa-shopping-bag"></i>
                <p>
                    Sales
                </p>
            </a>
        </li>
    @endcan

    {{--<li class="nav-item">
        <a href="{{ route('admin.purchase.self.index') }}" class="nav-link {{ Route::is('admin.purchase.self.*') ? 'active' : '' }}">
            <i class="nav-icon fas fa-trash-alt"></i>
            <p>
                Damaged
            </p>
        </a>
    </li>

    <li class="nav-item">
        <a href="{{ route('admin.purchase.self.index') }}" class="nav-link {{ Route::is('admin.purchase.self.*') ? 'active' : '' }}">
            <i class="nav-icon fas fa-undo-alt"></i>
            <p>
                Return
            </p>
        </a>
    </li>--}}

    {{-- Report --}}
    @if('dashboard.report.*')
        @canany(['dashboard.report.purchase', 'dashboard.report.sale', 'dashboard.report.expense'])
            <li class="nav-header">REPORT</li>
        @endcanany

        @can('dashboard.report.purchase')
            <li class="nav-item">
                <a href="{{ route('admin.purchase.self.report') }}" class="nav-link {{ Route::is('admin.purchase.report.*') ? 'active' : '' }}">
                    <i class="nav-icon fas fa-truck-loading"></i>
                    <p>
                        Purchase Report
                    </p>
                </a>
            </li>
        @endcan
        @can('dashboard.report.sale')
            <li class="nav-item">
                <a href="{{ route('admin.sales.self.report') }}" class="nav-link {{ Route::is('admin.report.self.*') ? 'active' : '' }}">
                    <i class="nav-icon fas fa-shopping-bag"></i>
                    <p>
                        Sale Report
                    </p>
                </a>
            </li>
        @endcan
        @can('dashboard.report.expense')
            <li class="nav-item">
                <a href="{{ route('admin.expense.self.report') }}" class="nav-link {{ Route::is('admin.expense.self.*') ? 'active' : '' }}">
                    <i class="nav-icon fas fa-wallet"></i>
                    <p>
                        Expense Report
                    </p>
                </a>
            </li>
        @endcan
    @endif

    {{-- Configaration --}}
    @if('settings.*')
        <li class="nav-header">CONFIGURATION</li>
        <li wire:ignore class="nav-item {{ Route::is('admin.settings.*') ? 'menu-open' : '' }}">
            <a href="#" class="nav-link {{ Route::is('admin.settings.*') ? 'active' : '' }}">
                <i class="nav-icon fas fa-cogs"></i>
                <p>
                    Settings
                    <i class="right fas fa-angle-left"></i>
                </p>
            </a>
            <ul class="nav nav-treeview">
                @can('settings.warehouse.index')
                    <li class="nav-item">
                        <a href="{{ route('admin.settings.warehouse.index') }}" class="nav-link {{ Route::is('admin.settings.warehouse.*') ? 'active' : '' }}">
                            <i class="nav-icon fas fa-home"></i>
                            <p>
                                Warehouse
                            </p>
                        </a>
                    </li>
                @endcan
                @can('settings.unit.index')
                    <li class="nav-item">
                        <a href="{{ route('admin.settings.unit.index') }}" class="nav-link {{ Route::is('admin.settings.unit.*') ? 'active' : '' }}">
                            <i class="nav-icon fas fa-calculator"></i>
                            <p>
                                Unit
                            </p>
                        </a>
                    </li>
                @endcan
                @can('settings.suppliers.index')
                    <li class="nav-item">
                        <a href="{{ route('admin.settings.suppliers.index') }}" class="nav-link {{ Route::is('admin.settings.suppliers.*') ? 'active' : '' }}">
                            <i class="nav-icon fas fa-people-carry"></i>
                            <p>
                                Suppliers
                            </p>
                        </a>
                    </li>
                @endcan
                @can('settings.clients.index')
                    <li class="nav-item">
                        <a href="{{ route('admin.settings.clients.index') }}" class="nav-link {{ Route::is('admin.settings.clients.*') ? 'active' : '' }}">
                            <i class="nav-icon fas fa-users"></i>
                            <p>
                                Clients
                            </p>
                        </a>
                    </li>
                @endcan
                @if('settings.group_permission.*'||'settings.administration.*')

                    <li class="nav-item {{ Route::is('admin.settings.authorization.*') ? 'menu-open' : '' }}">
                        <a href="#" class="nav-link {{ Route::is('admin.settings.authorization.*') ? 'active' : '' }}">
                            <i class="fas fa-shield-alt nav-icon"></i>
                            <p>
                                Authorization
                                <i class="right fas fa-angle-left"></i>
                            </p>
                        </a>
                        <ul class="nav nav-treeview">
                            @can('settings.group_permission.index')
                                <li class="nav-item">
                                    <a href="{{ route('admin.settings.authorization.groupPermission.index') }}" class="nav-link {{ Route::is('admin.settings.authorization.groupPermission.*') ? 'active' : '' }}">
                                        <i class="fas fa-fingerprint nav-icon"></i>
                                        <p>Group Permission</p>
                                    </a>
                                </li>
                            @endcan
                            @can('settings.administration.index')
                                <li class="nav-item">
                                    <a href="{{ route('admin.settings.authorization.administration.index') }}" class="nav-link {{ Route::is('admin.settings.authorization.administration.*') ? 'active' : '' }}">
                                        <i class="far fa-user nav-icon"></i>
                                        <p>Administration</p>
                                    </a>
                                </li>
                            @endcan
                        </ul>
                    </li>
                @endcan
            </ul>
        </li>
    @endif
</ul>
