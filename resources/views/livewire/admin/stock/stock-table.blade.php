<div>
    <div class="card-header">
        <h3 class="card-title">{{ sanitizeQueryParamToWords('name') . ' ' . 'Stock' }}</h3>

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
                <col span="1" style="width: 30%;">
                <col span="1" style="width: 40%;">
                <col span="1" style="width: 30%;">
            </colgroup>

            <thead>
            <tr>
                <th>P. Code <i class="fas fa-info-circle" data-toggle="tooltip" data-placement="right" title="Product Code"></i></th>
                <th>Name</th>
                <th>Stock</th>
            </tr>
            </thead>
            <tbody>
            @forelse($stock_details as $stock_detail)
                <tr>
                    <td>{{ $stock_detail['code'] }}</td>
                    <td>{{ $stock_detail['name'] }}</td>
                    <td>{{ $stock_detail['qty'] . ' ' . $stock_detail['unit_shortcut'] }}</td>
                </tr>
            @empty
                <tr>
                    <td colspan="3">No Purchase Available</td>
                </tr>
            @endforelse
            </tbody>
        </table>
    </div>
</div>
