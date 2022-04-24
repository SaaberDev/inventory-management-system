<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\Pivot;

/**
 * @mixin IdeHelperStock
 */
class Stock extends Pivot
{
    use HasFactory;

    protected $table = 'stock';

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

    public function warehouses()
    {
        return $this->belongsTo(Warehouse::class, 'warehouse_id');
    }

    public function products()
    {
        return $this->belongsTo(Product::class, 'product_id');
    }

//    public function productType()
//    {
//        return $this->belongsTo(Product::class, 'product_type_id');
//    }

    /*
    |--------------------------------------------------------------------------
    | Others
    |--------------------------------------------------------------------------
    */
}
