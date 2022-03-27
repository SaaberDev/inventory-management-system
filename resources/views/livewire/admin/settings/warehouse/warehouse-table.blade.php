<div>
    <div class="card-header">
        <h3 class="card-title">Warehouses</h3>

        <div class="card-tools">
            <div class="input-group input-group-sm">
                <div class="more-info">
                    <i class="fas fa-info-circle" data-toggle="tooltip" data-placement="left" title="" data-original-title="Drag n' Drop rows to rearrange"></i>
                </div>

                @include('admin.includes.search')
            </div>
        </div>
    </div>
    <!-- /.card-header -->
    <div class="card-body table-responsive p-0">
        <table style="width: 100%" class="table table-hover">
            <colgroup>
                <col span="1" style="width: 25%;">
                <col span="1" style="width: 20%;">
                <col span="1" style="width: 25%;">
                <col span="1" style="width: 30%;">
            </colgroup>

            <thead>
            <tr>
                <th>Icon</th>
                <th>Name</th>
                <th>Shortcut</th>
                <th class="text-sm-center">Action</th>
            </tr>
            </thead>
            <tbody wire:sortable="updateOrder">
            @forelse($warehouses as $warehouse)
                <tr wire:sortable.item="{{ $warehouse->id }}" wire:key="warehouse-{{ $warehouse->id }}" style="cursor: grab;">
                    <td><i class="{{ $warehouse->icon }}" style="font-size: 18px"></i></td>
                    <td>{{ $warehouse->name }}</td>
                    <td>{{ $warehouse->shortcut }}</td>
                    @if(!in_array($warehouse->id, [1, 2]))
                    <td>
                        <div class="d-flex justify-content-center">
                            @can('settings.warehouse.edit')
                                <a href="{{ route('admin.settings.warehouse.edit', $warehouse->id) }}"
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
                            @endcan
                            @can('settings.warehouse.delete')
                                <a href="{{ route('admin.settings.warehouse.delete', $warehouse->id) }}"
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
                            @endcan
                        </div>
                    </td>
                    @else
                        <td class="text-sm-center text-danger">
                            <i class="fas fa-info-circle" data-toggle="tooltip" data-placement="left" title="" data-original-title="Modification not allowed"></i>
                        </td>
                    @endif
                </tr>
            @empty
                <tr>
                    <td colspan="7">No Warehouse Available</td>
                </tr>
            @endforelse
            </tbody>
        </table>
    </div>

{{--    <div class="card-footer">--}}
{{--        {{ $warehouses->links() }}--}}
{{--    </div>--}}
</div>
