<?php

    namespace App\Http\View\Composers;

    use App\Models\Warehouse;
    use Illuminate\View\View;

    class Sidebar
    {
        protected $warehouses;

        public function __construct()
        {
//            $this->warehouses =
//                Warehouse::orderBy('position')->get()
//                    ->sortByDesc(function ($item) {
//                        return $item['id'] == 1;
//                    })
//                    ->sortBy(function ($item) {
//                        return $item['id'] == 2;
//                    });
        }

        public function compose(View $view)
        {
            $view->with('warehouses', $this->warehouses);
        }
    }
