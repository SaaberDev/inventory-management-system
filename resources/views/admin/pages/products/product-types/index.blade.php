@extends('layouts.app-admin')
@section('title', 'Product Types')

@push('styles')
@endpush

@section('add-new-button')
    @can('product_type.create')
    <a type="button" href="{{ route('admin.product.type.create') }}" class="btn btn-info btn-sm float-sm-right">Add New</a>
    @endcan
@endsection

@section('content')
    <div class="row">
        <div class="col-12">
            <div class="card">
                @livewire('admin.product.product-type-table', ['product_types' => $product_types])
            </div>
            <!-- /.card -->
        </div>
    </div>
@endsection

@push('scripts')
    @include('alerts.admin.delete-confirmation')
@endpush
