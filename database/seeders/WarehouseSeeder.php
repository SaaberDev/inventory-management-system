<?php

namespace Database\Seeders;

use App\Models\Warehouse;
use Illuminate\Database\Seeder;

class WarehouseSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
//        $collection = Warehouse::factory()->count(50000)->make();
//        $chunks = $collection->chunk(5000);
//        $chunks->each(function ($chunk) {
//            Warehouse::insert($chunk->toArray());
//        });


        $warehouses = [
            [
                'position' => 1,
                'name' => 'Purchase',
                'shortcut' => 'PUR',
                'icon' => 'fas fa-truck-loading',
            ],
            [
                'position' => 2,
                'name' => 'Finished Goods',
                'shortcut' => 'S',
                'icon' => 'fas fa-shopping-bag',
            ],
            [
                'position' => 3,
                'name' => 'Cutting Unit',
                'shortcut' => 'CU',
                'icon' => 'fas fa-cut',
            ],
            [
                'position' => 4,
                'name' => 'Sewing Unit',
                'shortcut' => 'SW',
                'icon' => 'fas fa-tools',
            ],
            [
                'position' => 5,
                'name' => 'PU Unit',
                'shortcut' => 'PU',
                'icon' => 'fas fa-cubes',
            ],
            [
                'position' => 6,
                'name' => 'CDC',
                'shortcut' => 'CDC',
                'icon' => 'fas fa-people-carry',
            ]
        ];

        collect($warehouses)->each(function ($warehouse){
            Warehouse::factory()->create($warehouse);
        });
    }
}
