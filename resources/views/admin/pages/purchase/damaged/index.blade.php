@extends('layouts.app-admin')
@section('title', 'Purchase')

@push('styles')

@endpush

@section('add-new-button')
    <a type="button" href="{{ route('admin.purchase.damaged.create') }}" class="btn btn-info btn-sm float-sm-right">Add New</a>
@endsection

@section('content')
    <div class="row">
        <div class="col-12">
            <div class="card">
                @livewire('admin.purchase.damage-table', ['damaged_purchases' => $damaged_purchases])
            </div>
            <!-- /.card -->
        </div>
    </div>
@endsection

@push('scripts')
    @include('alerts.admin.delete-confirmation')
@endpush
