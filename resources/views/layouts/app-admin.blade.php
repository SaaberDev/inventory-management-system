<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <title>@yield('title')</title>

    {{-- No Script Warning Start --}}
    <noscript>
        <link rel="stylesheet" type="text/css" href="{{ asset('_assets/_default/noscript.css') }}">
    </noscript>
    {{-- No Script Warning End --}}
    {{-- Browser Favicon --}}
    <link rel="icon" href="{{ asset('_assets/_default/logo.svg') }}" type="image/svg" sizes="16x16">
    {{-- Google Font: Source Sans Pro --}}
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,300;0,400;0,500;1,400&display=swap">
    <link rel="stylesheet" href="{{ mix('_assets/plugins/fontawesome/css/fontawesome.css') }}">
    <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
    <link rel="stylesheet" href="{{ mix('_assets/plugins/overlayScrollbars/css/OverlayScrollbars.css') }}">
    <link rel="stylesheet" href="{{ mix('_assets/_admin/css/admin-dashboard.css') }}">
    <link rel="stylesheet" href="{{ mix('_assets/_admin/css/custom.css') }}">

    @livewireStyles
    @stack('styles')
</head>

<body class="hold-transition layout-fixed">
<div class="wrapper">
    <div class="preloader">
        <div class="row">
            <img src="{{ asset('_assets/_default/logo.svg') }}" alt="logo" height="100" width="100">
        </div>
    </div>
    <!-- Navbar -->
    @include('admin.includes.navbar')
    <!-- /.navbar -->

    <!-- Main Sidebar Container -->
    @include('admin.includes.sidebar')

    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        @include('admin.includes.header')
        <!-- /.content-header -->

        <!-- Main content -->
        <div class="content">
            @yield('content')
            <!-- /.container-fluid -->
        </div>
        <!-- /.content -->
    </div>
    <!-- /.content-wrapper -->

    <!-- Control Sidebar -->
    <aside class="control-sidebar control-sidebar-dark">
        <!-- Control sidebar content goes here -->
    </aside>
    <!-- /.control-sidebar -->

    <!-- Main Footer -->
    @include('admin.includes.footer')
</div>
<!-- ./wrapper -->

<!-- REQUIRED SCRIPTS -->
<script src="{{ mix('_assets/_admin/js/admin-dashboard.js') }}"></script>
<script src="{{ mix('_assets/plugins/overlayScrollbars/js/jquery.overlayScrollbars.js') }}"></script>
@livewireScripts
<script src="{{ mix('js/app.js') }}"></script>
@stack('scripts')
@include('alerts.admin.toast-alert')
</body>
</html>
