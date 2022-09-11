<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <title>@yield('title')</title>
    <link rel="icon" href="{{ asset('_assets/_default/icon.webp') }}" type="image/svg" sizes="16x16">
    <!-- Google Font: Source Sans Pro -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
    <link rel="stylesheet" href="{{ mix('_assets/plugins/fontawesome/css/fontawesome.css') }}">
    <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
    <link rel="stylesheet" href="{{ mix('_assets/_admin/css/admin-dashboard.css') }}">
    <link rel="stylesheet" href="{{ mix('_assets/_admin/css/custom.css') }}">

    @livewireStyles
    @stack('styles')

    <style>
        label:not(.form-check-label):not(.custom-file-label) {
            font-weight: 400;
        }

        .checkbox > input:checked + span::before {
            content: '\2713';
            display: block;
            text-align: center;
            color: #ffffff;
            position: absolute;
            left: -16px;
            top: 2px;
        }

        .checkbox > input {
            height: 20px;
            width: 20px;
            -webkit-appearance: none;
            -moz-appearance: none;
            -o-appearance: none;
            appearance: none;
            border: 1px solid #17a2b8;
            border-radius: 4px;
            outline: none;
            transition-duration: 0.3s;
            background-color: #ffffff;
            cursor: pointer;
        }

        .checkbox > span {
            color: #34495E;
            padding: 1px 0.25rem;
            margin-left: 2px;
        }
    </style>
</head>
<body class="hold-transition login-page">
<div class="login-box">
    <div class="login-logo">
        <a href="#" style="font-size: 30px;">Inventory<b>MS</b></a>
        <img src="{{ asset('_assets/_default/icon.webp') }}" alt="logo" class="brand-image" style="width: 14%">
    </div>
    <!-- /.login-logo -->
    <div class="card">
        @yield('content')
        <!-- /.login-card-body -->
    </div>
</div>
<!-- /.login-box -->

<!-- REQUIRED SCRIPTS -->
<script src="{{ mix('_assets/_admin/js/admin-dashboard.js') }}"></script>
@livewireScripts
<script src="{{ mix('js/app.js') }}"></script>
@stack('scripts')
@include('alerts.admin.toast-alert')
</body>
</html>
