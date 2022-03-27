@extends('layouts.app-admin')
@section('title', 'Products')

@push('styles')
@endpush

@section('add-new-button')
    @can('product.create')
    <a type="button" href="{{ route('admin.product.self.create') }}" class="btn btn-info btn-sm float-sm-right">Add New</a>
    @endcan
@endsection

@section('content')
    <div class="row">
        <div class="col-12">
            <div class="card">
                @livewire('admin.product.product-table')
            </div>
            <!-- /.card -->
        </div>
    </div>
@endsection

@push('scripts')
    @include('alerts.admin.delete-confirmation')
@endpush
