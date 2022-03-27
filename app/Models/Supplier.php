<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

/**
 * @mixin IdeHelperSupplier
 */
class Supplier extends Model
{
    use HasFactory;

    protected $guarded = [];

//    protected $table = 'suppliers';

    public function purchases()
    {
        return $this->hasMany(Purchase::class, 'supplier_id');
    }
}
