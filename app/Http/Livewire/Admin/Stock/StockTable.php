<?php

namespace App\Http\Livewire\Admin\Stock;

use Livewire\Component;

class StockTable extends Component
{
    public $stock_details;

    protected $listeners = ['$refresh'];

    public function render()
    {
        return view('livewire.admin.stock.stock-table');
    }
}
