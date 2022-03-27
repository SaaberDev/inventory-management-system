<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

/**
 * @mixin IdeHelperSale
 */
class Sale extends Model
{
    use HasFactory;
    protected $table = 'sales';

    /*
    |--------------------------------------------------------------------------
    | Mass Assignment
    |--------------------------------------------------------------------------
    */
    protected $guarded = [];

    /*
    |--------------------------------------------------------------------------
    | Accessors & Mutators
    |--------------------------------------------------------------------------
    */

    /*
    |--------------------------------------------------------------------------
    | Mutators
    |--------------------------------------------------------------------------
    */

    /*
    |--------------------------------------------------------------------------
    | Model Relationship
    |--------------------------------------------------------------------------
    */

    /*
    |--------------------------------------------------------------------------
    | Others
    |--------------------------------------------------------------------------
    */

    public function salesDetails()
    {
        return $this->hasMany(SaleDetail::class);
    }
    public function client()
    {
        return $this->belongsTo(Client::class, 'supplier_id');
    }
}
