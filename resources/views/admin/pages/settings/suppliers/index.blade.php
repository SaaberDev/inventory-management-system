@extends('layouts.app-admin')
@section('title', 'Suppliers')

@push('styles')
@endpush

@section('add-new-button')
    @can('settings.suppliers.create')
    <a type="button" href="{{ route('admin.settings.suppliers.create') }}" class="btn btn-info btn-sm float-sm-right">Add New</a>
    @endcan
@endsection

@section('content')
    <div class="row">
        <div class="col-12">
            <div class="card">
                @livewire('admin.settings.suppliers.supplier-table', ['suppliers' => $suppliers])
            </div>
            <!-- /.card -->
        </div>
    </div>
@endsection

@push('scripts')
    @include('alerts.admin.delete-confirmation')
@endpush