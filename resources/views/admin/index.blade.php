@extends('layouts.app-admin')
@section('title', 'Dashboard')

@push('styles')
@endpush

@section('content')
    <div class="container-fluid">
        @role('admin')
        <div class="row">
            <div class="col-md-3">
                <div class="info-box shadow-sm">
                    <span class="info-box-icon bg-success"><i class="fas fa-barcode"></i></span>

                    <div class="info-box-content">
                        <span class="info-box-text">Products</span>
                        <span class="info-box-number">{{ $totalProducts }}</span>
                    </div>
                    <!-- /.info-box-content -->
                </div>
            </div>

            <div class="col-md-3">
                <div class="info-box shadow-sm">
                    <span class="info-box-icon bg-success"><i class="fas fa-chart-line"></i></span>

                    <div class="info-box-content">
                        <span class="info-box-text">Profit</span>
                        <span class="info-box-number">{{$pofid}} BDT</span>
                    </div>
                    <!-- /.info-box-content -->
                </div>
            </div>

            <div class="col-md-3">
                <div class="info-box shadow-sm">
                    <span class="info-box-icon bg-warning"><i class="fas fa-money-check"></i></span>

                    <div class="info-box-content">
                        <span class="info-box-text">Expense</span>
                        <span class="info-box-number">{{$totalExpense}} BDT</span>
                    </div>
                    <!-- /.info-box-content -->
                </div>
            </div>

            <div class="col-md-3">
                <div class="info-box shadow-sm">
                    <span class="info-box-icon bg-danger"><i class="fas fa-chart-area"></i></span>

                    <div class="info-box-content">
                        <span class="info-box-text">Loss</span>
                        <span class="info-box-number">{{$lose}} BDT</span>
                    </div>
                    <!-- /.info-box-content -->
                </div>
            </div>
        </div>


        <div class="row">
            <div class="col-lg-6">
                <div class="card shadow-sm">
                    <div class="card-header border-0">
                        <h3 class="card-title">Monthly Total Sale and Purchase (By Amount)</h3>
                    </div>
                    <div class="card-body">
                        <div class="d-flex justify-content-between align-items-center border-bottom mb-3">
                            <canvas id="sale_and_purchase_by_amount" width="400" height="350"></canvas>
                        </div>
                        <!-- /.d-flex -->
                    </div>
                </div>
            </div>

            <div class="col-lg-6">
                <div class="card shadow-sm">
                    <div class="card-header border-0">
                        <h3 class="card-title">Monthly Total Sale and Purchase (By Price)</h3>
                    </div>
                    <div class="card-body">
                        <div class="d-flex justify-content-between align-items-center border-bottom mb-3">
                            <canvas id="sale_and_purchase_by_price" width="400" height="350"></canvas>
                        </div>
                        <!-- /.d-flex -->
                    </div>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-lg-6">
                <div class="card shadow-sm">
                    <div class="card-header border-0">
                        <h3 class="card-title">Business Overview</h3>
                    </div>
                    <div class="card-body">
                        <div class="d-flex justify-content-between align-items-center border-bottom mb-3">
                            <p class="text-success text-xl">
                                <i class="ion ion-ios-refresh-empty" style="position: relative;top: 7px;"></i>
                                <span class="text-md">Purchase</span>
                            </p>
                            <p class="d-flex flex-column text-right">
                                <span class="text-muted text-md">{{$totalPurchase}} BDT</span>
                            </p>
                        </div>
                        <!-- /.d-flex -->
                        <div class="d-flex justify-content-between align-items-center border-bottom mb-3">
                            <p class="text-warning text-xl">
                                <i class="ion ion-ios-cart-outline" style="position: relative;top: 6px;"></i>
                                <span class="text-md">Sale</span>
                            </p>
                            <p class="d-flex flex-column text-right">
                                <span class="text-muted text-md">{{$totalSale}} BDT</span>
                            </p>
                        </div>
                        <!-- /.d-flex -->
                    </div>
                </div>
            </div>
        </div>
        @endrole


        <div class="row">
            <div class="col-lg-12">
                <div class="card shadow-sm">
                    <div class="card-header border-0">
                        <h3 class="card-title"><b>RAW Products</b></h3>
{{--                        <div class="card-tools">--}}
{{--                            <a href="#" class="btn btn-tool btn-sm">--}}
{{--                                <i class="fas fa-download"></i>--}}
{{--                            </a>--}}
{{--                            <a href="#" class="btn btn-tool btn-sm">--}}
{{--                                <i class="fas fa-bars"></i>--}}
{{--                            </a>--}}
{{--                        </div>--}}
                    </div>
                    <div class="card-body table-responsive p-0">
                        <table class="table table-striped table-valign-middle">
                            <thead>
                            <tr>
                                <th>Product Name</th>
                                <th>Stock limit</th>
                                <th>Stock</th>
                                <th>warehouses</th>
                            </tr>
                            </thead>
                            <tbody>
                            @foreach( $product_raw as $product_raws)
                            <tr>
                                <td>
{{--                                    <img src="dist/img/default-150x150.png" alt="Product 1" class="img-circle img-size-32 mr-2">--}}
                                    {{$product_raws->name}}
                                </td>
                                <td> {{!empty($product_raws->stock_alert_limit)?$product_raws->stock_alert_limit:'-'}}</td>
                                <td> {{!empty($product_raws->qty)?$product_raws->qty:'-'}}</td>
                                <td>
                                    {{!empty($product_raws->w_name)?$product_raws->w_name:'-'}}
                                </td>
                            </tr>
                            @endforeach

                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="card shadow-sm">
                    <div class="card-header border-0">
                        <h3 class="card-title"><b>Released Product</b></h3>
{{--                        <div class="card-tools">--}}
{{--                            <a href="#" class="btn btn-tool btn-sm">--}}
{{--                                <i class="fas fa-download"></i>--}}
{{--                            </a>--}}
{{--                            <a href="#" class="btn btn-tool btn-sm">--}}
{{--                                <i class="fas fa-bars"></i>--}}
{{--                            </a>--}}
{{--                        </div>--}}
                    </div>
                    <div class="card-body table-responsive p-0">
                        <table class="table table-striped table-valign-middle">
                            <thead>
                            <tr>
                                <th>Product Name</th>
                                <th>Stock limit</th>
                                <th>Stock</th>
                                <th>warehouses</th>
                            </tr>
                            </thead>
                            <tbody>
                            @foreach( $product_rele as $product_reles)
                            <tr>
                                <td>
{{--                                    <img src="dist/img/default-150x150.png" alt="Product 1" class="img-circle img-size-32 mr-2">--}}
                                    {{$product_reles->name}}
                                </td>
                                <td> {{!empty($product_reles->stock_alert_limit)?$product_reles->stock_alert_limit:'-'}}</td>
                                <td> {{!empty($product_reles->qty)?$product_reles->qty:'-'}}</td>
                                <td>
                                    {{!empty($product_reles->w_name)?$product_reles->w_name:'-'}}
                                </td>
                            </tr>
                            @endforeach

                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="card shadow-sm">
                    <div class="card-header border-0">
                        <h3 class="card-title"><b>Finished Product</b></h3>
                        {{--                        <div class="card-tools">--}}
                        {{--                            <a href="#" class="btn btn-tool btn-sm">--}}
                        {{--                                <i class="fas fa-download"></i>--}}
                        {{--                            </a>--}}
                        {{--                            <a href="#" class="btn btn-tool btn-sm">--}}
                        {{--                                <i class="fas fa-bars"></i>--}}
                        {{--                            </a>--}}
                        {{--                        </div>--}}
                    </div>
                    <div class="card-body table-responsive p-0">
                        <table class="table table-striped table-valign-middle">
                            <thead>
                            <tr>
                                <th>Product Name</th>
                                <th>Stock limit</th>
                                <th>Stock</th>
                                <th>warehouses</th>
                            </tr>
                            </thead>
                            <tbody>
                            @foreach( $product_fin as $product_fins)
                                <tr>
                                    <td>
                                        {{--                                    <img src="dist/img/default-150x150.png" alt="Product 1" class="img-circle img-size-32 mr-2">--}}
                                        {{$product_fins->name}}
                                    </td>
                                    <td> {{!empty($product_fins->stock_alert_limit)?$product_fins->stock_alert_limit:'-'}}</td>
                                    <td> {{!empty($product_fins->qty)?$product_fins->qty:'-'}}</td>
                                    <td>
                                        {{!empty($product_fins->w_name)?$product_fins->w_name:'-'}}
                                    </td>
                                </tr>
                            @endforeach

                            </tbody>
                        </table>
                    </div>
                </div>
                <!-- /.card -->
            </div>
            <!-- /.col-md-6 -->
        </div>
        <!-- /.row -->
    </div>
@endsection

@push('scripts')
    <script src="{{ mix('_assets/plugins/chart.js/chart.js') }}"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>

    <script>
        const purchaseData = @json($purchaseData);
        const saleData = @json($saleData);

        const purchaseDataByPrice = @json($purchaseDataByPrice);
        const saleDataByPrice = @json($saleDataByPrice);
    </script>
@endpush
