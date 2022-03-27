@extends('layouts.app-admin')
@section('title', 'Add Released Product')

@push('styles')
    <link rel="stylesheet" href="{{ mix('_assets/plugins/select2/select2.css') }}">
    <link rel="stylesheet" href="{{ mix('_assets/plugins/flatpickr/flatpickr.css') }}">

    <style>
        .dynamic-btn {
            display: flex;
            justify-content: center;
            align-items: center;
            margin-top: 50px !important;
            position: relative;
            top: -15px;
        }
        .empty-products-warning {
            display: flex;
            height: 80px;
            border: 1px dashed #17a2b8;
            justify-content: center;
            align-items: center;
            font-size: 16px;
            font-weight: 500;
            margin: 50px;
        }
    </style>
@endpush

@section('add-new-button')
    <a type="button" href="{{ route('admin.release.index') }}" class="btn btn-info btn-sm float-sm-right">View List</a>
@endsection

@section('content')
{{--    @forelse($products as $product)--}}
{{--        {{ dd($product->id) }}--}}
{{--        {{ dd($released_product_info['released_product']->released_product->id) }}--}}
{{--        {{ $product->id == old('released_product', $released_product_info['released_product']->released_product->id ? 'matched' : 'not') }}--}}
{{--    @empty--}}
{{--        <option>No Products Available</option>--}}
{{--    @endforelse--}}





    <div class="card">
        <div class="card-header">
            <h3 class="card-title">Add Released Product</h3>
        </div>
        <!-- /.card-header -->
        <div class="card-body">
            <form action="{{ route('admin.release.update', $released_product_info['released_product']->id) }}"
                  method="POST"
                  autocomplete="off"
                  id="form"
            >
                @csrf @method('PATCH')

                <div class="row">
                    <div class="col-sm-5">
                        <div class="form-group">
                            <label for="released_date">Released Date<span class="text-danger"> *</span></label>
                            <input type="text"
                                   value="{{ old('released_date', $released_product_info['released_product']->date) }}"
                                   id="released_date"
                                   name="released_date"
                                   class="form-control released_date {{ $errors->has('released_date') ? ' is-invalid' : '' }}"
                                   aria-describedby="released_date"
                                   placeholder="{{ old('released_date') ?? "Select a Released Date" }}"
                                   required
                            >
                            @if($errors->has('released_date'))
                                <span class="invalid-feedback">
                                <strong>{{ $errors->first('released_date') }}</strong>
                            </span>
                            @endif
                        </div>
                    </div>

                    <div class="col-sm-7">
                        <div class="form-group">
                            <label for="released_from" class="col-form-label">Released From<span class="text-danger"> *</span></label>
                            <input type="hidden" name="released_from" value="{{ $released_product_info['released_product']->released_from->id }}">
                            <select class="form-control released-from select2bs4 {{ $errors->has('released_from') ? ' is-invalid' : '' }}"
                                    id="released_from"
                                    name="released_from"
                                    style="width: 100%;"
                                    data-placeholder="Choose a Warehouse"
                                    required
                                    disabled
                            >
                                <option value="{{ $released_product_info['released_product']->released_from->id }}"
                                        {{ $released_product_info['released_product']->released_from->id }}
                                        selected
                                >
                                    {{ $released_product_info['released_product']->released_from->name }}
                                </option>
                            </select>
{{--                            @if($errors->has('released_from'))--}}
{{--                                <span class="invalid-feedback">--}}
{{--                                    <strong>{{ $errors->first('released_from') }}</strong>--}}
{{--                                </span>--}}
{{--                            @endif--}}
                        </div>
                    </div>
                </div>

                @forelse($released_product_info['used_products'] as $used_product)
                    <div class="row">
                        <div class="col-sm-7 form-group">
                            <label for="products-{{ $loop->iteration }}" class="col-form-label">Product Name<span class="text-danger"> *</span></label>
                            <input type="hidden" name="products[]" value="{{ $used_product->product_id }}">
                            <select class="form-control product-select select2bs4"
                                    id="products-{{ $loop->iteration }}"
                                    name="products[]"
                                    style="width: 100%;"
                                    data-placeholder="Choose a Product"
                                    required
                                    disabled
                            >
                                <option value="{{ $used_product->product_id }}"
                                        {{ $used_product->product_id }}
                                        selected
                                >
                                    {{ '>' . ' ' . $used_product->name }}
                                </option>
                            </select>
                        </div>

                        <div class="col-sm-2 form-group">
                            <label for="stock-1" class="col-form-label">Stock</label>
                            <input type="text" class="form-control" id="stock-1" name="stock" value="{{ $used_product->stock }}" disabled>
                        </div>

                        <div class="col-sm-3 form-group">
                            <label for="qunatities" class="col-form-label">Used<span class="text-danger"> *</span></label>
                            <input type="number"
                                   step="any"
                                   min="0"
                                   id="qunatities-1"
                                   data-number="1"
                                   value="{{ old('quantities', $used_product->qty) }}"
                                   name="quantities[]"
                                   placeholder="Quantity"
                                   class="form-control"
                                   required
                            >
                        </div>

                        {{--                    <a href="javascript:void(0);" title="Add More" class="col-md-1 add_button btn btn-sm btn-info dynamic-btn"><i class="fas fa-plus"></i></a>--}}
                    </div>
                @empty
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="empty-products-warning">
                                <p class="m-0">Oops, Looks like used product list is unavailable</p>
                            </div>
                        </div>
                    </div>
                @endforelse

                <div class="row">
                    <div class="field_wrapper col-md-12"></div>
                </div>

                <div class="row">
                    <div class="col-sm-3">
                        <div class="form-group">
                            <label for="product_type" class="col-form-label">Product Type<span class="text-danger"> *</span></label>
                            <select class="form-control product-type select2bs4 {{ $errors->has('product_type') ? ' is-invalid' : '' }}"
                                    id="product_type"
                                    name="product_type"
                                    style="width: 100%;"
                                    data-placeholder="Choose a Product Type"
                                    required
                            >
                                <option></option>
                                @foreach($product_types as $id => $product_type)
                                    <option value="{{ $id }}"
                                        {{ $id == old('product_type', $released_product_info['released_product']->product_type_id) ? 'selected' : '' }}
                                    >
                                        {{ $product_type }}
                                    </option>
                                @endforeach
                            </select>
                            @if($errors->has('product_type'))
                                <span class="invalid-feedback">
                                    <strong>{{ $errors->first('product_type') }}</strong>
                                </span>
                            @endif
                        </div>
                    </div>

                    <div class="col-sm-4">
                        <div class="form-group">
                            <label for="released_product" class="col-form-label">Released Product<span class="text-danger"> *</span></label>
                            <select class="form-control released-product select2bs4 {{ $errors->has('released_product') ? ' is-invalid' : '' }}"
                                    id="released_product"
                                    name="released_product"
                                    style="width: 100%;"
                                    data-placeholder="Choose a Product"
                                    required
                            >
                                @forelse($products as $product)
                                    <option value="{{ $product->id }}"
                                            {{ $product->id == old('released_product', $released_product_info['released_product']->released_product->id) ? 'selected' : '' }}
                                    >
                                        {{ '>' . ' ' . $product->code . ' - ' . $product->name  }}
                                    </option>
                                @empty
                                    <option>No Products Available</option>
                                @endforelse
                            </select>
                            @if($errors->has('released_product'))
                                <span class="invalid-feedback">
                                    <strong>{{ $errors->first('released_product') }}</strong>
                                </span>
                            @endif
                        </div>
                    </div>

                    <div class="col-sm-2 form-group">
                        <label for="released_product_stock" class="col-form-label">Stock</label>
                        <input type="text" class="form-control" id="released_product_stock" name="released_product_stock" value="{{ $released_product_info['released_product']->released_product->stock }}" disabled>
                    </div>

                    <div class="col-sm-3 form-group">
                        <label for="quantity" class="col-form-label">Quantity<span class="text-danger"> *</span></label>
                        <input type="number"
                               min="0"
                               id="quantity"
                               name="quantity"
                               value="{{ old('quantity', $released_product_info['released_product']->released_product->qty) }}"
                               placeholder="Quantity"
                               class="form-control {{ $errors->has('quantity') ? ' is-invalid' : '' }}"
                               required
                        >
                        @if($errors->has('quantity'))
                            <span class="invalid-feedback">
                                <strong>{{ $errors->first('quantity') }}</strong>
                            </span>
                        @endif
                    </div>
                </div>

                <div class="row">
                    <div class="col-sm-12">
                        <div class="form-group">
                            <label for="note">Note</label>
                            <textarea type="text"
                                      name="note"
                                      rows="3"
                                      class="form-control {{ $errors->has('note') ? ' is-invalid' : '' }}"
                                      id="note"
                                      placeholder=""
                                      required
                            >{{ old('note', $released_product_info['released_product']->note) }}</textarea>
                            @if($errors->has('note'))
                                <span class="invalid-feedback">
                                    <strong>{{ $errors->first('note') }}</strong>
                                </span>
                            @endif
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-sm-12">
                        <button type="submit" class="btn btn-info btn-sm float-right">Submit</button>
                    </div>
                </div>
            </form>
        </div>
        <!-- /.card-body -->
    </div>
