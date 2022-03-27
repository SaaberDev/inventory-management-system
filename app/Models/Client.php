<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

/**
 * @mixin IdeHelperClient
 */
class Client extends Model
{
    use HasFactory;

    protected $guarded = [];

    public function sales()
    {
        return $this->hasMany(sales::class, 'client_id');
    }
}
