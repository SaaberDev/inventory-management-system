<?php

namespace Database\Seeders;

use App\Models\Transfer;
use App\Models\TransferDetail;
use Illuminate\Database\Seeder;

class TransferSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        Transfer::factory()
            ->count(10)
            ->has(
                TransferDetail::factory()->count(3), 'transferDetails'
            )
            ->sequence(fn ($sequence) => [
                'code' => 'TR-' . str_pad(($sequence->index + 1), 5, '0', STR_PAD_LEFT)
            ])
            ->create();
    }
}
