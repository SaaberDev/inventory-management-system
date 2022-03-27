@extends('layouts.app-admin')
@section('title', 'Add Product')

@push('styles')
    <link rel="stylesheet" href="{{ mix('_assets/plugins/select2/select2.css') }}">
@endpush

@section('add-new-button')
    <a type="button" href="{{ route('admin.product.self.index') }}" class="btn btn-info btn-sm float-sm-right">View List</a>
@endsection

@section('content')
    <div class="card">
        <div class="card-header">
            <h3 class="card-title">Add Product</h3>
        </div>
        <!-- /.card-header -->
        <div class="card-body">
            <form action="{{ route('admin.product.self.store') }}"
                  method="POST"
                  autocomplete="off"
                  enctype="multipart/form-data"
            >
                @csrf @method('POST')

                <div class="row">
                    <div class="col-sm-6">
                        <div class="form-group">
                            <label for="name">Name<span class="text-danger"> *</span></label>
                            <input type="text"
                                   name="name"
                                   value="{{ old('name') }}"
                                   class="form-control {{ $errors->has('name') ? ' is-invalid' : '' }}"
                                   id="name"
                                   placeholder="Shoe / Shoelace / Petroleum Rubber"
                                   autofocus
                                   required
                            >
                            @if($errors->has('name'))
                                <span class="invalid-feedback">
                                <strong>{{ $errors->first('name') }}</strong>
                            </span>
                            @endif
                        </div>
                    </div>

                    <div class="col-sm-3">
                        <div class="form-group">
                            <label for="product_type">Type<span class="text-danger"> *</span></label>
                            <select class="form-control select2bs4 {{ $errors->has('product_type') ? ' is-invalid' : '' }}"
                                    id="product_type"
                                    name="product_type"
                                    style="width: 100%;"
                                    data-placeholder="Choose a Product Type"
                                    required
                            >
                                <option></option>
                                @foreach($product_types as $product_type)
                                    <option value="{{ $product_type->id }}"
                                        {{ $product_type->id == old('product_type') ? 'selected' : '' }}
                                    >
                                        {{ $product_type->name }}
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

                    <div class="col-sm-3">
                        <div class="form-group">
                            <label for="unit">Unit<span class="text-danger"> *</span></label>
                            <select class="form-control select2bs4 {{ $errors->has('unit') ? ' is-invalid' : '' }}"
                                    id="unit"
                                    name="unit"
                                    style="width: 100%;"
                                    data-placeholder="Choose a Unit"
                                    required
                            >
                                <option></option>
                                @foreach($units as $unit)
                                    <option value="{{ $unit->id }}"
                                        {{ $unit->id == old('unit') ? 'selected' : '' }}
                                    >
                                        {{ $unit->name }}
                                    </option>
                                @endforeach
                            </select>
                            @if($errors->has('unit'))
                                <span class="invalid-feedback">
                                    <strong>{{ $errors->first('unit') }}</strong>
                                </span>
                            @endif
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-sm-6">
                        <div class="form-group">
                            <label for="stock_alert_limit">Stock Alert Limit<span class="text-danger"> *</span></label>
                            <input type="text"
                                   name="stock_alert_limit"
                                   value="{{ old('stock_alert_limit') }}"
                                   class="form-control {{ $errors->has('stock_alert_limit') ? ' is-invalid' : '' }}"
                                   id="stock_alert_limit"
                                   placeholder="30"
                                   autofocus
                                   required
                            >
                            @if($errors->has('stock_alert_limit'))
                                <span class="invalid-feedback">
                                <strong>{{ $errors->first('stock_alert_limit') }}</strong>
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
@endpush
