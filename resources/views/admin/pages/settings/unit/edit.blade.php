@extends('layouts.app-admin')
@section('title', 'Edit Unit')

@push('styles')
@endpush

@section('add-new-button')
    <a type="button" href="{{ route('admin.settings.unit.index') }}" class="btn btn-info btn-sm float-sm-right">View List</a>
@endsection

@section('content')
    <div class="card">
        <div class="card-header">
            <h3 class="card-title">Edit Unit</h3>
        </div>
        <!-- /.card-header -->
        <div class="card-body">
            <form class="row"
                  action="{{ route('admin.settings.unit.update', $unit->id) }}"
                  method="POST"
                  autocomplete="off"
                  enctype="multipart/form-data"
            >
                @csrf @method('PATCH')

                <div class="col-sm-6">
                    <div class="form-group">
                        <label for="name">Name<span class="text-danger"> *</span></label>
                        <input type="text"
                               name="name"
                               value="{{ old('name', $unit->name) }}"
                               class="form-control {{ $errors->has('name') ? ' is-invalid' : '' }}"
                               id="name"
                               placeholder="Kilogram"
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
                        <label for="shortcut">Shortcut<span class="text-danger"> *</span></label>
                        <input type="text"
                               name="shortcut"
                               value="{{ old('shortcut', $unit->shortcut) }}"
                               class="form-control {{ $errors->has('shortcut') ? ' is-invalid' : '' }}"
                               id="shortcut"
                               placeholder="KG"
                               autofocus
                        >
                        @if($errors->has('shortcut'))
                            <span class="invalid-feedback">
                                <strong>{{ $errors->first('shortcut') }}</strong>
                            </span>
                        @endif
                    </div>

                    <button type="submit" class="btn btn-info btn-sm float-right">Submit</button>
                </div>

            </form>
        </div>
        <!-- /.card-body -->
    </div>
@endsection

@push('scripts')
@endpush
