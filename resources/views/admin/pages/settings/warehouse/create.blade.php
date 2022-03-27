@extends('layouts.app-admin')
@section('title', 'Add Warehouse')

@push('styles')
    <link rel="stylesheet" href="{{ mix('_assets/plugins/icon_picker/css/bootstrap-iconpicker.css') }}">
    <style>
        .btn-primary:not(:disabled):not(.disabled):active, .btn-primary:not(:disabled):not(.disabled).active, .show > .btn-primary.dropdown-toggle {
            color: #fff;
            background-color: #17a2b8;
            border-color: #17a2b8;
        }
        .btn-primary:focus, .btn-primary.focus {
            color: #fff;
            background-color: #17a2b8;
            border-color: #17a2b8;
            box-shadow: 0 0 0 0 rgb(38 143 255 / 50%);
        }
    </style>
@endpush

@section('add-new-button')
    <a type="button" href="{{ route('admin.settings.warehouse.index') }}" class="btn btn-info btn-sm float-sm-right">View List</a>
@endsection

@section('content')
    <div class="card">
        <div class="card-header">
            <h3 class="card-title">Add Warehouse</h3>
        </div>
        <!-- /.card-header -->
        <div class="card-body">
            <form class="row"
                  action="{{ route('admin.settings.warehouse.store') }}"
                  method="POST"
                  autocomplete="off"
                  enctype="multipart/form-data"
            >
                @csrf @method('POST')

                <div class="col-sm-4" style="padding: 0 40px;">
                    <label for="">Icon<span class="text-danger"> *</span></label>
                    @if($errors->has('icon'))
                        <div>
                            <label for="" class="text-danger" style="font-size: 80%">*{{ $errors->first('icon') }}</label>
                        </div>
                    @endif
                    <div id="icon_picker" data-icon="{{ old('icon') }}"></div>
                    <input type="hidden" name="icon" value="{{ old('icon') }}">
                </div>

                <div class="col-sm-8">
                    <div class="form-group">
                        <label for="name">Name<span class="text-danger"> *</span></label>
                        <input type="text"
                               name="name"
                               value="{{ old('name') }}"
                               class="form-control {{ $errors->has('name') ? ' is-invalid' : '' }}"
                               id="name"
                               placeholder="Purchase"
                               autofocus
                        >
                        @if($errors->has('name'))
                            <span class="invalid-feedback">
                            <strong>{{ $errors->first('name') }}</strong>
                        </span>
                        @endif
                    </div>

                    <div class="form-group">
                        <label for="shortcut">Shortcut<span class="text-danger"> *</span></label>
                        <input type="text"
                               name="shortcut"
                               value="{{ old('shortcut') }}"
                               class="form-control {{ $errors->has('shortcut') ? ' is-invalid' : '' }}"
                               id="shortcut"
                               placeholder="PUR"
                               autofocus
                        >
                        @if($errors->has('shortcut'))
                            <span class="invalid-feedback">
                            <strong>{{ $errors->first('shortcut') }}</strong>
                        </span>
                        @endif
                    </div>
                </div>

                <div class="col-sm-12">
                    <button type="submit" class="btn btn-info btn-sm float-right">Submit</button>
                </div>
            </form>
        </div>
        <!-- /.card-body -->
    </div>
@endsection

@push('scripts')
    <script src="{{ mix('_assets/plugins/icon_picker/js/bootstrap-iconpicker.bundle.min.js') }}"></script>
    <script>
        $('#icon_picker').iconpicker({
            footer: false,
            header: true,
            cols: 6,
            rows: 3,
            search: true,
            searchText: 'Search',
            selectedClass: 'btn-primary',
            unselectedClass: '',
            placement: 'bottom',
        });

        $("#icon_picker").on('change', function(e) {
            $("input[name='icon']").val(e.icon).val();
        });
    </script>
@endpush
