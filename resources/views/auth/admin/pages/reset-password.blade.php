@extends('layouts.admin-login')
@section('title', 'Login')

@push('styles')
@endpush

@section('add-new-button')
    {{--    <button type="button" class="btn btn-primary float-sm-right">Add New</button>--}}
@endsection

@section('content')
    <div class="card-body login-card-body">
        <p class="login-box-msg">You are only one step a way from your new password, recover your password now.</p>
        @livewire('auth.admin.reset-password-component', ['request' => $request])
    </div>
@endsection

@push('scripts')
@endpush
