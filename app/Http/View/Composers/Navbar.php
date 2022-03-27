<?php


    namespace App\Http\View\Composers;

    use Illuminate\View\View;

    class Navbar
    {
        protected $user;

        public function __construct()
        {
            $this->user = \Auth::user();
        }

        public function compose(View $view)
        {
            $view->with('user', $this->user);
        }
    }
