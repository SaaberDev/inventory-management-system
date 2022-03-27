<?php

namespace App\Http\Livewire\Admin\Settings;

use App\Models\CustomRole;
use Livewire\Component;
use Livewire\WithPagination;
use Spatie\Permission\Models\Role;

class PermissionTable extends Component
{
    use WithPagination;

//    public $role;

//    public $status = 'published_status';

    protected $listeners = ['$refresh'];

    public $search = '';
    public $filterByStatus = null;
    public $recordPerPage = 15;
    public $page = 1;

    // Shows search query in URL
    protected $queryString = [
        'search' => ['except' => ''],
        'page' => ['except' => 1],
    ];

    public function mount()
    {
        $this->fill(request()->only('search', 'page'));
    }

    public function resetSearch()
    {
        $this->reset('search');
    }

    public function updatingSearch()
    {
        $this->gotoPage(1);
    }

    public function render()
    {
        $search = $this->search;
        $roles = CustomRole::with('permissions')
            ->search($search)
            ->withCount('permissions')
            ->orderByDesc('permissions_count')
            ->paginate($this->recordPerPage);
        return view('livewire.admin.settings.permission-table', compact('roles'));
    }
}
