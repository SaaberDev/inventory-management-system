@extends('layouts.app-admin')
@section('title', 'Edit Purchase')

@push('styles')
    <link rel="stylesheet" href="{{ mix('_assets/plugins/select2/select2.css') }}">
    <link rel="stylesheet" href="{{ mix('_assets/plugins/flatpickr/flatpickr.css') }}">
    <link rel="stylesheet" href="{{ mix('_assets/plugins/dropzone/css/dropzone.css') }}">
    <style>
        .dynamic-btn {
            display: flex;
            justify-content: center;
            align-items: center;
            margin-top: 55px !important;
            position: relative;
            top: -15px;
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
            width: 120px;
            height: 120px;
            object-fit: contain!important;
        }
        .dropzone .dz-preview.dz-image-preview {
            background: transparent;
        }
    </style>
@endpush

@section('add-new-button')
    <a type="button" href="{{ route('admin.purchase.self.index') }}" class="btn btn-info btn-sm float-sm-right">View List</a>
@endsection

@section('content')
    <div class="card">
        <div class="card-header">
            <h3 class="card-title">Edit Purchase</h3>
        </div>
        <!-- /.card-header -->
        <div class="card-body">
            <form action="{{ route('admin.purchase.self.update', $purchase->id) }}"
                  method="POST"
                  autocomplete="off"
                  enctype="multipart/form-data"
                  id="form"
            >
                @csrf @method('PATCH')

                <div class="row">
                    <div class="col-sm-6">
                        <div class="form-group">
                            <label for="">Purchase Date<span class="text-danger"> *</span></label>
                            <input type="text"
                                   value="{{ old('purchase_date', $purchase->purchase_date) }}"
                                   name="purchase_date"
                                   class="form-control purchase_date {{ $errors->has('purchase_date') ? ' is-invalid' : '' }}"
                                   aria-describedby="purchase_date"
                                   placeholder="Select a Purchase Date"
                            >
                            @if($errors->has('purchase_date'))
                                <span class="invalid-feedback">
                                <strong>{{ $errors->first('purchase_date') }}</strong>
                            </span>
                            @endif
                        </div>
                    </div>

                    <div class="col-sm-6">
                        <div class="form-group">
                            <label>Supplier<span class="text-danger"> *</span></label>
                            <select class="form-control select2bs4 {{ $errors->has('supplier') ? ' is-invalid' : '' }}"
                                    id="supplier"
                                    name="supplier"
                                    style="width: 100%;"
                                    data-placeholder="Choose a Supplier"
                                    required
                            >
                                <option></option>
                                @foreach($suppliers as $supplier)
                                    <option value="{{ $supplier->id }}"
                                        {{ $purchase->supplier_id == $supplier->id ? 'selected' : '' }}
                                    >
                                        {{ $supplier->name }}
                                    </option>
                                @endforeach
                            </select>
                            @if($errors->has('supplier'))
                                <span class="invalid-feedback">
                                <strong>{{ $errors->first('supplier') }}</strong>
                            </span>
                            @endif
                        </div>
                    </div>
                </div>


                <div class="row">
                    @foreach($purchase_details as $purchase_detail)
                        <div class="col-sm-3 form-group">
                            <label for="products-{{ $loop->index }}" class="col-form-label">Product Name<span class="text-danger"> *</span></label>
                            <select class="form-control select2bs4"
                                    id="products-{{ $loop->index }}"
                                    name="products[]"
                                    style="width: 100%;"
                                    data-placeholder="Choose a Product"
                                    required
                            >
                                <option></option>
                                <optgroup label="{{ $product_type->name }}">
                                    @foreach($product_type->products as $product)
                                        <option value="{{ $product->id }}"
                                            {{ $product->id == $purchase_detail->product_id ? 'selected' : '' }}
                                        >
                                            {{ '>' . ' ' . $product->name }}
                                        </option>
                                    @endforeach
                                </optgroup>
                            </select>

                            @if($errors->has('products.' . $loop->index))
                                <span class="invalid-feedback">
                                    <strong>{{ $errors->first('products.' . $loop->index) }}</strong>
                                </span>
                            @endif
                        </div>

                        <div class="col-sm-3">
                            <div class="row">
                                <div class="col-md-6">
                                    <label for="qunatities-{{ $loop->iteration }}" class="col-form-label">Quantity<span class="text-danger"> *</span></label>
                                    <input type="number"
{{--                                           step="any"--}}
                                           min="1"
                                           id="qunatities-{{ $loop->iteration }}"
                                           data-number="{{ $loop->iteration }}"
                                           data-old="{{ $purchase_detail->qty }}"
                                           name="quantities[]"
                                           value="{{ old('quantities.' . $loop->index, $purchase_detail->qty) }}"
                                           placeholder="Quantity"
                                           class="form-control edit-calculator"
                                           required
                                    >
                                </div>

                                <div class="col-md-6">
                                    <label for="stock-{{ $loop->iteration }}" class="col-form-label">Stock</label>
                                    <input type="text"
                                           class="form-control"
                                           id="stock-{{ $loop->iteration }}"
                                           name="stock"
                                           value="{{ $purchase_detail->stock . ' ' . $purchase_detail->unit_shortcut }}"
                                           disabled
                                    >
                                </div>
                            </div>
                        </div>

                        <div class="col-sm-3 form-group">
                            <div class="row">
                                <div class="col-md-6">
                                    <label for="unitPrices-{{ $loop->iteration }}" class="col-form-label">Unit Price<span class="text-danger"> *</span></label>
                                    <input type="number"
{{--                                           step="any"--}}
                                           min="0"
                                           id="unitPrices-{{ $loop->iteration }}"
                                           data-number="{{ $loop->iteration }}"
                                           name="unitPrices[]"
                                           value="{{ old('unitPrices.' . $loop->index, $purchase_detail->unit_price) }}"
                                           placeholder="Unit Price"
                                           class="form-control edit-calculator"
                                           required
                                    >
                                </div>

                                <div class="col-sm-6">
                                    <label for="discounts-{{ $loop->iteration }}" class="col-form-label">Discount(%)</label>
                                    <input type="number"
                                           step="any"
                                           min="0"
                                           max="99"
                                           id="discounts-{{ $loop->iteration }}"
                                           data-number="{{ $loop->iteration }}"
                                           name="discounts[]"
                                           value="{{ old('discounts.' . $loop->index, $purchase_detail->single_discount) }}"
                                           placeholder="Discount"
                                           class="form-control edit-calculator"
                                    >
                                </div>
                            </div>
                        </div>

                        <div class="col-sm-2 form-group">
                            <label for="singleTotal-{{ $loop->iteration }}" class="col-form-label">Product Total</label>
                            <input type="number"
{{--                                   step="any"--}}
{{--                                   min="0"--}}
                                   id="singleTotal-{{ $loop->iteration }}"
                                   name="singleTotal[]"
                                   value="{{ old('singleTotal.' . $loop->index, $purchase_detail->single_total) }}"
                                   placeholder="Product Total"
                                   readonly="readonly"
                                   class="form-control"
                            >
                        </div>
                    @endforeach
{{--                        <a href="javascript:void(0);" title="Add More" class="col-md-1 add_button btn btn-sm btn-info dynamic-btn"><i class="fas fa-plus"></i></a>--}}
                </div>


