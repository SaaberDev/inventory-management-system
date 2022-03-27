<?php

namespace App\Http\Livewire\Admin\Purchase;

use Livewire\Component;

class DamageTable extends Component
{
    public $damaged_purchases;

    protected $listeners = ['$refresh'];

    public function render()
    {
        return view('livewire.admin.purchase.damage-table');
    }
}
