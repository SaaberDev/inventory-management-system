@extends('layouts.app-admin')
@section('title', 'Purchase')

@push('styles')

@endpush

@section('add-new-button')
    @can('purchase.create')
    <a type="button" href="{{ route('admin.purchase.self.create') }}" class="btn btn-info btn-sm float-sm-right">Add New</a>
    @endcan
@endsection

@section('content')
    <div class="row">
        <div class="col-12">
            <div class="card">
                @livewire('admin.purchase.purchase-table', ['purchases' => $purchases])
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
