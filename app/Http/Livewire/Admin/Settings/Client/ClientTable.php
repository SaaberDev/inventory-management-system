<?php

namespace App\Http\Livewire\Admin\Settings\Client;

use Livewire\Component;

class ClientTable extends Component
{
    public $clients;

    protected $listeners = ['$refresh'];

    public function render()
    {
        return view('livewire.admin.settings.client.client-table');
    }
}
