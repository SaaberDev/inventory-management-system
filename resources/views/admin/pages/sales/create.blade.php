@extends('layouts.app-admin')
@section('title', 'Add Sales')

@push('styles')
    <link rel="stylesheet" href="{{ mix('_assets/plugins/select2/select2.css') }}">
    <link rel="stylesheet" href="{{ mix('_assets/plugins/flatpickr/flatpickr.css') }}">
    <link rel="stylesheet" href="{{ mix('_assets/plugins/dropzone/css/dropzone.css') }}">
    <style>
        .dynamic-btn {
            display: flex;
            justify-content: center;
            align-items: center;
            margin-top: 50px !important;
            position: relative;
            top: -15px;
        }

        .select2-container--bootstrap4 .select2-results__group {
            display: list-item;
            padding: 6px;
            color: #17a2b8;
        }

        .dropzone {
            min-height: 140px;
            background-color: rgb(19 132 150 / 5%);
            padding: 0;
            border: 1px dashed #138496;
        }

        .dropzone .dz-message {
            text-align: center;
            margin: 0;
            font-size: 16px;
        }

        .dropzone .dz-message .dz-button {
            background: none;
            color: inherit;
            border: none;
            padding: 0;
            font: inherit;
            cursor: pointer;
            outline: inherit;
            font-weight: 300;
        }

        .dropzone .dz-preview .dz-error-message {
            pointer-events: none;
            z-index: 1000;
            position: absolute;
            display: block;
            display: none;
            opacity: 0;
            -webkit-transition: opacity 0.3s ease;
            -moz-transition: opacity 0.3s ease;
            -ms-transition: opacity 0.3s ease;
            -o-transition: opacity 0.3s ease;
            transition: opacity 0.3s ease;
            border-radius: 8px;
            font-size: 13px;
            top: 150px;
            left: -10px;
            width: 140px;
            background: #be2626;
            background: linear-gradient(to bottom, #be2626, #a92222);
            padding: 0.5em 1.2em;
            color: white;
        }

        .dropzone.dz-clickable .dz-message, .dropzone.dz-clickable .dz-message * {
            cursor: pointer;
            font-weight: 300;
            line-height: 40px;
            margin-top: 20px;
            margin-bottom: 20px;
        }
        .dz-thumb {
            width: 100%;
            height: 100%;
            object-fit: contain!important;
        }
        .dropzone .dz-preview.dz-image-preview {
            background: transparent;
        }
    </style>
@endpush

{{--@section('add-new-button')--}}
{{--    <a type="button" href="{{ route('admin.purchase.self.index') }}" class="btn btn-info btn-sm float-sm-right">View List</a>--}}
{{--@endsection--}}

@section('content')
    <div class="card">
        <div class="card-header">
            <h3 class="card-title">Add Sales</h3>
        </div>
        <!-- /.card-header -->
        <div class="card-body">
            <form action="{{ route('admin.sales.self.store') }}"
                  method="POST"
                  autocomplete="off"
                  enctype="multipart/form-data"
                  id="form"
            >
                @csrf @method('POST')

                <div class="row">
                    <div class="col-sm-6">
                        <div class="form-group">
                        <label for="sales_date">Sales Date<span class="text-danger"> *</span></label>
                        <input type="text"
                               value="{{ old('sales_date') }}"
                               id="sales_date"
                               name="sales_date"
                               class="form-control purchase_date {{ $errors->has('sales_date') ? ' is-invalid' : '' }}"
                               aria-describedby="purchase_date"
                               placeholder="{{ old('sales_date') ?? "Select a Sales Date" }}"
                               required
                        >
                        @if($errors->has('sales_date'))
                            <span class="invalid-feedback">
                                <strong>{{ $errors->first('sales_date') }}</strong>
                            </span>
                        @endif
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="form-group">
                            <label for="client">Client Name<span class="text-danger"> *</span></label>
                            <select class="form-control select2bs4 {{ $errors->has('client.0') ? ' is-invalid' : '' }}"
                                    id="client"
                                    name="client"
                                    style="width: 100%;"
                                    data-placeholder="Choose a Client"
                                    required
                            >
                                <option></option>
                                @foreach($client as $clients)
                                    <option value="{{ $clients->id }}"
                                        {{ $clients->id == old('clients') ? 'selected' : '' }}
                                    >
                                        {{ $clients->name }}
                                    </option>
                                @endforeach
                            </select>
                            @if($errors->has('clients.0'))
                                <span class="invalid-feedback">
                                <strong>{{ $errors->first('clients.0') }}</strong>
                            </span>
                            @endif
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-sm-3 form-group">
                        <label for="products-1" class="col-form-label">Product Name<span class="text-danger"> *</span></label>
                        <select class="form-control product-select select2bs4"
                                id="products-1"
                                name="products[]"
                                style="width: 100%;"
                                data-placeholder="Choose a Product"
                                required
                        >
                            <option></option>
                            <optgroup label="{{ $product_type->name }}">
                                @foreach($product_type->products as $product)
                                    <option value="{{ $product->id }}">
                                        {{ '>' . ' ' . $product->name }}
                                    </option>
                                @endforeach
                            </optgroup>
                        </select>
                    </div>

                    <div class="col-sm-3 form-group">
                        <div class="row">
                            <div class="col-md-6">
                                <label for="qunatities" class="col-form-label">Quantity<span class="text-danger"> *</span></label>
                                <input type="number"
                                       step="any"
                                       min="0"
                                       id="qunatities-1"
                                       data-number="1"
                                       name="quantities[]"
                                       placeholder="Quantity"
                                       class="form-control calculator quantity"
                                       required
                                >
                            </div>

                            <div class="col-md-6">
                                <label for="stock-1" class="col-form-label">Stock</label>
                                <input type="text" class="form-control stock" id="stock-1" name="stock" value="" disabled>

                            </div>
                        </div>
                    </div>

                    <div class="col-sm-3 form-group">
                        <div class="row">
                            <div class="col-md-6">
                                <label for="unitPrices[]" class="col-form-label">Unit Price<span class="text-danger"> *</span></label>
                                <input type="number"
                                       step="any"
                                       min="0"
                                       id="unitPrices-1"
                                       data-number="1"
                                       name="unitPrices[]"
                                       placeholder="Unit Price"
                                       class="form-control calculator"
                                       required
                                >
                            </div>

                            <div class="col-sm-6">
                                <label for="discounts[]" class="col-form-label">Discount(%)</label>
                                <input type="number"
                                       step="any"
                                       min="0"
                                       max="99"
                                       id="discounts-1"
                                       data-number="1"
                                       name="discounts[]"
                                       placeholder="Discount"
                                       class="form-control calculator"
                                >
                            </div>
                        </div>
                    </div>

                    <div class="col-sm-2 form-group">
                        <label for="singleTotal[]" class="col-form-label">Product Total</label>
                        <input type="text"
                               step="any"
                               min="0"
                               id="singleTotal-1"
                               name="singleTotal[]"
                               placeholder="Product Total"
                               readonly="readonly"
                               class="form-control"
                        >
                    </div>
                    <a href="javascript:void(0);" title="Add More" class="col-md-1 add_button btn btn-sm btn-info dynamic-btn"><i class="fas fa-plus"></i></a>
                </div>

                <div class="row">
                    <div class="field_wrapper col-md-12"></div>
                </div>

                <div class="row">
                    <div class="col-sm-3 form-group">
                        <label for="subTotal" class="col-form-label">Sub Total</label>
                        <input type="number"
                               step="any"
                               min="0"
                               id="subTotal"
                               name="subTotal"
                               placeholder="Sub Total"
                               readonly="readonly"
                               class="form-control"
                        >
                    </div>
                    <div class="col-sm-3 form-group">
                        <label for="totalDiscount" class="col-form-label">Total Discount</label>
                        <input type="number"
                               step="any"
                               min="0"
                               id="totalDiscount"
                               name="totalDiscount"
                               placeholder="Total Discount"
                               readonly="readonly"
                               class="form-control"
                        >
                    </div>
                    <div class="col-sm-3 form-group">
                        <label for="transportCost" class="col-form-label">Transport Cost</label>
                        <input type="number"
                               step="any"
                               min="0"
                               id="transportCost"
                               name="transportCost"
                               placeholder="Transport Cost"
                               class="form-control"
                        >
                    </div>
                    <div class="col-sm-3 form-group">
                        <label for="total" class="col-form-label">Grand Total</label>
                        <input type="number"
                               step="any"
                               min="0"
                               id="total"
                               name="total"
                               placeholder="Grand Total"
                               readonly="readonly"
                               class="form-control"
                        >
                    </div>
                </div>

                <div class="row">
                    <div class="col-sm-6">
                        <div class="form-group">
                            <label for="">Total Paid<span class="text-danger"> *</span></label>
                            <input type="text"
                                   value="{{ old('total_paid') }}"
                                   name="total_paid"
                                   class="form-control {{ $errors->has('total_paid') ? ' is-invalid' : '' }}"
                                   placeholder="Total Paid"
                                   required
                            >
                            @if($errors->has('total_paid'))
                                <span class="invalid-feedback">
                                <strong>{{ $errors->first('total_paid') }}</strong>
                            </span>
                            @endif
                        </div>
                    </div>

                    <div class="col-sm-3">
                        <div class="form-group">
                            <label>Payment Method<span class="text-danger"> *</span></label>
                            <select class="form-control select2bs4_2 {{ $errors->has('payment_method') ? ' is-invalid' : '' }}"
                                    id="payment_method"
                                    name="payment_method"
                                    style="width: 100%;"
                                    data-placeholder="Choose a Payment Method"
                                    data-minimum-results-for-search="Infinity"
                                    required
                            >
                                <option></option>
                                <option value="bkash" {{ old('payment_method') == 'bkash' ? 'selected' : '' }}>Bkash</option>
                                <option value="cash" {{ old('payment_method') == 'cash' ? 'selected' : '' }}>Cash</option>
                                <option value="card" {{ old('payment_method') == 'card' ? 'selected' : '' }}>Card</option>
                                <option value="cheque" {{ old('payment_method') == 'cheque' ? 'selected' : '' }}>Cheque</option>
                            </select>
                            @if($errors->has('payment_method'))
                                <span class="invalid-feedback">
                                <strong>{{ $errors->first('payment_method') }}</strong>
                            </span>
                            @endif
                        </div>
                    </div>

                    <div class="col-sm-3">
                        <div class="form-group">
                            <label for="payment_status">Payment Status<span class="text-danger"> *</span></label>
                            <select class="form-control select2bs4_3 {{ $errors->has('payment_status') ? ' is-invalid' : '' }}"
                                    id="payment_status"
                                    name="payment_status"
                                    style="width: 100%;"
                                    data-placeholder="Choose a Payment Status"
                                    data-minimum-results-for-search="Infinity"
                                    required
                            >
                                <option></option>
                                <option value="paid" {{ old('payment_status') == 'paid' ? 'selected' : '' }}>Paid</option>
                                <option value="due" {{ old('payment_status') == 'due' ? 'selected' : '' }}>Due</option>
                            </select>
                            @if($errors->has('payment_status'))
                                <span class="invalid-feedback">
                                <strong>{{ $errors->first('payment_status') }}</strong>
                            </span>
                            @endif
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-sm-12">
                        <div class="form-group">
                            <label for="note">Note</label>
                            <textarea type="text"
                                      name="note"
                                      rows="3"
                                      class="form-control"
                                      id="note"
                                      placeholder=""
                            ></textarea>
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
    <script src="{{ mix('_assets/plugins/dynamic_field/dynamic-field-sales.js') }}"></script>
    <script src="{{ mix('_assets/plugins/dropzone/js/dropzone.js') }}"></script>
    {{-- Dropzone Multiple Upload --}}
    @include('plugins.dropzone.create.multiple', [
        'dropzone' => Str::camel('multiple-media-dropzone'),
        'fileInputName' => 'multiple_media',
        'store' => '',
        'delete' => '',
        'maxFilesize' => 2,
        'acceptedFiles' => 'image/jpeg, image/png',
    ])

    <script>
        // flatpickr
        const myInput = [
            document.querySelector(".purchase_date"),
        ];
        const fp = flatpickr(myInput, {
            dateFormat: "d-m-Y",
            weekNumbers: true,
            allowInput: true
        });
    </script>

    <script>
        const URL = '/api/dashboard/sales';
        // get stock by product
        $(".product-select").on("change", function () {
            let product_id =  $("#products-1").find(":selected").val();
            $.ajax({
                type: "GET",
                dataType : 'json',
                url: URL + '/get-stock',
                data: {
                    id: product_id
                }
            })
                .done(function(data){
                    $("#stock-1").val(data.stock + ' ' + data.shortcut)
                })
                .fail(function(){
                    console.log('Ajax Failed')
                });
        });
        $(document).ready(function(){
            $("#qunatities-1").blur(function(){
                var quantity = $('#qunatities-1').val();
                var stock = $('#stock-1').val();
                if( stock < quantity){
                    alert("Quantity should be less or Equal than Stock.");
                    $('#qunatities-1').val('');
                }

            });
        });
    </script>
@endpush
