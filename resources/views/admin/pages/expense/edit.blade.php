@extends('layouts.app-admin')
@section('title', 'Edit Expense')

@push('styles')
    <link rel="stylesheet" href="{{ mix('_assets/plugins/flatpickr/flatpickr.css') }}">
    <link rel="stylesheet" href="{{ mix('_assets/plugins/select2/select2.css') }}">
@endpush

@section('add-new-button')
    <a type="button" href="{{ route('admin.expense.self.index') }}" class="btn btn-info btn-sm float-sm-right">View List</a>
@endsection

@section('content')
    <div class="card">
        <div class="card-header">
            <h3 class="card-title">Edit Expense</h3>
        </div>
        <!-- /.card-header -->
        <div class="card-body">
            <form action="{{ route('admin.expense.self.update', $expense->id) }}"
                  method="POST"
                  autocomplete="off"
                  enctype="multipart/form-data"
            >
                @csrf @method('PATCH')

                <div class="row">
                    <div class="col-sm-6">
                        <div class="form-group">
                            <label for="expenses_date">Enpense Date<span class="text-danger"> *</span></label>
                            <input type="text"
                                   value="{{ old('expenses_date',$expense->expenses_date) }}"
                                   id="expenses_date"
                                   name="expenses_date"
                                   class="form-control expenses_date {{ $errors->has('expenses_date') ? ' is-invalid' : '' }}"
                                   aria-describedby="expenses_date"
                                   placeholder="{{ old('expenses_date') ?? "Select a Expenses Date" }}"
                                   required
                            >
                            @if($errors->has('expenses_date'))
                                <span class="invalid-feedback">
                                <strong>{{ $errors->first('expenses_date') }}</strong>
                            </span>
                            @endif
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="form-group">
                            <label for="reason">Reason<span class="text-danger"> *</span></label>
                            <input type="text"
                                   name="reason"
                                   value="{{ old('reason', $expense->reason) }}"
                                   class="form-control {{ $errors->has('reason') ? ' is-invalid' : '' }}"
                                   id="reason"
                                   placeholder="Shoe / Shoelace / Petroleum Rubber"
                                   autofocus
                                   required
                            >
                            @if($errors->has('reason'))
                                <span class="invalid-feedback">
                                <strong>{{ $errors->first('reason') }}</strong>
                            </span>
                            @endif
                        </div>
                    </div>

                </div>

                <div class="row">
                    <div class="col-sm-6">
                        <div class="form-group">
                            <label for="expense_type">Type<span class="text-danger"> *</span></label>
                            <select class="form-control select2bs4 {{ $errors->has('expense_type') ? ' is-invalid' : '' }}"
                                    id="expense_type"
                                    name="expense_type"
                                    style="width: 100%;"
                                    data-placeholder="Choose a Product Type"
                                    required
                            >
                                <option></option>
                                @foreach($expense_types as $expense_type)
                                    <option value="{{ $expense_type->id }}"
                                        {{ $expense_type->id == old('expense_type',$expense->expense_category_id) ? 'selected' : '' }}
                                    >
                                        {{ $expense_type->name }}
                                    </option>
                                @endforeach
                            </select>
                            @if($errors->has('expense_type'))
                                <span class="invalid-feedback">
                                    <strong>{{ $errors->first('expense_type') }}</strong>
                                </span>
                            @endif
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="form-group">
                            <label for="cost">Cost<span class="text-danger"> *</span></label>
                            <input type="text"
                                   name="cost"
                                   value="{{ old('cost', $expense->cost) }}"
                                   class="form-control {{ $errors->has('cost') ? ' is-invalid' : '' }}"
                                   id="cost"
                                   placeholder="30"
                                   autofocus
                                   required
                            >
                            @if($errors->has('cost'))
                                <span class="invalid-feedback">
                                <strong>{{ $errors->first('cost') }}</strong>
                            </span>
                            @endif
                        </div>
                    </div>
                </div>
                @can('expense.update')
                <div class="row">
                    <div class="col-sm-12">
                        <button type="submit" class="btn btn-info btn-sm float-right">Submit</button>
                    </div>
                </div>
                @endcan

            </form>
        </div>
        <!-- /.card-body -->
    </div>
@endsection

@push('scripts')
    <script src="{{ mix('_assets/plugins/flatpickr/flatpickr.js') }}"></script>
    <script src="{{ mix('_assets/plugins/select2/select2.js') }}"></script>
    <script>
        // flatpickr
        const myInput = [
            document.querySelector(".expenses_date"),
        ];
        const fp = flatpickr(myInput, {
            dateFormat: "d-m-Y",
            weekNumbers: true,
            allowInput: true
        });
    </script>
@endpush
