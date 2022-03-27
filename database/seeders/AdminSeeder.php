<?php

namespace Database\Seeders;

use App\Models\User;
use Carbon\Carbon;
use Illuminate\Database\Seeder;
use Spatie\Permission\Models\Role;

class AdminSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $token_length = 64;
        // Super Admin
        $role = Role::findByName('super_admin');
        $admin = User::create([
            'name' => 'Mahfuzur Rahman Saber',
            'designation' => 'Developer',
            'username' => 'saaberdev',
            'email' => 'saaberdev@gmail.com',
            'email_verified_at' => Carbon::now(),
            'password' => \Hash::make('1234'),
            'remember_token' => \Str::random($token_length)
        ]);
        $admin->assignRole($role);

        // Admin
        $role = Role::findByName('admin');
        $admin = User::create([
            'name' => 'Admin',
            'designation' => 'Admin',
            'username' => 'admin',
            'email' => 'admin@gmail.com',
            'email_verified_at' => Carbon::now(),
            'password' => \Hash::make('1234'),
            'remember_token' => \Str::random($token_length)
        ]);
        $admin->assignRole($role);

        // Manager
        $role = Role::findByName('manager');
        $admin = User::create([
            'name' => 'Manager',
            'designation' => 'Manager',
            'username' => 'manager',
            'email' => 'manager@gmail.com',
            'email_verified_at' => Carbon::now(),
            'password' => \Hash::make('1234'),
            'remember_token' => \Str::random($token_length)
        ]);
        $admin->assignRole($role);
    }
}
