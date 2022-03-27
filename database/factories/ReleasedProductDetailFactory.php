<?php

namespace Database\Factories;

use App\Models\ReleasedProductDetail;
use Illuminate\Database\Eloquent\Factories\Factory;

class ReleasedProductDetailFactory extends Factory
{
    /**
     * The name of the factory's corresponding model.
     *
     * @var string
     */
    protected $model = ReleasedProductDetail::class;

    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        return [
            'product_id' => rand(1, 4),
            'qty' => rand(20, 50),
        ];
    }
}
