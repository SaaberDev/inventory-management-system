@extends('layouts.app-admin')
@section('title', 'Sales')

@push('styles')

@endpush

@section('add-new-button')
    @can('sales.create')
    <a type="button" href="{{ route('admin.sales.self.create') }}" class="btn btn-info btn-sm float-sm-right">Add New</a>
    @endcan
@endsection

@section('content')
    <div class="row">
        <div class="col-12">
            <div class="card">
                @livewire('admin.sales.sales-table', ['sales' => $sales])
            </div>
            <!-- /.card -->
        </div>
    </div>
@endsection

@push('scripts')
    @include('alerts.admin.delete-confirmation')
{{--    <style>--}}
{{--        .clickable-row {--}}
{{--            cursor: pointer;--}}
{{--        }--}}
{{--    </style>--}}
{{--    <script>--}}
{{--        $(document).ready(function($) {--}}
{{--            $(".clickable-row td:not(:last-child)").click(function() {--}}
{{--                window.location = $('.clickable-row').data("href");--}}
{{--            });--}}
{{--        });--}}
{{--    </script>--}}
@endpush
