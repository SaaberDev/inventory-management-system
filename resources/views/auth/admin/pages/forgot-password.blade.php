@extends('layouts.admin-login')
@section('title', 'Login')

@push('styles')
@endpush

@section('add-new-button')
    {{--    <button type="button" class="btn btn-primary float-sm-right">Add New</button>--}}
@endsection

@section('content')
    <div class="card-body login-card-body">
        <p class="login-box-msg">You forgot your password? Here you can easily retrieve a new password.</p>
        @livewire('auth.admin.forgot-password-component')
    </div>
@endsection

@push('scripts')
@endpush
