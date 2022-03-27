<?php

namespace App\Models;

use App\Traits\Searchable;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Spatie\Permission\Models\Role;

/**
 * @mixin IdeHelperCustomRole
 */
class CustomRole extends Role
{
    use HasFactory, Searchable;

    protected $searchable = [
        'name'
    ];
}
