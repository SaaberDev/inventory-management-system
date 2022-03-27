<div>
    <div class="card-header">
        <h3 class="card-title">Released Products</h3>

        <div class="card-tools">
            <div class="input-group input-group-sm" style="width: 150px;">
                @include('admin.includes.search')
            </div>
        </div>
    </div>
    <!-- /.card-header -->
    <div class="card-body table-responsive p-0">
        <table style="width: 100%" class="table table-hover text-sm-center">
            <colgroup>
                <col span="1" style="width: 15%;">
                <col span="1" style="width: 15%;">
                <col span="1" style="width: auto;">
                <col span="1" style="width: auto;">
                <col span="1" style="width: 20%;">
                <col span="1" style="width: 10%;">
                <col span="1" style="width: 10%;">
            </colgroup>

            <thead>
            <tr>
                <th>Date</th>
                <th>Code</th>
                <th>Released From</th>
                <th>Type</th>
                <th>Name</th>
                <th>Qty</th>
                <th>Action</th>
            </tr>
            </thead>
            <tbody>
            @forelse($released_product_infos as $released_product_info)
                <tr data-widget="expandable-table"
                    aria-expanded="false"
                >
                    <td>{{ $released_product_info->date }}</td>
                    <td>{{ $released_product_info->code }}</td>
                    <td>{{ $released_product_info->released_from }}</td>
                    <td>{{ $released_product_info->product_type }}</td>
                    <td>{{ $released_product_info->released_product }}</td>
                    <td>{{ $released_product_info->quantity }}</td>
                    <td>
                        <i class="expandable-table-caret fas fa-caret-right fa-fw"
                           data-toggle="tooltip"
                           data-placement="left"
                           data-original-title="Click to Expand"
                           style="width: 30%;"
                        ></i>
                    </td>
                </tr>

                <tr class="expandable-body">
                    <td colspan="7">
                        <div class="d-flex">
                            <div class="row expandable-info">
                                <div class="col-sm-12">
                                    <table style="width: 100%" class="table table-borderless text-sm-left">
                                        <colgroup>
                                            <col span="1" style="width: 33%;">
                                            <col span="1" style="width: 33%;">
                                            <col span="1" style="width: 33%;">
                                        </colgroup>
                                        <thead class="text-bold">
                                        <tr>
                                            <td style="border-bottom: 2px solid #dee2e6;">
                                                P. Code
                                                <i class="fas fa-info-circle" data-toggle="tooltip" data-placement="right" title="" data-original-title="Product Code"></i>
                                            </td>
                                            <td class="text-sm-center" style="border-bottom: 2px solid #dee2e6;">Name</td>
                                            <td class="text-sm-center" style="border-bottom: 2px solid #dee2e6;">Used Qty</td>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        @foreach($released_product_info->released_product_details as $released_product_detail)
                                            <tr>
                                                <td>{{ $released_product_detail->code }}</td>
                                                <td class="text-sm-center">{{ $released_product_detail->name }}</td>
                                                <td class="text-sm-center">{{ $released_product_detail->qty }}</td>
                                            </tr>
                                        @endforeach
                                        </tbody>
                                    </table>
                                </div>


                                <div class="col-sm-12 text-sm-left p-4">
                                    Note: {{ $released_product_info->note }}
                                </div>
                            </div>

                            <div class="col-sm-1">
                                @can('release.edit')
                                <a href="{{ route('admin.release.edit', $released_product_info->id) }}"
                                   class="btn"
                                   data-toggle="tooltip"
                                   data-placement="left"
                                   data-original-title="Click to Edit"
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
                                @endcan
                            </div>
                        </div>
                    </td>
                </tr>
            @empty
                <tr>
                    <td colspan="7">No Purchase Available</td>
                </tr>
            @endforelse
            </tbody>
        </table>
    </div>
</div>
