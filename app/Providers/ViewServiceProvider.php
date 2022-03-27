<?php

namespace App\Providers;

use App\Http\View\Composers\Navbar;
use App\Http\View\Composers\Sidebar;
use Illuminate\Support\Facades\View;
use Illuminate\Support\ServiceProvider;

class ViewServiceProvider extends ServiceProvider
{
    /**
     * Register services.
     *
     * @return void
     */
    public function register()
    {
        //
    }

    /**
     * Bootstrap services.
     *
     * @return void
     */
    public function boot()
    {
        View::composer('admin.includes.navbar', Navbar::class);
        View::composer('admin.includes.sidebar', Sidebar::class);
    }
}
