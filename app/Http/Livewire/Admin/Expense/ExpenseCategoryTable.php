<?php

namespace App\Http\Livewire\Admin\Expense;

use App\Models\ExpenseCategory;
use Livewire\Component;
use Livewire\WithPagination;

class ExpenseCategoryTable extends Component
{
    use WithPagination;

    protected $paginationTheme = 'adminlte';

    public $recordPerPage = 15;
    public $page = 1;

    // Shows search query in URL
    protected $queryString = [
        'page' => ['except' => 1],
    ];

    public function render()
    {
        $expense_categories = ExpenseCategory::orderByDesc('updated_at')->get();
        return view('livewire.admin.expense.expense-category-table', compact('expense_categories'));
    }
}
