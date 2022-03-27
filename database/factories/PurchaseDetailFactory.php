<?php

namespace Database\Factories;

use App\Models\PurchaseDetail;
use App\Models\Warehouse;
use Illuminate\Database\Eloquent\Factories\Factory;

class PurchaseDetailFactory extends Factory
{
    /**
     * The name of the factory's corresponding model.
     *
     * @var string
     */
    protected $model = PurchaseDetail::class;

    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        $qty = $this->faker->numberBetween(20, 100);
        $unit_price = $this->faker->numberBetween(10, 500);
        $discount = $this->faker->numberBetween(1, 5);
        $single_total = ($qty * $unit_price);
        $total_discount = ($single_total * $discount / 100);

        return [
            'purchase_id' => rand(1, 10),
            'warehouse_id' => Warehouse::PURCHASE,
            'product_id' => rand(1, 4),
            'qty' => $qty,
            'unit_price' => $unit_price,
            'single_discount' => $discount,
            'single_total' => ($single_total - $total_discount)
        ];
    }
}
