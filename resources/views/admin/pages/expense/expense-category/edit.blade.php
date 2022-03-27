@extends('layouts.app-admin')
@section('title', 'Edit Unit')

@push('styles')
@endpush

@section('add-new-button')
    <a type="button" href="{{ route('admin.expense.category.index') }}" class="btn btn-info btn-sm float-sm-right">View List</a>
@endsection

@section('content')
    <div class="card">
        <div class="card-header">
            <h3 class="card-title">Edit Unit</h3>
        </div>
        <!-- /.card-header -->
        <div class="card-body">
            <form action="{{ route('admin.expense.category.update', $expense_category->id) }}"
                  method="POST"
                  autocomplete="off"
                  enctype="multipart/form-data"
            >
                @csrf @method('PATCH')

                <div class="row">
                <div class="col-sm-12">
                    <div class="form-group">
                        <label for="name">Name<span class="text-danger"> *</span></label>
                        <input type="text"
                               name="name"
                               value="{{ old('name', $expense_category->name) }}"
                               class="form-control {{ $errors->has('name') ? ' is-invalid' : '' }}"
                               id="name"
                               placeholder="Raw Material"
                        >
                        @if($errors->has('name'))
                            <span class="invalid-feedback">
                                <strong>{{ $errors->first('name') }}</strong>
                            </span>
                        @endif
                    </div>
                </div>
                </div>



                <div class="col-sm-12">
                    <div class="form-group">
                        <label for="desc">Description<span class="text-danger"> *</span></label>
                        <textarea type="text" name="desc" rows="3" class="form-control" id="desc" placeholder="Cost for breakfast, lunch and snacks.">{{ old('desc', $expense_category->desc) }}</textarea>

                        @if($errors->has('desc'))
                            <span class="invalid-feedback">
                                <strong>{{ $errors->first('desc') }}</strong>
                            </span>
                        @endif
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
