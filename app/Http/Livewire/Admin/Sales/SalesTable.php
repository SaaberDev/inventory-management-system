<?php

namespace App\Http\Livewire\Admin\Sales;

use Livewire\Component;

class SalesTable extends Component
{
    public $sales;

    protected $listeners = ['$refresh'];

    public function render()
    {
        return view('livewire.admin.sales.sales-table');
    }
}
