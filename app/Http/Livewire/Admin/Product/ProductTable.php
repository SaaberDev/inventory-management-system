<?php

namespace App\Http\Livewire\Admin\Product;

use App\Models\Product;
use Livewire\Component;
use Livewire\WithPagination;

class ProductTable extends Component
{
    use WithPagination;

    protected $paginationTheme = 'adminlte';

    public $recordPerPage = 15;
    public $page = 1;

    // Shows search query in URL
    protected $queryString = [
        'page' => ['except' => 1],
    ];

    protected $listeners = ['refreshTable' => '$refresh'];

    public function render()
    {
        $products = Product::with('productTypes', 'units')
            ->orderByDesc('updated_at')
            ->paginate($this->recordPerPage);
        return view('livewire.admin.product.product-table', compact('products'));
    }
}
