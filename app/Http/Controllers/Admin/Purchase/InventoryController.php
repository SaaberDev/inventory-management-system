<?php

    namespace App\Http\Controllers\Admin\Purchase;

    use App\Http\Controllers\Controller;
    use App\Models\PurchaseDetail;
    use Illuminate\Contracts\Foundation\Application;
    use Illuminate\Contracts\View\Factory;
    use Illuminate\Contracts\View\View;
    use Illuminate\Database\Eloquent\Builder;
    use Illuminate\Http\Request;
    use Illuminate\Http\Response;

    class InventoryController extends Controller
    {
        /**
         * Handle the incoming request.
         *
         * @return Application|Factory|View|Response
         */
        public function index()
        {
            // TODO -- Conditionally show each inventory details
            session()->forget('url.intended');
            $inventories =
                PurchaseDetail::with('purchases:code,id', 'units:id,shortcut', 'rawMaterials:id,code,name')
                    ->get()
                    ->sortByDesc(function ($query){
                        return $query->purchases->code;
                    });
            return view('admin.pages.purchase.inventory.index', compact('inventories'));
        }
    }
