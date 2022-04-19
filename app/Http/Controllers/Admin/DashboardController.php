<?php

    namespace App\Http\Controllers\Admin;

    use App\Http\Controllers\Controller;
    use App\Models\Expense;
    use App\Models\Product;
    use App\Models\ProductType;
    use App\Models\Purchase;
    use App\Models\Sale;
    use Carbon\Carbon;
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

            $purchaseData = $this->monthlySaleAndPurchaseChartByAmount()['purchase'];
            $saleData = $this->monthlySaleAndPurchaseChartByAmount()['sale'];

            $purchaseDataByPrice = $this->monthlySaleAndPurchaseChartByAmount('by_price')['purchase'];
            $saleDataByPrice = $this->monthlySaleAndPurchaseChartByAmount('by_price')['sale'];

            $totalProducts = Product::count();

            return view('admin.index', compact('product_raw','product_rele','product_fin','totalSale','totalPurchase','totalExpense','lose','pofid', 'purchaseData', 'saleData', 'purchaseDataByPrice', 'saleDataByPrice', 'totalProducts'));
        }

        /**
         * @return array[]
         */
        private function monthlySaleAndPurchaseChartByAmount($type = null)
        {
            $purchaseData = [];
            $saleData = [];

            $months = ['JAN', 'FEB', 'MAR', 'APR', 'MAY', 'JUN', 'JUL', 'AUG', 'SEP', 'OCT', 'NOV', 'DEC'];
            $months = startIndexWithOne($months);

            $count = count($months);
            // Circle through all 12 months
            for ($month = 1; $month <= $count; $month++) {
                // Create a Carbon object from the current year and the current month (equals 2019-01-01 00:00:00)
                $date = Carbon::create(date('Y'), $month);

                // Make a copy of the start date and move to the end of the month (e.g. 2019-01-31 23:59:59)
                $date_end = $date->copy()->endOfMonth();

                if ($type === 'by_price') {
                    $purchase = Purchase::where('created_at', '>=', $date)
                        ->where('created_at', '<=', $date_end)
                        ->sum('grand_total');

                    $sale = Sale::where('created_at', '>=', $date)
                        ->where('created_at', '<=', $date_end)
                        ->sum('grand_total');

//                    dd($purchase);
                } else {
                    $purchase = Purchase::where('created_at', '>=', $date)
                        ->where('created_at', '<=', $date_end)
                        ->count();

                    $sale = Sale::where('created_at', '>=', $date)
                        ->where('created_at', '<=', $date_end)
                        ->count();
                }


                // Save the count of purchase and sale for the current month in the output array
                $purchaseData[$months[$month]] = $purchase;
                $saleData[$months[$month]] = $sale;
            }

            return [
                'purchase' => $purchaseData,
                'sale' => $saleData
            ];
        }

        private function monthlySaleAndPurchaseChartByPrice()
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
