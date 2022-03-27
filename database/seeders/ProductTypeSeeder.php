<?php

namespace Database\Seeders;

use App\Models\ProductType;
use Illuminate\Database\Seeder;

class ProductTypeSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $categories = [
            [
                'name' => 'Raw Material',
                'shortcut' => 'RAW',
            ],
            [
                'name' => 'Released Product',
                'shortcut' => 'REL',
            ],
            [
                'name' => 'Finished Product',
                'shortcut' => 'FIN',
            ]
        ];

        collect($categories)->each(function ($category){
            ProductType::factory()->create($category);
        });
    }
}
