<?php

namespace Database\Factories;

use App\Models\Transfer;
use App\Models\Warehouse;
use App\Services\Generator\CodeGenerator;
use Illuminate\Database\Eloquent\Factories\Factory;

class TransferFactory extends Factory
{
    /**
     * The name of the factory's corresponding model.
     *
     * @var string
     */
    protected $model = Transfer::class;

    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        $generator = new CodeGenerator();
        return [
            'transfer_date' => $this->faker->date,
            'from_warehouse_id' => 1,
            'to_warehouse_id' => rand(2, 4),
            'note' =>$this->faker->sentence,
        ];
    }
}
