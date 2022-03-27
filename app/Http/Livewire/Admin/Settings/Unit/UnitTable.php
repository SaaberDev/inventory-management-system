<?php

namespace App\Http\Livewire\Admin\Settings\Unit;

use Livewire\Component;

class UnitTable extends Component
{
    public $units;

    protected $listeners = ['$refresh'];

    public function render()
    {
        return view('livewire.admin.settings.unit.unit-table');
    }
}
