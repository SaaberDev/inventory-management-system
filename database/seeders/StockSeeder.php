<?php

namespace Database\Seeders;

use App\Models\Product;
use App\Models\Warehouse;
use Illuminate\Database\Seeder;

class StockSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $products = Product::all();
        $warehouse_ids = Warehouse::pluck('id')->toArray();
        foreach ($products as $product) {
            foreach ($warehouse_ids as $warehouse_id) {
                $product->stocks()->attach($warehouse_id);
            }
        }
    }
}
