@extends('layouts.app-admin')
@section('title', '')

@push('styles')
    <style>
        .timeline {
            margin: 45px 0 45px;
            padding: 0;
            position: relative;
        }
        .horizontal.timeline {
            display: flex;
            position: relative;
            flex-direction: row;
            justify-content: space-between;
            align-items: center;
            width: 100%;
        }
        .horizontal.timeline:before {
            content: '';
            display: block;
            position: absolute;
            width: 100%;
            height: 0.2em;
            background-color: #f2f2f2;
        }
        .timeline::before {
            border-radius: 0.25rem;
            background-color: #dee2e6;
            bottom: 0;
            content: "";
            left: 0px;
            margin: 0;
            position: absolute;
            top: 6px;
            width: 4px;
        }
        .horizontal.timeline .line {
            display: block;
            position: absolute;
            width: 50%;
            height: 0.2em;
            background-color: #8897ec;
        }
        .horizontal.timeline .steps {
            display: flex;
            position: relative;
            flex-direction: row;
            justify-content: space-between;
            align-items: center;
            width: 100%;
        }
        .horizontal.timeline .steps .step {
            display: block;
            position: relative;
            bottom: calc(100% + 1em);
            padding: 0.33em;
            margin: 0 2em;
            box-sizing: content-box;
            color: #8897ec;
            background-color: currentColor;
            border: 0.25em solid white;
            border-radius: 50%;
            z-index: 500;
        }
        .horizontal.timeline .steps .step:first-child {
            margin-left: 0;
        }
        .horizontal.timeline .steps .step:last-child {
            margin-right: 0;
            color: #71cb35;
        }
        .horizontal.timeline .steps .step span {
            position: absolute;
            top: calc(100% + 1em);
            left: 50%;
            transform: translateX(-50%);
            white-space: nowrap;
            color: #000;
            opacity: 0.4;
        }
        .horizontal.timeline .steps .step.current:before {
            content: '';
            display: block;
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            padding: 1em;
            background-color: currentColor;
            border-radius: 50%;
            opacity: 0;
            z-index: -1;
            animation-name: animation-timeline-current;
            animation-duration: 2s;
            animation-iteration-count: infinite;
            animation-timing-function: ease-out;
        }
        .horizontal.timeline .steps .step.current span {
            opacity: 0.8;
        }
        @keyframes animation-timeline-current {
            from {
                transform: translate(-50%, -50%) scale(0);
                opacity: 1;
            }
            to {
                transform: translate(-50%, -50%) scale(1);
                opacity: 0;
            }
        }

    </style>
@endpush

@section('add-new-button')
    @can('transfer.create')
    <a type="button" href="{{ route('admin.transfer.create') }}" class="btn btn-info btn-sm float-sm-right">Add New</a>
    @endcan
    <!-- Button tag -->
{{--    <button class="btn btn-secondary" data-iconset="fontawesome5" data-icon="ion-ionic" role="iconpicker"></button>--}}
    <!-- Div tag -->
{{--    <div name="icon" role="iconpicker"></div>--}}
@endsection

@section('content')

    {{-- Table --}}
    <div class="row">
        <div class="col-12">
            <div class="card">
                {{-- Table Start --}}
                <div>
                    @livewire('admin.transfer.transfer-table', ['transfer_infos' => $transfer_infos])
                </div>
                {{-- Table End--}}
            </div>
            <!-- /.card -->
        </div>
    </div>

    {{-- Something --}}

@endsection

@push('scripts')
@endpush
