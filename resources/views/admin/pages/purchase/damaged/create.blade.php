@extends('layouts.app-admin')
@section('title', 'Add Damage')

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
    </style>
@endpush

@section('add-new-button')
    <a type="button" href="{{ route('admin.purchase.damaged.index') }}" class="btn btn-info btn-sm float-sm-right">View List</a>
@endsection

@section('content')
    <div class="card">
        <div class="card-header">
            <h3 class="card-title">Add Damage</h3>
        </div>
        <!-- /.card-header -->
        <div class="card-body">
            <form action="{{ route('admin.purchase.damaged.store') }}"
                  method="POST"
                  autocomplete="off"
                  enctype="multipart/form-data"
                  id="form"
            >
                @csrf @method('POST')

                <div class="row">
                    <div class="col-sm-4">
                        <div class="form-group">
                            <label for="reason">Reason<span class="text-danger"> *</span></label>
                            <input type="text"
                                   id="reason"
                                   value="{{ old('reason') }}"
                                   name="reason"
                                   class="form-control {{ $errors->has('reason') ? ' is-invalid' : '' }}"
                                   aria-describedby="reason"
                                   placeholder="Damage Reason"
                                   required
                            >
                            @if($errors->has('reason'))
                                <span class="invalid-feedback">
                                <strong>{{ $errors->first('reason') }}</strong>
                            </span>
                            @endif
                        </div>
                    </div>

                    <div class="col-sm-4">
                        <div class="form-group">
                        <label for="damage_date">Damage Date<span class="text-danger"> *</span></label>
                        <input type="text"
                               id="damage_date"
                               value="{{ old('damage_date') }}"
                               name="damage_date"
                               class="form-control damage_date {{ $errors->has('damage_date') ? ' is-invalid' : '' }}"
                               aria-describedby="damage_date"
                               placeholder="{{ old('damage_date') ?? "Select a Damage Date" }}"
                               required
                        >
                        @if($errors->has('damage_date'))
                            <span class="invalid-feedback">
                                <strong>{{ $errors->first('damage_date') }}</strong>
                            </span>
                        @endif
                        </div>
                    </div>

                    <div class="col-sm-4">
                        <div class="form-group">
                            <label>Purchase<span class="text-danger"> *</span></label>
                            <select class="form-control purchase-select select2bs4 {{ $errors->has('purchase.0') ? ' is-invalid' : '' }}"
                                    id="purchaseProduct"
                                    name="purchase"
                                    style="width: 100%;"
                                    data-placeholder="Choose a Purchase"
                                    required
                            >
                                <option></option>
                                @foreach($purchases as $purchase)
                                    <option value="{{ $purchase->id }}"
                                        {{ $purchase->id == old('purchase') ? 'selected' : '' }}
                                    >
                                        {{ $purchase->code }}
                                    </option>
                                @endforeach
                            </select>
                            @if($errors->has('purchase'))
                                <span class="invalid-feedback">
                                <strong>{{ $errors->first('purchase') }}</strong>
                            </span>
                            @endif
                        </div>
                    </div>
                </div>

                <div id="dynamic-products" class="row mb-3"></div>

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
    <script src="{{ mix('_assets/plugins/dynamic_field/dynamic-field-purchase.js') }}"></script>
    <script>
        // Flatpickr
        const myInput = [
            document.querySelector(".damage_date"),
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
            $(".purchase-select").on("change", function () {
                let purchase =  $("#purchaseProduct option:selected").val();
                $.ajax({
                    type: "POST",
                    dataType : 'json',
                    url: '{{ route('admin.purchase.damaged.getPurchase', $purchase->id) }}',
                    data: {_token: $('meta[name="csrf-token"]').attr('content'), id: purchase}
                })
                    .done(function(data){
                        console.log(data)
                        let inputHtml = '';
                        for(let i  in data)
                        {
                            inputHtml += '<div class="col-md-3"> <label for="productName" class="col-form-label">Product Name</label> <input type="text" class="form-control" id="products-'+i+'" name="products[]" placeholder="Product Name" value="'+data[i].raw_materials.name+'" readonly></div><div class="col-md-2"> <label for="currentQuantites" class="col-form-label">Purchase Qty</label> <input type="text" class="form-control" id="currentQuantites-'+i+'" name="currentQuantites[]" placeholder="Purchase Quantity" value="'+data[i].quantity+ ' ' +data[i].units.shortcut+ '" readonly></div><div class="col-md-2"> <label for="availableQuantities" class="col-form-label">Available Qty</label> <input type="text" class="form-control" value="'+ data[i].available_quantity + ' ' +data[i].units.shortcut+ '" readonly></div><div class="col-md-2"> <label for="unitPrices" class="col-form-label">Unit Price</label> <input type="text" class="form-control" value="'+ data[i].unit_price + ' Tk' + '" readonly></div><div class="col-md-3"> <label for="damageQuantities" class="col-form-label">Damage Qty</label> <input type="number" step="any" min="0" max="'+data[i].available_quantity+'" class="form-control" id="damageQuantities-'+i+'" name="damageQuantities[]" placeholder="Damage Quantity"></div>';
                        }
                        if($( ".existing-products" ).length  > 0)
                        {
                            $( ".existing-products" ).remove();
                        }
                        $('#dynamic-products').html(inputHtml);
                    })
                    .fail(function(){
                        console.log('Ajax Failed')
                    });
            });
        });
    </script>
@endpush
