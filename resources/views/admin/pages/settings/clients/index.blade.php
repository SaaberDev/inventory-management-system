@extends('layouts.app-admin')
@section('title', 'Warehouse')

@push('styles')
@endpush

@section('add-new-button')
    @can('settings.clients.create')
    <a type="button" href="{{ route('admin.settings.clients.create') }}" class="btn btn-info btn-sm float-sm-right">Add New</a>
    @endcan
@endsection

@section('content')
    <div class="row">
        <div class="col-12">
            <div class="card">
                @livewire('admin.settings.client.client-table', ['clients' => $clients])
            </div>
            <!-- /.card -->
        </div>
    </div>
@endsection

@push('scripts')
    @include('alerts.admin.delete-confirmation')
@endpush
