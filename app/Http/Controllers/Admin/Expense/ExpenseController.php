<?php

namespace App\Http\Controllers\Admin\Expense;

use App\Http\Controllers\Controller;
use App\Models\Expense;
use App\Models\ExpenseCategory;
use Illuminate\Contracts\Foundation\Application;
use Illuminate\Contracts\View\Factory;
use Illuminate\Contracts\View\View;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use DB;

class ExpenseController extends Controller
{
    private $_className;

    public function __construct()
    {
        $this->_className = getClassName($this);
    }

    /**
     * Display a listing of the resource.
     *
     * @return Application|Factory|View
     */
    public function index()
    {

        return view('admin.pages.expense.index');
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return Application|Factory|View
     */
    public function create()
    {
        $expense_types = ExpenseCategory::orderByDesc('id')->get();
        return view('admin.pages.expense.create',compact('expense_types'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param \Illuminate\Http\Request $request
     * @return \Illuminate\Http\RedirectResponse
     * @throws \Throwable
     */
    public function store(Request $request)
    {
        DB::beginTransaction();
        try {
            Expense::create([
                'reason' => $request->input('reason'),
                'expenses_date' => $request->input('expenses_date'),
                'expense_category_id' => $request->input('expense_type'),
                'cost' => $request->input('cost')
            ]);
            DB::commit();
            return redirect()->route('admin.expense.self.index')->with([
                'alert-type' => 'success_toast',
                'message' => $this->_className . ' Created Successfully!',
            ]);
        } catch (\Exception $exception) {
            \DB::rollBack();
            report($exception);
            return back()->with([
                'alert-type' => 'warning_toast',
                'message' => 'Oops, Something went wrong!',
            ]);
        }
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return Application|Factory|View
     */
    public function edit($id)
    {
        $expense = Expense::findOrFail($id);
        $expense_types = ExpenseCategory::orderByDesc('id')->get();
        return view('admin.pages.expense.edit',compact('expense_types','expense'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\RedirectResponse
     */
    public function update(Request $request, $id)
    {
        DB::beginTransaction();
        try {
            $expense = Expense::findOrFail($id);
            $expense->update([
                'reason' => $request->input('reason'),
                'expenses_date' => $request->input('expenses_date'),
                'expense_category_id' => $request->input('expense_type'),
                'cost' => $request->input('cost')
            ]);
            DB::commit();
            return redirect()->route('admin.expense.self.index')->with([
                'alert-type' => 'success_toast',
                'message' => $this->_className . ' Updated Successfully!',
            ]);
        } catch (\Exception $exception) {
            \DB::rollBack();
            report($exception);
            return back()->with([
                'alert-type' => 'warning_toast',
                'message' => 'Oops, Something went wrong!',
            ]);
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param int $id
     * @return \Illuminate\Http\JsonResponse
     * @throws \Throwable
     */
    public function destroy($id)
    {
        DB::beginTransaction();
        try {
            $expense = Expense::findOrFail($id);
            $expense->delete();
            DB::commit();

            return response()->json([
                'alert_type' => 'success',
                'message' => 'ExpenseController Deleted Successfully!',
            ]);
        } catch (\Exception $exception) {
            \DB::rollBack();
            report($exception);
            return response()->json([
                'alert_type' => 'warning',
                'message' => 'Oops, Something went wrong!',
            ]);
        }
    }
    public function report()
    {
    return view('admin.pages.expense.expense-report');
    }

    public function reportData(Request $request)
    {
        $start_date = $request->get('startDate');
        $end_date = $request->get('endDate');
        $expense = Expense::leftJoin('expense_categories','expense_categories.id','=','expenses.expense_category_id')
            ->whereBetween('expenses_date', [$start_date, $end_date])
            ->get([
                'expenses.expenses_date',
                'expenses.reason',
                'expenses.cost',
                'expense_categories.name as ex_name',
            ]);

        $data = ['responseCode' => 1, 'data' => $expense];
        return response()->json($data);
    }
}
