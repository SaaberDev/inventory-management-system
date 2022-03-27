<?php

    namespace App\Http\Controllers\Admin;

    use App\Http\Controllers\Controller;
    use App\Models\Expense;
    use App\Models\Product;
    use App\Models\ProductType;
    use App\Models\Purchase;
    use App\Models\Sale;
    use Illuminate\Contracts\Foundation\Application;
    use Illuminate\Contracts\View\Factory;
    use Illuminate\Contracts\View\View;
    use Illuminate\Http\Request;
    use Illuminate\Http\Response;

    class DashboardController extends Controller
    {
        /**
         * Display a listing of the resource.
         *
         * @return Application|Factory|View|Response
         */
        public function index()
        {
            $product_raw = Product::leftJoin('stock','stock.product_id','=','products.id')
                ->leftJoin('warehouses','warehouses.id','=','stock.warehouse_id')
                ->where('products.product_type_id','=',1)
                ->where('stock.qty','>',0)
                ->get(['products.*','stock.qty','warehouses.name as w_name']);

            $product_rele = Product::leftJoin('stock','stock.product_id','=','products.id')
                ->leftJoin('warehouses','warehouses.id','=','stock.warehouse_id')
                ->where('products.product_type_id','=',2)
                ->where('stock.qty','>',0)
                ->get(['products.*','stock.qty','warehouses.name as w_name']);

            $product_fin = Product::leftJoin('stock','stock.product_id','=','products.id')
                ->leftJoin('warehouses','warehouses.id','=','stock.warehouse_id')
                ->where('products.product_type_id','=',3)
                ->where('stock.qty','>',0)
                ->get(['products.*','stock.qty','warehouses.name as w_name']);
            $totalSale = Sale::sum('grand_total');
            $totalPurchase = Purchase::sum('grand_total');
            $totalExpense = Expense::sum('cost');
            $purchase =($totalPurchase + $totalExpense);
            $lose =0;
            $pofid =0;
            if($totalSale < $purchase){
                $lose = ((int)$purchase - (int)$totalSale);
            }elseif ($totalSale >= $purchase){
                $pofid = ((int)$totalSale - (int)$purchase);
            }


            return view('admin.index',compact('product_raw','product_rele','product_fin','totalSale','totalPurchase','totalExpense','lose','pofid'));
        }

        /**
         * Show the form for creating a new resource.
         *
         * @return Response
         */
        public function create()
        {
            //
        }

        /**
         * Store a newly created resource in storage.
         *
         * @param Request $request
         * @return Response
         */
        public function store(Request $request)
        {
            //
        }

        /**
         * Display the specified resource.
         *
         * @param int $id
         * @return Response
         */
        public function show($id)
        {
            //
        }

        /**
         * Show the form for editing the specified resource.
         *
         * @param int $id
         * @return Response
         */
        public function edit($id)
        {
            //
        }

        /**
         * Update the specified resource in storage.
         *
         * @param Request $request
         * @param int $id
         * @return Response
         */
        public function update(Request $request, $id)
        {
            //
        }

        /**
         * Remove the specified resource from storage.
         *
         * @param int $id
         * @return Response
         */
        public function destroy($id)
        {
            //
        }
    }
