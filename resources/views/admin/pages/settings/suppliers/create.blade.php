@extends('layouts.app-admin')
@section('title', 'Add Supplier')

@push('styles')
@endpush

@section('add-new-button')
    <a type="button" href="{{ route('admin.settings.suppliers.index') }}" class="btn btn-info btn-sm float-sm-right">View List</a>
@endsection

@section('content')
    <div class="card">
        <div class="card-header">
            <h3 class="card-title">Add Supplier</h3>
        </div>
        <!-- /.card-header -->
        <div class="card-body">
            <form action="{{ route('admin.settings.suppliers.store') }}"
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
                                   placeholder="Apex"
                                   autofocus
                            >
                            @if($errors->has('name'))
                                <span class="invalid-feedback">
                                <strong>{{ $errors->first('name') }}</strong>
                            </span>
                            @endif
                        </div>
                    </div>

                    <div class="col-sm-6">
                        <div class="form-group">
                            <label for="phone">Phone<span class="text-danger"> *</span></label>
                            <input type="text"
                                   name="phone"
                                   value="{{ old('phone') }}"
                                   class="form-control {{ $errors->has('phone') ? ' is-invalid' : '' }}"
                                   id="phone"
                                   placeholder="+880188XXXXXXX"
                            >
                            @if($errors->has('phone'))
                                <span class="invalid-feedback">
                                <strong>{{ $errors->first('phone') }}</strong>
                            </span>
                            @endif
                        </div>
                    </div>

                    <div class="col-sm-6">
                        <div class="form-group">
                            <label for="email">Email<span class="text-danger"> *</span></label>
                            <input type="text"
                                   name="email"
                                   value="{{ old('email') }}"
                                   class="form-control {{ $errors->has('email') ? ' is-invalid' : '' }}"
                                   id="email"
                                   placeholder="apex@example.com"
                            >
                            @if($errors->has('email'))
                                <span class="invalid-feedback">
                                <strong>{{ $errors->first('email') }}</strong>
                            </span>
                            @endif
                        </div>
                    </div>

                    <div class="col-sm-6">
                        <div class="form-group">
                            <label for="country">Country<span class="text-danger"> *</span></label>
                            <input type="text"
                                   name="country"
                                   value="{{ old('country') }}"
                                   class="form-control {{ $errors->has('country') ? ' is-invalid' : '' }}"
                                   id="country"
                                   placeholder="Bangladesh"
                            >
                            @if($errors->has('country'))
                                <span class="invalid-feedback">
                                <strong>{{ $errors->first('country') }}</strong>
                            </span>
                            @endif
                        </div>
                    </div>

                    <div class="col-sm-6">
                        <div class="form-group">
                            <label for="city">City<span class="text-danger"> *</span></label>
                            <input type="text"
                                   name="city"
                                   value="{{ old('city') }}"
                                   class="form-control {{ $errors->has('city') ? ' is-invalid' : '' }}"
                                   id="city"
                                   placeholder="Dhaka"
                            >
                            @if($errors->has('city'))
                                <span class="invalid-feedback">
                                <strong>{{ $errors->first('city') }}</strong>
                            </span>
                            @endif
                        </div>
                    </div>

                    <div class="col-sm-6">
                        <div class="form-group">
                            <label for="address">Address</label>
                            <textarea type="text"
                                      name="address"
                                      rows="3"
                                      class="form-control {{ $errors->has('address') ? ' is-invalid' : '' }}"
                                      id="address"
                                      placeholder=""
                            >{{ old('address') }}</textarea>
                            @if($errors->has('address'))
                                <span class="invalid-feedback">
                                    <strong>{{ $errors->first('address') }}</strong>
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
@endpush
