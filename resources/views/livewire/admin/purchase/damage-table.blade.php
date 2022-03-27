<div>
    <div class="card-header">
        <h3 class="card-title">Purchase Inventory</h3>

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
                <col span="1" style="width: 20%;">
                <col span="1" style="width: 20%;">
                <col span="1" style="width: 20%;">
                <col span="1" style="width: 20%;">
                <col span="1" style="width: 20%;">
            </colgroup>

            <thead>
            <tr>
                <th>Purchase Code</th>
                <th>Reason</th>
                <th>Note</th>
                <th>Date</th>
                <th>Action</th>
            </tr>
            </thead>
            <tbody>
            @forelse($damaged_purchases as $damaged_purchase)
                <tr data-widget="expandable-table"
                    aria-expanded="false"
                >
                    <td>
                        <a href="{{ route('admin.purchase.self.show', $damaged_purchase->purchases->code) }}" class="">{{ $damaged_purchase->purchases->code }}</a>
                    </td>
                    <td>{{ $damaged_purchase->reason }}</td>
                    <td>{{ $damaged_purchase->note }}</td>
                    <td>{{ $damaged_purchase->damage_date }}</td>
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
                    <td colspan="5">
                        <div class="d-flex justify-content-end" style="padding-right: 84px;">
                            <a href="{{ route('admin.purchase.damaged.edit', $damaged_purchase->id) }}"
                               class="btn p-0 mr-3"
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
                        </div>

                        <div class="row expandable-info">
                            <div class="col-sm-12">
                                <table style="width: 100%" class="table table-borderless text-sm-left">
                                    <colgroup>
                                        <col span="1" style="width: 40%;">
                                        <col span="1" style="width: 20%;">
                                        <col span="1" style="width: 20%;">
                                        <col span="1" style="width: 20%;">
                                    </colgroup>
                                    <thead class="text-bold">
                                    <tr>
                                        <td style="border-bottom: 2px solid #dee2e6;">Name</td>
                                        <td class="text-sm-center" style="border-bottom: 2px solid #dee2e6;">Purchase Qty</td>
                                        <td class="text-sm-center" style="border-bottom: 2px solid #dee2e6;">Available Qty</td>
                                        <td class="text-sm-center" style="border-bottom: 2px solid #dee2e6;">Damaged Qty</td>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    @foreach($damaged_purchase->purchaseInventories as $purchase_inventory)
                                    <tr>
                                        <td>{{ $purchase_inventory->rawMaterials->name }}</td>
                                        <td class="text-sm-center">{{ $purchase_inventory->quantity . ' ' . $purchase_inventory->units->shortcut }}</td>
                                        <td class="text-sm-center"><span class="text-success">{{ $purchase_inventory->available_quantity . ' ' . $purchase_inventory->units->shortcut }}</span></td>
                                        <td class="text-sm-center"><span class="text-danger">{{ $purchase_inventory->damaged_quantity . ' ' . $purchase_inventory->units->shortcut }}</span></td>
                                    </tr>
                                    @endforeach
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </td>
                </tr>
            @empty
                <tr>
                    <td colspan="5">No Purchase Available</td>
                </tr>
            @endforelse
            </tbody>
        </table>
    </div>
</div>
