<?php

namespace Database\Factories;

use App\Models\Warehouse;
use Illuminate\Database\Eloquent\Factories\Factory;

class WarehouseFactory extends Factory
{
    /**
     * The name of the factory's corresponding model.
     *
     * @var string
     */
    protected $model = Warehouse::class;

    private static $counter = 1;

    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        $shortcut = substr($this->faker->company, 0, 1);
        return [
            'position' => self::$counter++,
            'name' => $this->faker->company . $this->faker->uuid,
            'shortcut' => $shortcut . $this->faker->uuid,
            'icon' => 'fas fa-shopping-bag',
        ];
    }
}
