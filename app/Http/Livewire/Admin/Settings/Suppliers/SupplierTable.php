<?php

namespace App\Http\Livewire\Admin\Settings\Suppliers;

use Livewire\Component;

class SupplierTable extends Component
{
    public $suppliers;

    protected $listeners = ['$refresh'];

    public function render()
    {
        return view('livewire.admin.settings.suppliers.supplier-table');
    }
}
