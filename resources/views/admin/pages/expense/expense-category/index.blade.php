@extends('layouts.app-admin')
@section('title', 'Expense Categories')

@push('styles')
@endpush

@section('add-new-button')
    @@can('product_type.create')
    <a type="button" href="{{ route('admin.expense.category.create') }}" class="btn btn-info btn-sm float-sm-right">Add New</a>
    @endcan
@endsection

@section('content')
    <div class="row">
        <div class="col-12">
            <div class="card">
                @livewire('admin.expense.expense-category-table',['expense_category' => $expense_category])
            </div>
            <!-- /.card -->
        </div>
    </div>
@endsection

@push('scripts')
    @include('alerts.admin.delete-confirmation')
@endpush
