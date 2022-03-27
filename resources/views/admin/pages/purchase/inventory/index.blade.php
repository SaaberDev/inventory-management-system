@extends('layouts.app-admin')
@section('title', 'Purchase Inventory')

@push('styles')
@endpush

@section('add-new-button')
    <a type="button" href="{{ route('admin.purchase.self.create') }}" class="btn btn-info btn-sm float-sm-right">Add Purchase</a>
@endsection

@section('content')
    <div class="row">
        <div class="col-12">
            <div class="card">
                @livewire('admin.stock.stock-table', ['stocks' => $stocks])
            </div>
            <!-- /.card -->
        </div>
    </div>
@endsection

@push('scripts')
    @include('alerts.admin.delete-confirmation')
@endpush
