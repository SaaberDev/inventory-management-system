<?php

namespace Database\Factories;

use App\Models\Purchase;
use App\Models\PurchaseDetail;
use App\Models\Warehouse;
use Illuminate\Database\Eloquent\Factories\Factory;

class PurchaseFactory extends Factory
{
    /**
     * The name of the factory's corresponding model.
     *
     * @var string
     */
    protected $model = Purchase::class;

    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        return [
            'purchase_date' => $this->faker->date,
            'supplier_id' => rand(1, 10),
            'payment_method' => $this->faker->randomElement(['bkash', 'cash', 'card']),
            'payment_status' => $this->faker->randomElement(['paid', 'due']),
            'note' => $this->faker->sentence,
        ];
    }
}
