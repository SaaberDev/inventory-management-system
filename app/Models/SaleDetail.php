<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

/**
 * @mixin IdeHelperSaleDetail
 */
class SaleDetail extends Model
{
    use HasFactory;
    protected $table = 'sale_details';

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

    public function sales()
    {
        return $this->belongsTo(Sales::class, 'sale_id');
    }
    public function products()
    {
        return $this->belongsTo(Product::class, 'product_id');
    }
}
