@extends('layouts.admin-login')
@section('title', 'Login')

@push('styles')
@endpush

@section('add-new-button')
    {{--    <button type="button" class="btn btn-primary float-sm-right">Add New</button>--}}
@endsection

@section('content')
    <div class="card-body login-card-body">
        @if(session()->has('success'))
            <p class="text-sm text-center text-danger"><b>{{ session('message') }} <br> Please signin again.</b></p>
        @endif
        <p class="login-box-msg"><b>Sign in</b></p>

            @livewire('auth.admin.login-component')

            @_demo
            {{-- Login As Component --}}
            <x-demo.login-as-demo-layout>
                <x-demo.buttons.login-as :roles="['super-admin', 'admin', 'manager']"/>
            </x-demo.login-as-demo-layout>
            @end_demo
    </div>
@endsection
