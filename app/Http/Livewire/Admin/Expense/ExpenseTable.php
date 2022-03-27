<?php

namespace App\Http\Livewire\Admin\Expense;

use App\Models\Expense;
use Livewire\Component;
use Livewire\WithPagination;

class ExpenseTable extends Component
{
    use WithPagination;

    protected $paginationTheme = 'adminlte';

    public $recordPerPage = 15;
    public $page = 1;

    // Shows search query in URL
    protected $queryString = [
        'page' => ['except' => 1],
    ];

    protected $listeners = ['refreshTable' => '$refresh'];
    public function render()
    {
        $expense = Expense::with('ExpenseCategory')
            ->orderByDesc('updated_at')
            ->paginate($this->recordPerPage);
        return view('livewire.admin.expense.expense-table', compact('expense'));
    }
}
