@extends('layouts.app-admin')
@section('title', '')

@push('styles')
    <link rel="stylesheet" href="{{ mix('_assets/plugins/select2/select2.css') }}">
    <link rel="stylesheet" href="{{ mix('_assets/plugins/flatpickr/flatpickr.css') }}">

{{--    <style>--}}
{{--        .dynamic-btn {--}}
{{--            display: flex;--}}
{{--            justify-content: center;--}}
{{--            align-items: center;--}}
{{--            margin-top: 50px !important;--}}
{{--            position: relative;--}}
{{--            top: -15px;--}}
{{--        }--}}
{{--    </style>--}}
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
            <form action="{{ route('admin.transfer.update', $transfer->id) }}"
                  method="POST"
                  autocomplete="off"
                  enctype="multipart/form-data"
                  id="form"
            >
                @csrf @method('PATCH')

                <div class="row">
                    <div class="col-sm-4">
                        <div class="form-group">
                            <label for="transfer_date">Transfer Date<span class="text-danger"> *</span></label>
                            <input type="text"
                                   value="{{ old('transfer_date', $transfer->transfer_date) }}"
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
                            <label for="transfer_from">From</label>
                            <select class="form-control transfer-from select2bs4 {{ $errors->has('transfer_from') ? ' is-invalid' : '' }}"
                                    id="transfer_from"
                                    name="transfer_from"
                                    style="width: 100%;"
                                    data-placeholder="Choose a Warehouse"
                                    required
                            >
                                <option value="{{ $transfer->from_warehouse_id }}">
                                    {{ $transfer->from_warehouses->name }}
                                </option>
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
                            <label for="transfer_to">To</label>
                            <select class="form-control select2bs4 {{ $errors->has('transfer_to') ? ' is-invalid' : '' }}"
                                    id="transfer_to"
                                    name="transfer_to"
                                    style="width: 100%;"
                                    data-placeholder="Choose a Warehouse"
                                    required
                            >
                                <option></option>
                                @forelse($to_warehouses as $id => $to_warehouse)
                                    <option value="{{ $id }}"
                                        {{ $id == old('transfer_to', $transfer->to_warehouse_id) ? 'selected' : '' }}
                                    >
                                        {{ $to_warehouse }}
                                    </option>
                                @empty
                                    <option>No Warehouse Found</option>
                                @endforelse
                            </select>
                            @if($errors->has('transfer_to'))
                                <span class="invalid-feedback">
                                    <strong>{{ $errors->first('transfer_to') }}</strong>
                                </span>
                            @endif
                        </div>
                    </div>
                </div>
                @foreach($transfer_details as $transfer_detail)
                    <div class="row">
                        <div class="col-sm-5 form-group">
                            <label for="products-{{ $loop->iteration }}" class="col-form-label">Product Name</label>
                            <select class="form-control product-select select2bs4"
                                    id="products-{{ $loop->iteration }}"
                                    name="products[]"
                                    style="width: 100%;"
                                    data-placeholder="Choose a Product"
                                    required
                                    disabled
                            >
                                <option value="{{ $transfer_detail->product_id }}"
                                        {{ $transfer_detail->product_id }}
                                        selected
                                >
                                    {{ '>' . ' ' . $transfer_detail->code . ' - ' . $transfer_detail->name }}
                                </option>
                            </select>
                        </div>

                        <div class="col-sm-3 form-group">
                            <label for="stock-1" class="col-form-label">Stock</label>
                            <input type="text" class="form-control" id="stock-1" name="stock" value="{{ $transfer_detail->stock . ' ' . $transfer_detail->unit_shortcut }}" disabled>
                        </div>

                        <div class="col-sm-3 form-group">
                            <label for="qunatities" class="col-form-label">Quantity<span class="text-danger"> *</span></label>
                            <input type="number"
                                   step="any"
                                   min="0"
                                   id="qunatities-1"
                                   data-number="1"
                                   name="quantities[]"
                                   value="{{ old('quantities', $transfer_detail->qty) }}"
                                   placeholder="Quantity"
                                   class="form-control"
                                   required
                            >
                        </div>
                    </div>
                @endforeach

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
                            >{{ old('note', $transfer->note) }}</textarea>
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
    {{--    <script src="{{ mix('_assets/plugins/dynamic_field/dynamic-field-transfer.js') }}"></script>--}}

    <script>
        $(document).ready(function () {
            $('#transfer_from').prop('disabled', true);
            // $('#transfer_to').prop('disabled', true);
            // $('.product-select').prop('disabled', true);
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

    {{--    <script>--}}
    {{--        // get products for selected purchase--}}
    {{--        $(document).ready(function(){--}}
    {{--            $(".transfer-from").on("change", function () {--}}
    {{--                let transfer_from =  $("#transfer_from option:selected").val();--}}
    {{--                if (transfer_from) {--}}
    {{--                    $.ajax({--}}
    {{--                        type: "GET",--}}
    {{--                        dataType : 'json',--}}
    {{--                        url: '/api/dashboard/transfer/get-products-by-warehouse',--}}
    {{--                        data: {--}}
    {{--                            id: transfer_from--}}
    {{--                        }--}}
    {{--                    })--}}
    {{--                        .done(function(data){--}}
    {{--                            if (data) {--}}
    {{--                                $("#products-1").empty();--}}
    {{--                                $.each(data, function(key,value){--}}
    {{--                                    $("#products-1").append('<option></option><option value="'+value.id+'">'+ '>' + ' ' +value.code+ ' ' + '-' + ' ' +value.name+'</option>');--}}
    {{--                                });--}}
    {{--                            } else {--}}
    {{--                                $("#products-1").empty();--}}
    {{--                            }--}}
    {{--                        })--}}
    {{--                        .fail(function(){--}}
    {{--                            console.log('Ajax Failed')--}}
    {{--                        });--}}
    {{--                } else {--}}
    {{--                    $("#products-1").empty();--}}
    {{--                }--}}
    {{--            });--}}
    {{--        });--}}
    {{--    </script>--}}

    {{--    <script>--}}
    {{--        // get stock by product--}}
    {{--        $(".product-select").on("change", function () {--}}
    {{--            let product_id =  $("#products-1").find(":selected").val();--}}

    {{--            $.ajax({--}}
    {{--                type: "GET",--}}
    {{--                dataType : 'json',--}}
    {{--                url: '/api/dashboard/transfer/get-stock',--}}
    {{--                data: {--}}
    {{--                    id: product_id--}}
    {{--                }--}}
    {{--            })--}}
    {{--                .done(function(data){--}}
    {{--                    $("#stock-1").val(data.stock + ' ' + data.shortcut)--}}
    {{--                })--}}
    {{--                .fail(function(){--}}
    {{--                    console.log('Ajax Failed')--}}
    {{--                });--}}
    {{--        });--}}
    {{--    </script>--}}
@endpush
