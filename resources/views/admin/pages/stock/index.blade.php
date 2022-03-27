@extends('layouts.app-admin')
@section('title', 'Purchase Inventory')

@push('styles')
@endpush

@section('add-new-button')
    <a type="button" href="{{ $url }}" class="btn btn-info btn-sm float-sm-right">{{ $buttonText }}</a>
@endsection

@section('content')
    <div class="row">
        <div class="col-12">
            <div class="card">
                @livewire('admin.stock.stock-table', ['stock_details' => $stock_details])
            </div>
            <!-- /.card -->
        </div>
    </div>
@endsection

@push('scripts')
    @include('alerts.admin.delete-confirmation')
@endpush