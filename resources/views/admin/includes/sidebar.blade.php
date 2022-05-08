<aside class="main-sidebar sidebar-light-cyan elevation-1">
    <!-- Brand Logo -->
{{--    <a href="{{ route('admin.dashboard.index') }}" class="brand-link">--}}
{{--        <img src="{{ asset('_assets/_default/icon.webp') }}" alt="logo" class="brand-image">--}}
{{--    </a>--}}
    <div style="display: flex">
        <a href="{{ route('admin.dashboard.index') }}" class="brand-link">
            Inventory<b>MS</b>
            <img src="{{ asset('_assets/_default/icon.webp') }}" alt="Company Logo" class="brand-image">
        </a>
    </div>

    <!-- Sidebar -->
    <div class="sidebar">
        <!-- Sidebar Menu -->
        <nav class="mt-2">
            @livewire('admin.includes.sidebar')
        </nav>
        <!-- /.sidebar-menu -->
    </div>
    <!-- /.sidebar -->
</aside>
