@extends('layouts.app-admin')
@section('title', 'Group Permission')

@push('styles')
@endpush

@section('add-new-button')
    @can('settings.group_permission.create')
        <a type="button" href="{{ route('admin.settings.authorization.groupPermission.create') }}" class="btn btn-info btn-sm float-sm-right">Add New</a>
    @endcan
@endsection

@section('content')
    <div class="row">
        <div class="col-12">
            <div class="card">
                @livewire('admin.settings.permission-table')
            </div>
            <!-- /.card -->
        </div>
    </div>
@endsection

@push('scripts')
    @include('alerts.admin.delete-confirmation')
@endpush
