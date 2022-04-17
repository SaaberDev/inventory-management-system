<nav class="main-header navbar navbar-expand navbar-white navbar-light">
    <!-- Left navbar links -->
    <ul class="navbar-nav">
        <li class="nav-item">
            <a class="nav-link" data-widget="pushmenu" href="#" role="button"><i class="fas fa-bars"></i></a>
        </li>

        <li class="nav-item d-none d-sm-inline-block">
            <a href="{{ route('admin.transfer.create') }}" class="nav-link">
                <i class="nav-icon fas fa-random mr-2"></i>
                Transfer
            </a>
        </li>

        <li class="nav-item dropdown">
            <a id="dropdownSubMenu1" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" class="nav-link dropdown-toggle">
                <i class="nav-icon fas fa-box mr-2"></i>
                Inventory
            </a>
            <ul aria-labelledby="dropdownSubMenu1" class="dropdown-menu border-0 shadow">
                <li>
                    <a href="{{ route('admin.stock.index', ['id' => \App\Models\Warehouse::PURCHASE, 'name' => sanitizeQueryParamToUrl('purchase')]) }}" class="dropdown-item">
                        <i class="nav-icon fas fa-truck-loading mr-2"></i>
                        Purchase
                    </a>
                </li>

                <li>
                    <a href="{{ route('admin.stock.index', ['id' => \App\Models\Warehouse::FINISHED, 'name' => sanitizeQueryParamToUrl('sale')]) }}" class="dropdown-item">
                        <i class="nav-icon fas fa-shopping-bag mr-2" style="margin-left: 6px;"></i>
                        Sale
                    </a>
                </li>
            </ul>
        </li>
    </ul>

    <!-- Right navbar links -->
    <ul class="navbar-nav ml-auto">
        {{-- Telescope --}}
        <li class="nav-item">
            <a class="nav-link" href="{{ url('telescope/requests') }}" target="_blank" role="button" data-toggle="tooltip" data-placement="left" title="" data-original-title="Debug Tool">
                <i class="fas fa-desktop"></i>
            </a>
        </li>

        {{-- Fullscreen View --}}
        <li class="nav-item">
            <a class="nav-link" data-widget="fullscreen" href="#" role="button">
                <i class="fas fa-expand-arrows-alt"></i>
            </a>
        </li>

        <!-- Notifications Dropdown Menu -->
        <li class="nav-item dropdown">
            <a class="nav-link" data-toggle="dropdown" href="#">
                <i class="far fa-bell"></i>
                <span class="badge badge-warning navbar-badge">15</span>
            </a>
            <div class="dropdown-menu dropdown-menu-lg dropdown-menu-right">
                <span class="dropdown-item dropdown-header">15 Notifications</span>
                <div class="dropdown-divider"></div>
                <a href="#" class="dropdown-item">
                    <i class="fas fa-envelope mr-2"></i> 4 new messages
                    <span class="float-right text-muted text-sm">3 mins</span>
                </a>
                <div class="dropdown-divider"></div>
                <a href="#" class="dropdown-item">
                    <i class="fas fa-users mr-2"></i> 8 friend requests
                    <span class="float-right text-muted text-sm">12 hours</span>
                </a>
                <div class="dropdown-divider"></div>
                <a href="#" class="dropdown-item">
                    <i class="fas fa-file mr-2"></i> 3 new reports
                    <span class="float-right text-muted text-sm">2 days</span>
                </a>
                <div class="dropdown-divider"></div>
                <a href="#" class="dropdown-item dropdown-footer">See All Notifications</a>
            </div>
        </li>

        {{-- Loggedin User --}}
        <li class="nav-item dropdown user-menu">
            <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                <img src="{{ optional($user)->getFirstMediaUrl('avatar') ? $user->getFirstMediaUrl('avatar') : asset('_assets/_default/no-preview-available.png') }}" class="user-image img-circle" alt="User Image">
                <span class="d-none d-md-inline text-capitalize">{{ $user->name ?? '' }}</span>
            </a>

            <ul class="dropdown-menu dropdown-menu-lg dropdown-menu-right" style="left: inherit; right: 0px;">
                <a href="{{ route('admin.dashboard.index') }}" class="dropdown-item btn btn-default btn-flat"><i class="ion-home mr-3"></i>Dashboard</a>
                <div class="dropdown-divider"></div>
                <a href="{{ route('admin.profile.show', optional($user)->id ?? '') }}" class="dropdown-item btn btn-default btn-flat"><i class="ion-person mr-3"></i>Profile</a>
                <div class="dropdown-divider"></div>
                <form action="{{ route('admin.signout') }}" method="POST">
                    @csrf @method('POST')
                    <button type="submit" class="dropdown-item btn btn-default btn-flat float-right"><i class="ion-log-out mr-3"></i>Sign out</button>
                </form>
                <div class="dropdown-divider"></div>
            </ul>
        </li>
    </ul>
</nav>
