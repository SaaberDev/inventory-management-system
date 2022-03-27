@extends('layouts.app-admin')
@section('title', 'Purchase')

@push('styles')
    <style>
        .total {
            border-top: 1px solid rgb(0 0 0 / 10%)!important;
        }
    </style>
@endpush

@section('add-new-button')
    <a type="button" href="{{ route('admin.purchase.self.edit', $purchase->id) }}" class="btn btn-info btn-sm float-sm-right">Edit Purchase</a>
@endsection

@section('content')
    <div class="invoice p-3 mb-3">
        <!-- title row -->
        <div class="row">
            <div class="col-sm-3">
                <h5><i class="fas fa-hashtag"></i> {{ $purchase->code }} <br></h5>
                <div class="mt-2">
                    <b>Purchase Date: {{ $purchase->purchase_date }}</b>
                </div>
            </div>

            <div class="col-sm-4 text-sm-center align-self-center">
                <b>Note:</b> <br>
                {!! $purchase->note !!}
            </div>

            <div class="col-sm-3 text-sm-center align-self-center">
                <b>Payment Info</b>
                <br>
                <span class="badge badge-info"
                      style="font-size: 90%"
                >
                    {{ ucwords($purchase->payment_method) }}
                </span> |
                <span class="badge {{ $purchase->payment_status == 'paid' ? 'badge-success' : 'badge-warning' }}"
                      style="font-size: 90%"
                >
                    {{ ucwords($purchase->payment_status) }}
                </span><br>
            </div>

            <div class="col-sm-2">
                <a href="{{ route('pdf', $purchase->code) }}"
                   rel="noopener"
                   target="_blank"
                   style="margin-top: 10px;"
                   class="btn btn-default float-right print_me"
                ><i class="fas fa-print"></i> Print</a>
            </div>
            <!-- /.col -->
        </div>

        <hr>

        <!-- Table row -->
        <div class="row">
            <div class="col-12 table-responsive">
                <table class="table table-light text-sm-center">
                    <thead>
                    <tr>
                        <th>Code</th>
                        <th>Product</th>
                        <th>Qty</th>
                        <th>Unit Price</th>
                        <th>Discount</th>
                        <th>Product Total</th>
                    </tr>
                    </thead>
                    <tbody>
                    @foreach($purchase->purchaseDetails as $inventory)
                    <tr>
                        <td>{{ $inventory->products->code }}</td>
                        <td>{{ $inventory->products->name }}</td>
                        <td>{{ $inventory->quantity }} {{ $inventory->products->units->shortcut }}</td>
                        <td>{{ $inventory->unit_price }} Tk</td>
                        <td>{{ $inventory->single_discount }} %</td>
                        <td>{{ $inventory->single_total }} Tk</td>
                    </tr>
                    @endforeach

                    <tr>
                        <td class="total"></td>
                        <td class="total"></td>
                        <td class="total">Total Discount</td>
                        <td class="total">{{ $purchase->total_discount }} Tk</td>
                        <td class="total">Sub Total</td>
                        <td class="total">{{ $purchase->sub_total }} Tk</td>
                    </tr>

                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td>Transport Cost</td>
                        <td>+ {{ $purchase->transport_cost }} Tk</td>
                    </tr>

                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td class="table-info">Grand Total</td>
                        <td class="table-info">{{ $purchase->grand_total }} Tk</td>
                    </tr>

                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td class="table-success">Total Paid</td>
                        <td class="table-success">{{ $purchase->total_paid }} Tk</td>
                    </tr>

                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td class="table-warning">Total Due</td>
                        <td class="table-warning">{{ $purchase->total_due }} Tk</td>
                    </tr>

                    </tbody>
                </table>
            </div>
            <!-- /.col -->
        </div>
        <!-- /.row -->
    </div>
@endsection

@push('scripts')
{{--    <script>--}}
{{--        $(document).on('click', '.print_me', function (){--}}
{{--            window.addEventListener("load", window.print());--}}
{{--        })--}}
{{--    </script>--}}
@endpush
