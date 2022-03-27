<?php

namespace Database\Factories;

use App\Models\Product;
use App\Models\ReleasedProduct;
use Illuminate\Database\Eloquent\Factories\Factory;

class ReleasedProductFactory extends Factory
{
    /**
     * The name of the factory's corresponding model.
     *
     * @var string
     */
    protected $model = ReleasedProduct::class;

    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        $product = Product::where('product_type_id', '=', 2)->firstOrFail();
        return [
            'released_date' => $this->faker->date,
            'from_warehouse_id' => rand(3, 6),
            'product_type_id' => 2,
            'product_id' => $product->id,
            'qty' => rand(100, 500),
            'note' => $this->faker->sentence,
        ];
    }
}
