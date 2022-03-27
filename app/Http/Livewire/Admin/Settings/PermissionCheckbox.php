<?php

namespace App\Http\Livewire\Admin\Settings;

use Illuminate\Support\Arr;
use Livewire\Component;
use Spatie\Permission\Models\Permission;
use Str;

class PermissionCheckbox extends Component
{
    public $dashboardPermissions;
    public $groupPermissions;
    public $administrationPermissions;

    public $select = [];

    public $selectGroup = [];
    public $selected = [];
    public $name;

    public $rules = [
        'name' => 'required|min:3',
        'selected' => 'required|array'
    ];

    public function render()
    {
//        dd($this->selectGroup);
        return view('livewire.admin.settings.permission-checkbox');
    }

    public function updated($key, $value)
    {
        $explode = Str::of($key)->explode('.');
        if ($explode[0] === 'selectGroup' && is_string($value)) {
            $permissionIds = Permission::where('group_name', $value)->pluck('id')->map(fn($id) => (string)$id)->toArray();
            $this->select = $permissionIds;
            $this->selected = array_values(array_unique(array_merge_recursive($this->selected, $permissionIds)));
        } elseif ($explode[0] === 'selectGroup' && empty($value)) {
            $permissionIds = Permission::where('group_name', $explode[1])->pluck('id')->map(fn($id) => (string)$id)->toArray();
            $this->selected = array_merge(array_diff($this->selected, $permissionIds));
        }

//dd($explode);
//        if ($this->select !== $this->selected) {
//            $permissionIds = Permission::where('id', $value)->pluck('group_name')->map(fn($id) => (string)$id)->toArray();
////            dd($permissionIds);
//            unset($this->selectGroup[$permissionIds[0]]);
////            $this->selectGroup = array_splice($explode[1]);
//        }
    }
}
