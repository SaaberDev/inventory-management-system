@extends('layouts.app-admin')
@section('title', 'Add Expense Category')

@push('styles')
@endpush

@section('add-new-button')
    <a type="button" href="{{ route('admin.expense.category.index') }}" class="btn btn-info btn-sm float-sm-right">View List</a>
@endsection

@section('content')
    <div class="card">
        <div class="card-header">
            <h3 class="card-title">Add Expense Category</h3>
        </div>
        <!-- /.card-header -->
        <div class="card-body">
            <form action="{{ route('admin.expense.category.store') }}"
                  method="POST"
                  autocomplete="off"
                  enctype="multipart/form-data"
            >
                @csrf @method('POST')

                <div class="row">
                    <div class="col-sm-12">
                        <div class="form-group">
                            <label for="name">Name<span class="text-danger"> *</span></label>
                            <input type="text"
                                   name="name"
                                   value="{{ old('name') }}"
                                   class="form-control {{ $errors->has('name') ? ' is-invalid' : '' }}"
                                   id="name"
                                   placeholder="Food Cost / Stationary Cost"
                                   autofocus
                            >
                            @if($errors->has('name'))
                                <span class="invalid-feedback">
                                <strong>{{ $errors->first('name') }}</strong>
                            </span>
                            @endif
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-sm-12">
                        <div class="form-group">
                            <label for="desc">Description</label>
                            <textarea type="text" name="desc" rows="3" class="form-control" id="desc" placeholder="Cost for breakfast, lunch and snacks."></textarea>
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
