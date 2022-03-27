<?php

namespace App\Http\Livewire\Admin\ReleaseProduct;

use Livewire\Component;

class ReleaseProductList extends Component
{
    public $released_product_infos;

    protected $listeners = ['$refresh'];

    public function render()
    {
        return view('livewire.admin.release-product.release-product-list');
    }
}
