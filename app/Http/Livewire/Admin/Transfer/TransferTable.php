<?php

namespace App\Http\Livewire\Admin\Transfer;

use Livewire\Component;

class TransferTable extends Component
{
    public $transfer_infos;

    protected $listeners = ['$refresh'];

    public function render()
    {
        return view('livewire.admin.transfer.transfer-table');
    }
}
