@extends('layouts.app-admin')
@section('title', '')

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
    <a type="button" href="{{ route('admin.transfer.index') }}" class="btn btn-info btn-sm float-sm-right">View List</a>
@endsection

@section('content')
    <div class="card">
        <div class="card-header">
            <h3 class="card-title">Add Transfer</h3>
        </div>
        <!-- /.card-header -->
        <div class="card-body">
            <form action="{{ route('admin.transfer.store') }}"
                  method="POST"
                  autocomplete="off"
                  enctype="multipart/form-data"
                  id="form"
            >
                @csrf @method('POST')

                <div class="row">
                    <div class="col-sm-4">
                        <div class="form-group">
                            <label for="transfer_date">Transfer Date<span class="text-danger"> *</span></label>
                            <input type="text"
                                   value="{{ old('transfer_date') }}"
                                   id="transfer_date"
                                   name="transfer_date"
                                   class="form-control transfer_date {{ $errors->has('transfer_date') ? ' is-invalid' : '' }}"
                                   aria-describedby="transfer_date"
                                   placeholder="{{ old('transfer_date') ?? "Select a Purchase Date" }}"
                                   required
                            >
                            @if($errors->has('transfer_date'))
                                <span class="invalid-feedback">
                                <strong>{{ $errors->first('transfer_date') }}</strong>
                            </span>
                            @endif
                        </div>
                    </div>

                    <div class="col-sm-4">
                        <div class="form-group">
                            <label for="transfer_from">From<span class="text-danger"> *</span></label>
                            <select class="form-control transfer-from select2bs4 {{ $errors->has('transfer_from') ? ' is-invalid' : '' }}"
                                    id="transfer_from"
                                    name="transfer_from"
                                    style="width: 100%;"
                                    data-placeholder="Choose a Warehouse"
                                    required
                            >
                                <option></option>
                                @foreach($from_warehouses as $id => $from_warehouse)
                                    <option value="{{ $id }}"
                                        {{ $id == old('transfer_from') ? 'selected' : '' }}
                                    >
                                        {{ $from_warehouse }}
                                    </option>
                                @endforeach
                            </select>
                            @if($errors->has('transfer_from'))
                                <span class="invalid-feedback">
                                    <strong>{{ $errors->first('transfer_from') }}</strong>
                                </span>
                            @endif
                        </div>
                    </div>

                    <div class="col-sm-4">
                        <div class="form-group">
                            <label for="transfer_to">To<span class="text-danger"> *</span></label>
                            <select class="form-control select2bs4 {{ $errors->has('transfer_to') ? ' is-invalid' : '' }}"
                                    id="transfer_to"
                                    name="transfer_to"
                                    style="width: 100%;"
                                    data-placeholder="Choose a Warehouse"
                                    disabled
                                    required
                            >
                                <option></option>
                                @foreach($to_warehouses as $id => $to_warehouse)
                                    <option value="{{ $id }}"
                                        {{ $id == old('transfer_to') ? 'selected' : '' }}
                                    >
                                        {{ $to_warehouse }}
                                    </option>
                                @endforeach
                            </select>
                            @if($errors->has('transfer_to'))
                                <span class="invalid-feedback">
                                <strong>{{ $errors->first('transfer_to') }}</strong>
                            </span>
                            @endif
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-sm-5 form-group">
                        <label for="products-1" class="col-form-label">Product Name<span class="text-danger"> *</span></label>
                        <select class="form-control product-select select2bs4"
                                id="products-1"
                                name="products[]"
                                style="width: 100%;"
                                data-placeholder="Choose a Product"
                                data-number="1"
                                required
                        >
                            <option></option>
                        </select>
                    </div>

                    <div class="col-sm-3 form-group">
                        <label for="stock-1" class="col-form-label">Stock</label>
                        <input type="text" class="form-control" id="stock-1" name="stock" value="" disabled>
                    </div>

                    <div class="col-sm-3 form-group">
                        <label for="qunatities" class="col-form-label">Quantity<span class="text-danger"> *</span></label>
                        <input type="number"
                               step="any"
                               min="0"
                               id="qunatities-1"
                               data-number="1"
                               name="quantities[]"
                               placeholder="Quantity"
                               class="form-control calculator"
                               required
                        >
                    </div>

                    <a href="javascript:void(0);" title="Add More" class="col-md-1 add_button btn btn-sm btn-info dynamic-btn"><i class="fas fa-plus"></i></a>
                </div>

                <div class="row">
                    <div class="field_wrapper col-md-12"></div>
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
                                      required
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
    <script src="{{ mix('_assets/plugins/dynamic_field/dynamic-field-transfer.js') }}"></script>

    <script>
        // flatpickr
        const myInput = [
            document.querySelector(".transfer_date"),
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
            let transfer_from;
            let transfer_to;

            $('#transfer_to, #transfer_from').on('change', function () {
                transfer_to =  $("#transfer_to option:selected").val();
                transfer_from =  $("#transfer_from option:selected").val();
                if (transfer_to === transfer_from) {
                    Swal.fire({
                        text:"Cannot transfer in same warehouse.",
                        icon: "warning",
                    });
                    $(this).val(null).trigger('change');
                }
            });

            $("#transfer_from").on("change", function () {
                if (transfer_from) {
                    $('#transfer_to').prop('disabled', false);

                    $.ajax({
                        type: "GET",
                        dataType : 'json',
                        url: '/api/dashboard/transfer/get-products-by-warehouse',
                        data: {
                            id: transfer_from
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

            // $('#transfer_to').on('change', function () {
            //     let transfer_to =  $("#transfer_to option:selected").val();
            //     if (transfer_to === transfer_from) {
            //         Swal.fire({
            //             text:"Transfer From and Transfer To can't be same",
            //             icon: "warning",
            //         });
            //         $(this).val(null).trigger('change');
            //     }
            // });
        });
    </script>

    <script>
        // get stock by product
        // $(".product-select").on("change", function () {
        //     let product_id =  $("#products-1").find(":selected").val();
        //     let warehouse_id =  $("#transfer_from").find(":selected").val();
        //     var products = [];
        //     $.ajax({
        //         type: "GET",
        //         dataType : 'json',
        //         url: '/api/dashboard/transfer/get-stock',
        //         data: {
        //             product_id: product_id,
        //             warehouse_id: warehouse_id
        //         }
        //     })
        //         .done(function(data){
        //             products.push(product_id);
        //             console.log(products);
        //             $("#stock-1").val(data.stock + ' ' + data.shortcut)
        //         })
        //         .fail(function(){
        //             console.log('Ajax Failed')
        //         });
        // });
        // $(document).ready(function(){
        //     $("#qunatities-1").blur(function(){
        //         var quantity = $('#qunatities-1').val();
        //         var stock = $('#stock-1').val();
        //         if( stock < quantity){
        //             alert("Quantity should be less or Equal than Stock.");
        //             $('#qunatities-1').val('');
        //         }
        //
        //     });
        // });
    </script>
@endpush
