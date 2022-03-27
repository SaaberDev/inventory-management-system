<?php

    namespace App\Repository\Stock;

    use Illuminate\Support\Collection;

    class StockDetail
    {
        public array $stock = [];

        /**
         * @param $models
         * @param $warehouse_id
         * @return StockDetail
         */
        function availableStock($models, $warehouse_id): StockDetail
        {
            foreach ($models as $model) {
                $stocks = $model->products->stocks()
                    ->where('warehouse_id', '=', $warehouse_id)
                    ->where('product_id', '=', $model->product_id)
                    ->get();

                foreach ($stocks as $stock) {
                    $this->stock[] = [
                        'product_id' => $model->products->id,
                        'name' => $model->products->name,
                        'code' => $model->products->code,
                        'unit_shortcut' => $model->products->units->shortcut,
                        'unit_price' => $model->unit_price,
                        'single_discount' => $model->single_discount,
                        'single_total' => $model->single_total,
                        'qty' => $model->qty,
                        'stock' => $stock->pivot->qty,
                    ];
                }
            }

            return $this;
        }

        /**
         * @param $expect
         * @return Collection
         */
        public function get($expect = null): Collection
        {
            $stocks = collect($this->stock)->map(function ($item) use ($expect) {
                return collect($item)
                    ->reject(function ($item) {
                        return is_null($item);
                    })
                    ->except($expect);
            });

            return collect(json_decode(json_encode($stocks)));
        }
    }
