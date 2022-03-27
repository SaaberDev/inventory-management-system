@extends('layouts.app-admin')
@section('title', 'Expenses')

@push('styles')
@endpush

@section('add-new-button')
    @can('expense.create')
    <a type="button" href="{{ route('admin.expense.self.create') }}" class="btn btn-info btn-sm float-sm-right">Add New</a>
    @endcan
@endsection

@section('content')
    <div class="row">
        <div class="col-12">
            <div class="card">
                @livewire('admin.expense.expense-table');
            </div>
            <!-- /.card -->
        </div>
    </div>
@endsection

@push('scripts')
    @include('alerts.admin.delete-confirmation')
@endpush
