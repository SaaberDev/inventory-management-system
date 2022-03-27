<?php

namespace Database\Seeders;

use App\Models\Unit;
use Illuminate\Database\Seeder;

class UnitSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $units = [
            [
                'name' => 'Piece',
                'shortcut' => 'P',
            ],
            [
                'name' => 'Kilogram',
                'shortcut' => 'KG',
            ],
            [
                'name' => 'Gram',
                'shortcut' => 'G',
            ],
            [
                'name' => 'Liter',
                'shortcut' => 'L',
            ],
        ];

        collect($units)->each(function ($unit){
            Unit::factory()->create($unit);
        });
    }
}
