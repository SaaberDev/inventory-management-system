<?php

namespace Database\Factories;

use App\Models\Transfer;
use App\Models\TransferDetail;
use Illuminate\Database\Eloquent\Factories\Factory;

class TransferDetailFactory extends Factory
{
    /**
     * The name of the factory's corresponding model.
     *
     * @var string
     */
    protected $model = TransferDetail::class;

    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        return [
            'product_id' => rand(1, 4),
            'qty' => rand(100, 500)
        ];
    }
}
