@extends('layouts.app-admin')
@section('title', '')

@push('styles')
@endpush

@section('add-new-button')
    <a type="button" href="#" class="btn btn-info btn-sm float-sm-right">Add New</a>
@endsection

@section('content')

    <div class="col-sm-12 text-sm-left p-4">
        Note: {{ $released_product_info->note }}
    </div>

    {{-- Table --}}
    <div class="row">
        <div class="col-12">
            <div class="card">
                {{-- Table Start --}}
                    <div>
         <div class="card-header">
             <h3 class="card-title">Warehouse</h3>

             <div class="card-tools">
                 <div class="input-group input-group-sm" style="width: 150px;">
                     @include('admin.includes.search')
                 </div>
             </div>
         </div>
         <!-- /.card-header -->
         <div class="card-body table-responsive p-0">
             <table style="width: 100%" class="table table-hover">
                 <colgroup>
                     <col span="1" style="width: 10%;">
                     <col span="1" style="width: 80%;">
                     <col span="1" style="width: 10%;">
                 </colgroup>

                 <thead>
                 <tr>
                     <th>ID</th>
                     <th>Name</th>
                     <th>Action</th>
                 </tr>
                 </thead>
                 <tbody>
                 {{--            @forelse($users as $user)--}}
                 <tr>
                     {{--                    <td>{{ $user->id }}</td>--}}
                     {{--                    <td>{{ $user->name }}</td>--}}

                     <td>1</td>
                     <td>Main</td>
                     <td>
                         <div class="" style="display: flex">
                             <a href="{{--{{ route('admin.settings.authorization.administration.edit', $user->id) }}--}}"
                                class="btn p-0 mr-3"
                             >
                                 <svg xmlns="http://www.w3.org/2000/svg" width="14.322" height="14.322"
                                      viewBox="0 0 14.322 14.322">
                                     <g transform="translate(-2.5 -2.203)">
                                         <path
                                             d="M8.907,6H4.313A1.313,1.313,0,0,0,3,7.313V16.5a1.313,1.313,0,0,0,1.313,1.313H13.5A1.313,1.313,0,0,0,14.815,16.5V11.907"
                                             transform="translate(0 -1.79)" fill="none" stroke="#000"
                                             stroke-linecap="round" stroke-linejoin="round"
                                             stroke-width="1"></path>
                                         <path
                                             d="M18.892,3.226a1.392,1.392,0,1,1,1.969,1.969l-6.236,6.236L12,12.087l.656-2.626Z"
                                             transform="translate(-5.062 0)" fill="none" stroke="#000"
                                             stroke-linecap="round" stroke-linejoin="round"
                                             stroke-width="1"></path>
                                     </g>
                                 </svg>
                             </a>

                             <a href="{{--{{ route('admin.settings.authorization.administration.delete', $user->id) }}--}}"
                                class="sweet_delete btn m-0 p-0"
                             >
                                 <svg xmlns="http://www.w3.org/2000/svg" width="11.91" height="16.027"
                                      viewBox="0 0 11.91 16.027">
                                     <path
                                         d="M8.279,16.969a1.563,1.563,0,0,0,1.559,1.559h6.234a1.563,1.563,0,0,0,1.559-1.559V7.617H8.279ZM18.41,4.279H15.683L14.9,3.5h-3.9l-.779.779H7.5V5.838H18.41Z"
                                         transform="translate(-7 -3)" fill="none" stroke="#000"
                                         stroke-width="1"></path>
                                 </svg>
                             </a>
                         </div>
                     </td>
                 </tr>
                 {{--            @empty--}}
                 {{--                <tr>--}}
                 {{--                    <td colspan="7">No Admin Available</td>--}}
                 {{--                </tr>--}}
                 {{--            @endforelse--}}
                 </tbody>
             </table>
         </div>
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

{{-- Required field indicator demo --}}
<span class="text-danger"> *</span>

{{--Preloader demo --}}
<div class="preloader">
    <div class="row">
        <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="127.983" height="127.983" viewBox="0 0 370 370">
            <image width="370" height="370" xlink:href="data:img/png;base64,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"/>
        </svg>

{{--        <img src="{{ asset('_assets/_admin/images/quick-stack.svg') }}" alt="quick-stack">--}}
    </div>
</div>

{{--Clickable Table row--}}
<style>
    .clickable-row {
        cursor: pointer;
    }
</style>
<script>
    $(document).ready(function($) {
        $(".clickable-row td:not(:last-child)").click(function() {
            window.location = $('.clickable-row').data("href");
        });
    });
</script>
