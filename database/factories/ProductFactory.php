<?php

namespace Database\Factories;

use App\Models\Product;
use Illuminate\Database\Eloquent\Factories\Factory;

class ProductFactory extends Factory
{
    /**
     * The name of the factory's corresponding model.
     *
     * @var string
     */
    protected $model = Product::class;

    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        return [
            'code' => $this->faker->uuid,
            'name' => $this->faker->name,
            'unit_id' => rand(1, 4),
            'product_type_id' => 1,
            'stock_alert_limit' => rand(5, 15),
        ];
    }
}
