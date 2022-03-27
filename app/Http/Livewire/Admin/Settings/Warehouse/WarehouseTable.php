<?php

namespace App\Http\Livewire\Admin\Settings\Warehouse;

use App\Models\Warehouse;
use Livewire\Component;

class WarehouseTable extends Component
{
    protected $listeners = ['refreshTable' => '$refresh'];

    public function render()
    {
        return view('livewire.admin.settings.warehouse.warehouse-table', [
            'warehouses' => Warehouse::orderBy('position')->take(6)->get()
                ->sortByDesc(function ($item) {
                    return $item['id'] == 1;
                })
                ->sortBy(function ($item) {
                    return $item['id'] == 2;
                })
        ]);
    }

    public function updateOrder($list)
    {
        foreach($list as $item) {
            Warehouse::find($item['value'])->update(['position' => $item['order']]);
        }
        $this->emit('refreshList');
    }
}