{{--                <div class="row">--}}
{{--                    <div class="field_wrapper col-md-12"></div>--}}
{{--                </div>--}}

                <div class="row">
                    <div class="col-sm-3 form-group">
                        <label for="subTotal" class="col-form-label">Sub Total</label>
                        <input type="text"
{{--                               step="any"--}}
{{--                               min="0"--}}
                               id="subTotal"
                               name="subTotal"
                               value="{{ old('subTotal', $purchase->sub_total) }}"
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
                               value="{{ old('totalDiscount', $purchase->total_discount) }}"
                               placeholder="Total Discount"
                               readonly="readonly"
                               class="form-control"
                        >
                    </div>
                    <div class="col-sm-3 form-group">
                        <label for="transportCost" class="col-form-label">Transport Cost</label>
                        <input type="number"
{{--                               step="any"--}}
{{--                               min="0"--}}
                               id="transportCost"
                               name="transportCost"
                               value="{{ old('transportCost', $purchase->transport_cost) }}"
                               placeholder="Transport Cost"
                               class="form-control"
                        >
                    </div>
                    <div class="col-sm-3 form-group">
                        <label for="total" class="col-form-label">Grand Total</label>
                        <input type="number"
{{--                               step="any"--}}
{{--                               min="0"--}}
                               id="total"
                               name="total"
                               value="{{ old('total', $purchase->grand_total) }}"
                               placeholder="Grand Total"
                               readonly="readonly"
                               class="form-control"
                        >
                    </div>
                </div>
                <input type="hidden" value="{{ $purchase->purchaseDetails->count() }}" id="product-count" name="totalProducts">

                <div class="row">
                    <div class="col-sm-6">
                        <div class="form-group">
                            <label for="">Total Paid<span class="text-danger"> *</span></label>
                            <input type="text"
                                   name="total_paid"
                                   value="{{ old('total_paid', $purchase->total_paid) }}"
                                   class="form-control {{ $errors->has('total_paid') ? ' is-invalid' : '' }}"
                                   placeholder="Total Paid"
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
                                <option value="bkash" {{ $purchase->payment_method == 'bkash' ? 'selected' : '' }}>Bkash</option>
                                <option value="cash" {{ $purchase->payment_method == 'cash' ? 'selected' : '' }}>Cash</option>
                                <option value="card" {{ $purchase->payment_method == 'card' ? 'selected' : '' }}>Card</option>
                                <option value="cheque" {{ $purchase->payment_method == 'cheque' ? 'selected' : '' }}>Cheque</option>
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
                                <option value="paid" {{ $purchase->payment_status == 'paid' ? 'selected' : '' }}>Paid</option>
                                <option value="due" {{ $purchase->payment_status == 'due' ? 'selected' : '' }}>Due</option>
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
                            >{{ old('note', $purchase->note) }}</textarea>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-sm-12">
                        <div class="form-group">
                            <div class="needsclick dropzone" id="multiple-media-dropzone">
                                <div class="dz-message" data-dz-message>
                                    <span>Drop files here or click to upload.</span> <br>
                                    <span style="color: #dc3545;font-size: 13px;">Maximum allowed file size 2MB. Allowed file types are jpeg, png.</span>
                                </div>
                            </div>
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
    <script src="{{ mix('_assets/plugins/dynamic_field/dynamic-field-purchase.js') }}"></script>
    <script src="{{ mix('_assets/plugins/dropzone/js/dropzone.js') }}"></script>

    @include('plugins.dropzone.edit.multiple', [
        'dropzone' => Str::camel('multiple-media-dropzone'),
        'getRequestParam' => 'purchase',
        'fileInputName' => 'multiple_media',
        'get' => route('admin.purchase.self.getMedia'),
        'store' => route('admin.purchase.self.storeMedia'),
        'delete' => route('admin.purchase.self.deleteMedia'),
        'model' => $purchase, // your model name for query
        'maxFilesize' => 2,
        'maxFiles' => 6,
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
        // get stock by product
        $(".product-select").on("change", function () {
            let id =  $("#products-1").find(":selected").val();
            $.ajax({
                type: "POST",
                dataType : 'json',
                headers: {
                    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                },
                url: '/dashboard/purchase/get-stock/' + id,
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
