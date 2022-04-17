<?php

    namespace App\Http\Controllers\Admin\Stock;

    use App\Http\Controllers\Controller;
    use App\Models\Product;
    use App\Models\ProductType;
    use App\Models\PurchaseDetail;
    use App\Models\Stock;
    use App\Models\Warehouse;
    use Illuminate\Contracts\Foundation\Application;
    use Illuminate\Contracts\View\Factory;
    use Illuminate\Contracts\View\View;
    use Illuminate\Http\Request;
    use Illuminate\Support\Collection;
    use function Livewire\str;

    class StockController extends Controller
    {
        public string $url;
        public string $buttonText;

        /**
         * @param Request $request
         */
        public function __construct(Request $request)
        {
            $param = $request->get('name');

            switch ($param) {
                case 'purchase':
                    $this->url = route('admin.purchase.self.create');
                    $this->buttonText = 'Add Purchase';
                    break;
                case 'sale':
                    $this->url = '#';
                    $this->buttonText = 'Add Sale';
                    break;
                default:
                    $this->url = route('admin.release.create');
                    $this->buttonText = 'Add Release Product';
            }
        }

        /**
         * @param Request $request
         * @return Application|Factory|View
         */
        public function index(Request $request)
        {
            session()->forget('url.intended');
            if ($request->route('id') == Warehouse::PURCHASE) {
                $stocks = Stock::where('qty', '!=', 0)
                    ->where('warehouse_id', '=', Warehouse::PURCHASE)
                    ->get();

                $stock_details = self::getStockByProductType($stocks, ProductType::RAW);
            } elseif ($request->route('id') == Warehouse::FINISHED) {
                $stocks = Stock::where('qty', '!=', 0)
                    ->where('warehouse_id', '=', Warehouse::FINISHED)
                    ->get();

                $stock_details = self::getStockByProductType($stocks, ProductType::FIN);
            } else {
                $stocks = Stock::where('qty', '!=', 0)
                    ->where('warehouse_id', '=', $request->route('id'))
                    ->get();

                $stock_details = self::getStockByProductType($stocks);
            }

            return view('admin.pages.stock.index', compact('stock_details'),
                [
                    'url' => $this->url,
                    'buttonText' => $this->buttonText
                ]);
        }

        /**
         * @param $stocks
         * @param null $productType
         * @return Collection
         */
        private function getStockByProductType($stocks, $productType = null): Collection
        {
            $data = [];
            foreach ($stocks as $stock) {
                if (!empty($productType)) {
                    $details = $stock->products()->where('product_type_id', '=', $productType)->get();
                } else {
                    $details = $stock->products()->get();
                }

                $stock_details = [];
                foreach ($details as $detail) {
                    $stock_details['unit_shortcut'] = $detail->units->shortcut;
                    $stock_details['code'] = $detail->code;
                    $stock_details['name'] = $detail->name;
                    $stock_details['updated_at'] = $detail->updated_at;
                    $stock_details['qty'] = $stock->qty;

                    $data[] = $stock_details;
                }
            }
            return collect($data);
        }
    }