@endsection

@push('scripts')
    <script src="{{ mix('_assets/plugins/select2/select2.js') }}"></script>
    <script src="{{ mix('_assets/plugins/flatpickr/flatpickr.js') }}"></script>
    <script src="{{ mix('_assets/plugins/dynamic_field/dynamic-field-released.js') }}"></script>

    <script>
        // flatpickr
        const myInput = [
            document.querySelector(".released_date"),
        ];
        const fp = flatpickr(myInput, {
            dateFormat: "d-m-Y",
            weekNumbers: true,
            allowInput: true
        });
    </script>

    <script>
        // get products for selected purchase
        $(document).ready(function(){
            $(".released-from").on("change", function () {
                let released_from =  $("#released_from option:selected").val();
                if (released_from) {
                    $.ajax({
                        type: "GET",
                        dataType : 'json',
                        url: '/api/dashboard/transfer/get-products-by-warehouse',
                        data: {
                            id: released_from
                        }
                    })
                        .done(function(data){
                            if (data) {
                                $("#products-1").empty();
                                $.each(data, function(key,value){
                                    $("#products-1").append('<option></option><option value="'+value.id+'">'+ '>' + ' ' +value.code+ ' ' + '-' + ' ' +value.name+'</option>');
                                });
                            } else {
                                $("#products-1").empty();
                            }
                        })
                        .fail(function(){
                            console.log('Ajax Failed')
                        });
                } else {
                    $("#products-1").empty();
                }
            });
        });
    </script>

    <script>
        // get stock by product
        $(".product-select").on("change", function () {
            let product_id =  $("#products-1").find(":selected").val();
            let warehouse_id =  $("#released_from").find(":selected").val();

            $.ajax({
                type: "GET",
                dataType : 'json',
                url: '/api/dashboard/transfer/get-stock',
                data: {
                    product_id: product_id,
                    warehouse_id: warehouse_id
                }
            })
                .done(function(data){
                    console.log(data)
                    $("#stock-1").val(data.stock + ' ' + data.shortcut)
                })
                .fail(function(){
                    console.log('Ajax Failed')
                });
        });
    </script>


    <script>
        // get products by type
        $(document).ready(function(){
            $(".product-type").on("change", function () {
                let product_type =  $("#product_type option:selected").val();
                if (product_type) {
                    $.ajax({
                        type: "GET",
                        dataType : 'json',
                        url: '/api/dashboard/products',
                        data: {
                            query: product_type
                        }
                    })
                        .done(function(data){
                            if (data) {
                                $("#released_product").empty();
                                $.each(data, function(key,value){
                                    $("#released_product").append('<option></option><option class="rel-option" value="'+value.id+'">'+ '>' + ' ' +value.code+ ' ' + '-' + ' ' +value.name+'</option>');
                                });
                            } else {
                                $("#released_product").empty();
                            }
                        })
                        .fail(function(data){
                            const WarningToast = Swal.mixin({
                                toast: true,
                                // position: 'bottom-left',
                                position: 'top-right',
                                showConfirmButton: false,
                                showCloseButton: true,
                                timer: 1500,
                                showClass: {
                                    popup: 'swal2-show',
                                    backdrop: 'swal2-backdrop-show',
                                    icon: 'swal2-icon-show',
                                },
                                hideClass: {
                                    popup: 'swal2-hide',
                                    backdrop: 'swal2-backdrop-hide',
                                    icon: 'swal2-icon-hide'
                                },
                                customClass: 'swal-toast-height',
                                // background: '#E9EFE8'
                                background: '#ffffff'
                            })
                            WarningToast.fire({
                                icon: data.responseJSON.alert_type,
                                title: data.responseJSON.message
                            })
                        });
                } else {
                    $("#released_product").empty();
                }
            });
        });
    </script>

    <script>
        // get stock by product
        $(".released-product").on("change", function () {
            let product_id =  $("#released_product").find(":selected").val();
            let warehouse_id =  $("#released_from").find(":selected").val();

            if (warehouse_id) {
                $.ajax({
                    type: "GET",
                    dataType : 'json',
                    url: '/api/dashboard/products/get-stock',
                    data: {
                        product_id: product_id,
                        warehouse_id: warehouse_id
                    }
                })
                    .done(function(data){
                        console.log(data)
                        $("#released_product_stock").val(data.stock + ' ' + data.shortcut)
                    })
                    .fail(function(){
                        console.log('Ajax Failed')
                    });
            } else {
                const WarningToast = Swal.mixin({
                    toast: true,
                    // position: 'bottom-left',
                    position: 'top-right',
                    showConfirmButton: false,
                    showCloseButton: true,
                    timer: 1500,
                    showClass: {
                        popup: 'swal2-show',
                        backdrop: 'swal2-backdrop-show',
                        icon: 'swal2-icon-show',
                    },
                    hideClass: {
                        popup: 'swal2-hide',
                        backdrop: 'swal2-backdrop-hide',
                        icon: 'swal2-icon-hide'
                    },
                    customClass: 'swal-toast-height',
                    // background: '#E9EFE8'
                    background: '#ffffff'
                })
                WarningToast.fire({
                    icon: 'warning',
                    title: 'No Warehouse Selected'
                })

                $("#released_product").empty()
                $('#product_type').val(null).trigger('change');
            }
        });
    </script>
@endpush
