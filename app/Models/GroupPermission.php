<?php

namespace App\Models;

use App\Traits\Searchable;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Spatie\Permission\Models\Permission;

/**
 * @mixin IdeHelperGroupPermission
 */
class GroupPermission extends Permission
{
    use HasFactory, Searchable;

    protected $searchable = [
        'title', 'serviceCategories.title', 'serviceCategories.navbar_status'
    ];
}
