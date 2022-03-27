<?php

namespace App\Http\Livewire\Admin\Includes;

use App\Models\Warehouse;
use Livewire\Component;

class Sidebar extends Component
{
    protected $listeners = [
        'refreshList' => '$refresh',
        'refreshTable' => '$refresh'
    ];

    public function render()
    {
        return view('livewire.admin.includes.sidebar', [
            'warehouses' => Warehouse::orderBy('position')->take(6)->get()
                ->sortByDesc(function ($item) {
                    return $item['id'] == 1;
                })
                ->sortBy(function ($item) {
                    return $item['id'] == 2;
                })
        ]);
    }
}
