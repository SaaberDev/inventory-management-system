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
    </style>
@endpush

@section('add-new-button')
    <a type="button" href="{{ route('admin.release.index') }}" class="btn btn-info btn-sm float-sm-right">View List</a>
@endsection

@section('content')
    <div class="card">
        <div class="card-header">
            <h3 class="card-title">Add Released Product</h3>
        </div>
        <!-- /.card-header -->
        <div class="card-body">
            <form action="{{ route('admin.release.store') }}"
                  method="POST"
                  autocomplete="off"
                  id="form"
            >
                @csrf @method('POST')

                <div class="row">
                    <div class="col-sm-12">
                        <div class="form-group">
                            <label for="released_date">Released Date<span class="text-danger"> *</span></label>
                            <input type="text"
                                   value="{{ old('released_date') }}"
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
                </div>

                <div class="row">
                    <div class="col-sm-7 form-group">
                        <label for="products-1" class="col-form-label">Product Name<span class="text-danger"> *</span></label>
                        <select class="form-control product-select select2bs4"
                                id="products-1"
                                name="products[]"
                                style="width: 100%;"
                                data-placeholder="Choose a Product"
                                required
                        >
                            <option></option>
{{--                            @foreach($products as $product)--}}
{{--                                <option value="{{ $product->id }}"--}}
{{--                                    {{ $product->id == old('products') ? 'selected' : '' }}--}}
{{--                                >--}}
{{--                                    {{ '> ' . $product->name . ' - ' . $product->code }}--}}
{{--                                </option>--}}
{{--                            @endforeach--}}
                        </select>
                    </div>

                    <div class="col-sm-2 form-group">
                        <label for="stock-1" class="col-form-label">Stock</label>
                        <input type="text" class="form-control" id="stock-1" name="stock" value="" disabled>
                    </div>

                    <div class="col-sm-2 form-group">
                        <label for="qunatities" class="col-form-label">Used<span class="text-danger"> *</span></label>
                        <input type="number"
                               step="any"
                               min="0"
                               id="qunatities-1"
                               data-number="1"
                               name="quantities[]"
                               placeholder="Quantity"
                               class="form-control"
                               required
                        >
                    </div>

                    <a href="javascript:void(0);" title="Add More" class="col-md-1 add_button btn btn-sm btn-info dynamic-btn"><i class="fas fa-plus"></i></a>
                </div>

                <div class="row">
                    <div class="field_wrapper col-md-12"></div>
                </div>

                <div class="row">
                    <div class="col-sm-4">
                        <div class="form-group">
                            <label for="finished_product" class="col-form-label">Released Product<span class="text-danger"> *</span></label>
                            <select class="form-control finished-product select2bs4 {{ $errors->has('finished_product') ? ' is-invalid' : '' }}"
                                    id="finished_product"
                                    name="finished_product"
                                    style="width: 100%;"
                                    data-placeholder="Choose a Product"
                                    required
                            >
                                <option></option>
                                @foreach($finished_products as $finished_product)
                                    <option value="{{ $finished_product->id }}"
                                        {{ $finished_product->id == old('finished_product') ? 'selected' : '' }}
                                    >
                                        {{ '> ' . $finished_product->name . ' - ' . $finished_product->code }}
                                    </option>
                                @endforeach
                            </select>
                            @if($errors->has('finished_product'))
                                <span class="invalid-feedback">
                                    <strong>{{ $errors->first('finished_product') }}</strong>
                                </span>
                            @endif
                        </div>
                    </div>

                    <div class="col-sm-3 form-group">
                        <label for="finished_product_stock" class="col-form-label">Stock</label>
                        <input type="text" class="form-control" id="finished_product_stock" value="" disabled>
                    </div>

                    <div class="col-sm-5 form-group">
                        <label for="quantity" class="col-form-label">Quantity<span class="text-danger"> *</span></label>
                        <input type="number"
                               min="0"
                               id="quantity"
                               name="quantity"
                               value="{{ old('quantity') }}"
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
                            >{{ old('note') }}</textarea>
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
        (function() {
        $(".product-select").select2({
            theme: 'bootstrap4',
            ajax: {
                url: '/api/dashboard/released-products',
                dataType: 'json',
                delay: 250,
                data: function (params) {
                    return {
                        'term': params.term || '',
                        'page': params.page || 1
                    };
                },
                'cache': true
            },
        })
        })();

        // get stock by product
        $(".product-select").on("change", function () {
            let product_id =  $("#products-1").find(":selected").val();

            $.ajax({
                type: "GET",
                dataType : 'json',
                url: '/api/dashboard/released-products/get-stock',
                data: {
                    product_id: product_id
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
        // get stock by product
        $("#finished_product").on("change", function () {
            let product_id =  $(this).find(":selected").val();
            $.ajax({
                type: "GET",
                dataType : 'json',
                url: '/api/dashboard/released-products/get-stock',
                data: {
                    product_id: product_id
                }
            })
                .done(function(data){
                    // console.log(data)
                    $("#finished_product_stock").val(data.stock + ' ' + data.shortcut)
                })
                .fail(function(){
                    console.log('Ajax Failed')
                });
        });
    </script>
@endpush
