@extends('layouts.app-admin')
@section('title', 'Expense')
@push('styles')
    <link rel="stylesheet" href="{{ mix('_assets/plugins/flatpickr/flatpickr.css') }}">
    <style>
        .report {
            margin-top: 30px;
        }
    </style>
@endpush

@section('content')
    <div>
        <div class="card">
            <div class="card-header">
                <h3 class="card-title">Expense Report</h3>
            </div>
            <!-- /.card-header -->
            <div class="card-body">
                <form action="#"
                      method="POST"
                      autocomplete="off"
                      enctype="multipart/form-data"
                      id="form"
                >
                    @csrf @method('POST')

                    <div class="row">
                        <div class="col-sm-5">
                            <div class="form-group">
                                <label for="start_expense_date">Start Expense Date<span class="text-danger"> *</span></label>
                                <input type="text"
                                       value="{{ old('start_expense_date') }}"
                                       id="start_expense_date"
                                       name="start_expense_date"
                                       class="form-control start_expense_date {{ $errors->has('start_expense_date') ? ' is-invalid' : '' }}"
                                       aria-describedby="start_expense_date"
                                       placeholder="{{ old('start_expense_date') ?? "Select a Start Expense Date" }}"
                                       required
                                >
                                @if($errors->has('start_expense_date'))
                                    <span class="invalid-feedback">
                                <strong>{{ $errors->first('start_expense_date') }}</strong>
                            </span>
                                @endif
                            </div>
                        </div>
                        <div class="col-sm-5">
                            <div class="form-group">
                                <label for="end_expense_date">End Expense Date <span
                                        class="text-danger"> *</span></label>
                                <input type="text"
                                       value="{{ old('end_expense_date') }}"
                                       id="end_expense_date"
                                       name="end_expense_date"
                                       class="form-control end_expense_date {{ $errors->has('end_expense_date') ? ' is-invalid' : '' }}"
                                       aria-describedby="end_expense_date"
                                       placeholder="{{ old('sales_date') ?? "Select a End expense Date" }}"
                                       required
                                >
                                @if($errors->has('sales_date'))
                                    <span class="invalid-feedback">
                                <strong>{{ $errors->first('end_expense_date') }}</strong>
                            </span>
                                @endif
                            </div>
                        </div>
                        <div class="col-sm-2">
                            <button type="button" class="btn btn-info btn-sm report float-right" id="getdata">Report Genarate
                            </button>
                        </div>

                    </div>

                </form>
            </div>
            <div class="card-body">
                <div class="row">
                    <div class="col-12">
                        <div class="table-responsive">
                            <table id="table_desk" class="table display nowrap"
                                   cellspacing="0"
                                   width="100%">
                                <thead>
                                <tr>
                                    <th>Date</th>
                                    <th>Reason</th>
                                    <th>Type</th>
                                    <th>Cost</th>
                                </tr>
                                </thead>
                                <tbody id="tabledata">

                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>

            </div>


            <!-- /.card-body -->
        </div>
    </div>
@endsection
@push('scripts')
    <script src="{{ mix('_assets/plugins/flatpickr/flatpickr.js') }}"></script>
    <script>
        const URL = '/dashboard/expense';
        $('#getdata').click(function (e){
            var startDate = $('#start_expense_date').val();
            var endDate = $('#end_expense_date').val();
            if((startDate !='') || (endDate != '')){
                $.ajax({
                    type: "GET",
                    url: "{{route("admin.expense.self.reportData")}}",
                    data: {
                        startDate: startDate,
                        endDate: endDate
                    },
                    success: function (response) {
                        if (response.responseCode == 1) {
                            var tr='';
                            response.data.map(function(data) {
                                 tr += '<tr><td>'+data.expenses_date+'</td><td>'+data.reason+'</td><td>'+data.ex_name+'</td><td>'+data.cost+'</td></tr>'

                            })
                        }
                        $("#tabledata").html(tr);
                    }
                });

            }else{
                alert('please select both date.');
            }


        })

        // flatpickr
        const myInput = [
            document.querySelector(".start_expense_date"),

        ];

        const fp = flatpickr(myInput, {
            dateFormat: "d-m-Y",
            weekNumbers: true,
            allowInput: true
        });
        const myInputEnd = [
            document.querySelector(".end_expense_date"),

        ];

        const fpEnd = flatpickr(myInputEnd, {
            dateFormat: "d-m-Y",
            weekNumbers: true,
            allowInput: true
        });


    </script>
@endpush
