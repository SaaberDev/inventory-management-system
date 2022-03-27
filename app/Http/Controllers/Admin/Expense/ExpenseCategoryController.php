<?php

namespace App\Http\Controllers\Admin\Expense;

use App\Http\Controllers\Controller;
use App\Models\ExpenseCategory;
use Illuminate\Contracts\Foundation\Application;
use Illuminate\Contracts\View\Factory;
use Illuminate\Contracts\View\View;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Throwable;
use DB;

class ExpenseCategoryController extends Controller
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
        $expense_category = ExpenseCategory::orderByDesc('updated_at')->get();
        return view('admin.pages.expense.expense-category.index',compact('expense_category'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return Application|Factory|View
     */
    public function create()
    {
        return view('admin.pages.expense.expense-category.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param Request $request
     * @return RedirectResponse
     * @throws Throwable
     */
    public function store(Request $request)
    {
        DB::beginTransaction();
        try {
            ExpenseCategory::create([
                'name' => $request->input('name'),
                'desc' => $request->input('desc')
            ]);
            DB::commit();
            return back()->with([
                'alert-type' => 'success_toast',
                'message' => $this->_className . ' Created Successfully!',
            ]);
        } catch (\Exception $exception) {
            DB::rollBack();
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
        $expense_category = ExpenseCategory::findOrFail($id);
        return view('admin.pages.expense.expense-category.edit', compact('expense_category'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param Request $request
     * @param int $id
     * @return RedirectResponse
     * @throws Throwable
     */
    public function update(Request $request, $id)
    {
        DB::beginTransaction();
        try {
            $expense_category = ExpenseCategory::findOrFail($id);
            $expense_category->update([
                'name' => $request->input('name'),
                'desc' => $request->input('desc')
            ]);
            DB::commit();
            return redirect()
                ->route('admin.pages.expense.expense-category.index')
                ->with([
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
     * @return JsonResponse
     * @throws Throwable
     */
    public function destroy($id)
    {
        DB::beginTransaction();
        try {
            $expense_category = ExpenseCategory::findOrFail($id);
            $expense_category->delete();
            DB::commit();
            return response()->json([
                'alert_type' => 'success',
                'message' => $this->_className . ' Deleted Successfully!',
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
}
