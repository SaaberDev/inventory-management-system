<?php

    namespace Database\Seeders;

    use App\Models\Product;
    use Illuminate\Database\Seeder;

    class ProductSeeder extends Seeder
    {
        /**
         * Run the database seeds.
         *
         * @return void
         */
        public function run()
        {
//            $collection = Product::factory()->count(10)->make();
//            $chunks = $collection->chunk(25);
//            $chunks->each(function ($chunk) {
//                Product::insert($chunk->toArray());
//            });

            $raw_items = collect(
                [
                    [
                        'name' =>'Petroleum Rubber',
                        'shortcut' => 'RAW'
                    ],
                    [
                        'name' =>'TPU',
                        'shortcut' => 'RAW'
                    ],
                    [
                        'name' =>'EVA Foam',
                        'shortcut' => 'RAW'
                    ]
                ]
            );

            foreach ($raw_items as $key => $raw_item) {
                Product::create([
                    'name' => $raw_item['name'],
                    'code' => $raw_item['shortcut'] . str_pad(($key + 1), 5, '0', STR_PAD_LEFT),
                    'unit_id' => rand(1, 4),
                    'product_type_id' => 1,
                    'stock_alert_limit' => rand(5, 15)
                ]);
            }


            $released_items = collect(
                [
                    [
                        'name' =>'Shoe Sole',
                        'shortcut' => 'REL'
                    ],
                    [
                        'name' =>'Shoelace',
                        'shortcut' => 'REL'
                    ]
                ]
            );

            foreach ($released_items as $key => $released_item) {
                Product::create([
                    'name' => $released_item['name'],
                    'code' => $released_item['shortcut'] . str_pad(($key + 1), 5, '0', STR_PAD_LEFT),
                    'unit_id' => rand(1, 4),
                    'product_type_id' => 2,
                    'stock_alert_limit' => rand(5, 15)
                ]);
            }


            $finished_items = collect(
                [
                    [
                        'name' =>'Shoe',
                        'shortcut' => 'FIN'
                    ],
                    [
                        'name' =>'Sandal',
                        'shortcut' => 'FIN'
                    ]
                ]
            );

            foreach ($finished_items as $key => $finished_item) {
                Product::create([
                    'name' => $finished_item['name'],
                    'code' => $finished_item['shortcut'] . str_pad(($key + 1), 5, '0', STR_PAD_LEFT),
                    'unit_id' => rand(1, 4),
                    'product_type_id' => 3,
                    'stock_alert_limit' => rand(5, 15)
                ]);
            }
        }
    }
