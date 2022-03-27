<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    protected $toTruncate = [
        'users',
        'permissions',
        'roles',
        'products',
        'units',
        'suppliers',
        'clients',
        'warehouses',
        'product_types',
    ];

    /**
     * Seed the application's database.
     *
     * @return void
     */
    public function run()
    {
        // truncate all tables before seeding
        truncateTables($this->toTruncate);

        $this->call([
            RolePermissionSeeder::class,
            AdminSeeder::class,
            UnitSeeder::class,
            SupplierSeeder::class,
            ClientSeeder::class,
            WarehouseSeeder::class,
            ProductTypeSeeder::class,
            ProductSeeder::class,
            StockSeeder::class,
//            DamagedSeeder::class,
//            UsedSeeder::class,
//            PurchaseSeeder::class,
//            TransferSeeder::class,
//            ReleasedProductSeeder::class
        ]);
    }
}
