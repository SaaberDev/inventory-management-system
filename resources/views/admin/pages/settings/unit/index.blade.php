@extends('layouts.app-admin')
@section('title', 'Add Unit')

@push('styles')
@endpush

@section('add-new-button')
    @can('settings.unit.create')
     <a type="button" href="{{ route('admin.settings.unit.create') }}" class="btn btn-info btn-sm float-sm-right">Add New</a>
    @endcan
@endsection

@section('content')
    <div class="row">
        <div class="col-12">
            <div class="card">
                @livewire('admin.settings.unit.unit-table', ['units' => $units])
            </div>
            <!-- /.card -->
        </div>
    </div>
@endsection

@push('scripts')
    @include('alerts.admin.delete-confirmation')
@endpush
