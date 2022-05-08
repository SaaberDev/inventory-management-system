@extends('layouts.app-printable')
@section('title', 'Purchase Invoice' . ' ' . '#' . e($purchase->code))
@push('styles')
    <style>
        html {
            font-family: 'Poppins', sans-serif;
            line-height: 1.15;
            -webkit-text-size-adjust: 100%;
            -webkit-tap-highlight-color: rgba(0, 0, 0, 0);
        }
        body {
            margin: 0;
            font-family: 'Poppins', sans-serif;
            font-size: 3mm;
            font-weight: 400;
            line-height: 1.5;
            color: #212529;
            text-align: left;
            background-color: #fff;
        }
        hr {
            box-sizing: content-box;
            height: 0;
            overflow: visible;
        }
        hr {
            margin-top: 1rem;
            margin-bottom: 1rem;
            border: 0;
            border-top: 1px solid rgba(0, 0, 0, 0.1);
        }

        h1, h2, h3, h4, h5, h6 {
            margin-top: 0;
            margin-bottom: 0.5rem;
        }

        p {
            margin-top: 0;
            margin-bottom: 1rem;
        }
        b,
        strong {
            font-weight: 500;
        }
        h4, h5, h6 {
            margin-bottom: 0.5rem;
            font-family: inherit;
            font-weight: 500;
            line-height: 1.2;
            color: inherit;
        }

        h4 {
            font-size: 3.5mm;
        }

        h5 {
            font-size: 1.25rem;
        }

        h6 {
            font-size: 1rem;
        }
        b {
            font-size: 3mm;
        }
        .container {
            width: 100%;
            height: auto;
        }
        .section-1 {
            max-width: 100%;
            text-align: center;
            margin: 10px 0;
        }
        .section-1 img {
            position: relative;
            width: 55px;
            top: 3px;
        }
        .section-2 {
            max-width: 100%;
            margin: 10px 0;
        }
        .section-3 {
            max-width: 100%;
            margin: 10px 0;
        }
        .sub-section {
            text-align: center;
            display: inline-block;
            width: 33%;
        }
        .sub-section.left {
            text-align: left;
            display: inline-block;
            width: 33%;
        }
        .sub-section.right {
            text-align: right;
            display: inline-block;
            width: 33%;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            border-spacing: 0;
            margin-bottom: 20px;
        }
        .table {
            width: 100%;
            margin-bottom: 1rem;
            color: #212529;
            background-color: transparent;
        }
        table tr:nth-child(2n-1) td {
            background: #F5F5F5;
        }

        .table th,
        .table td {
            padding: 0.75rem;
            vertical-align: top;
            text-align: center;
        }

        th {
            font-weight: 500;
        }

        .table thead th {
            vertical-align: bottom;
            border-bottom: 1px solid #dee2e6;
        }

        .table tbody + tbody {
            border-top: 2px solid #dee2e6;
        }
        table td.total {
            font-size: 3mm;
            font-weight: 500;
        }

        table td.grand {
            border-top: 1px solid #5D6975;;
        }
        .badge {
            display: inline-block;
            padding: 0.25em 0.4em;
            font-weight: 500;
            line-height: 1;
            border-radius: 0.25rem;
        }
        .badge-info {
            color: #fff;
            background-color: #17a2b8;
        }
        .badge-success {
            color: #fff;
            background-color: #28a745;
        }
        .badge-warning {
            color: #1f2d3d;
            background-color: #ffc107;
        }
    </style>
@endpush

@section('content')
    <div class="section-1">
        <img src="{{ asset('_assets/_default/icon.svg') }}" alt="Company Logo">
        <h4>{{ config('app.name') }}</h4>
    </div>

    <hr>

    <div class="section-2">
        <div class="sub-section left">
            <h4>#{{ $purchase->code }}</h4>
            <b>Purchase Date: {{ $purchase->purchase_date }}</b>
        </div>
        <div class="sub-section">
            <b>Note:</b> <br>
            {{ $purchase->note }}
        </div>
        <div class="sub-section right">
            <b>Payment Info:</b> <br>
            <span style="font-weight: bolder">{{ ucwords($purchase->payment_method) }}</span> | <span style="font-weight: bolder">{{ ucwords($purchase->payment_status) }}</span>
        </div>
    </div>

    <hr>

    <div class="section-3">
        <table class="table">
            <thead>
            <tr>
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
                    <td>{{ $inventory->products->name }}</td>
                    <td>{{ $inventory->quantity }} {{ $inventory->products->units->shortcut }}</td>
                    <td>{{ $inventory->unit_price }} Tk</td>
                    <td>{{ $inventory->single_discount }} %</td>
                    <td>{{ $inventory->single_total }} Tk</td>
                </tr>
            @endforeach

            <tr>
                <td class="grand"></td>
                <td class="grand"></td>
                <td class="grand"></td>
                <td class="grand total">SUBTOTAL</td>
                <td class="grand total">{{ $purchase->sub_total }} Tk</td>
            </tr>
            <tr>
                <td></td>
                <td class="total">TOTAL DISCOUNT</td>
                <td class="total">{{ $purchase->total_discount }} Tk</td>
                <td class="total">TRANSPORT COST</td>
                <td class="total">{{ $purchase->transport_cost }} Tk</td>
            </tr>

            <tr>
                <td class="grand"></td>
                <td class="grand"></td>
                <td class="grand"></td>
                <td class="grand total">GRAND TOTAL</td>
                <td class="grand total">{{ $purchase->grand_total }} Tk</td>
            </tr>
            <tr>
                <td></td>
                <td></td>
                <td></td>
                <td class="total">TOTAL PAID</td>
                <td class="total">{{ $purchase->total_paid }} Tk</td>
            </tr>
            <tr>
                <td></td>
                <td></td>
                <td></td>
                <td class="total">TOTAL DUE</td>
                <td class="total">{{ $purchase->total_due }} Tk</td>
            </tr>
            </tbody>
        </table>
    </div>
@endsection
