<?php

    namespace App\Http\Livewire\Admin\Settings;

    use Livewire\Component;

    class AdministrationTable extends Component
    {
        public $users;

        protected $listeners = ['$refresh'];

        public function render()
        {
            return view('livewire.admin.settings.administration-table');
        }
    }
