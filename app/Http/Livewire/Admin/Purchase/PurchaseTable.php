<?php

namespace App\Http\Livewire\Admin\Purchase;

use Livewire\Component;

class PurchaseTable extends Component
{
    public $purchases;

    protected $listeners = ['$refresh'];

    public function render()
    {
        return view('livewire.admin.purchase.purchase-table');
    }
}
