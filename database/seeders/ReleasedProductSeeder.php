<?php

namespace Database\Seeders;

use App\Models\ReleasedProduct;
use App\Models\ReleasedProductDetail;
use Illuminate\Database\Seeder;

class ReleasedProductSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        ReleasedProduct::factory()
            ->count(10)
            ->has(
                ReleasedProductDetail::factory()->count(3),
                'releasedProductDetails'
            )
            ->sequence(fn ($sequence) => [
                'code' => 'REL-CU' . str_pad(($sequence->index + 1), 5, '0', STR_PAD_LEFT)
            ])
            ->create();
    }
}
