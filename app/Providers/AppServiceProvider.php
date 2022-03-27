<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;
use Illuminate\Validation\Rules\Password;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     *
     * @return void
     */
    public function register()
    {
        //
    }

    /**
     * Bootstrap any application services.
     *
     * @return void
     */
    public function boot()
    {
        if (app()->environment('production')) {
            Password::defaults(function () {
                return Password::min(6)
                    ->mixedCase()
                    ->symbols()
                    ->numbers()
                    ->uncompromised();
            });
        } else {
            Password::defaults(function () {
                return Password::min(4);
            });
        }
    }
}
