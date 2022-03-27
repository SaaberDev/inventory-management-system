<?php

namespace App\Http\Livewire\Admin\Product;

use Livewire\Component;

class ProductTypeTable extends Component
{
    public $product_types;

    protected $listeners = ['$refresh'];

    public function render()
    {
        return view('livewire.admin.product.product-type-table');
    }
}
