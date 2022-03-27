<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

/**
 * @mixin IdeHelperWarehouse
 */
class Warehouse extends Model
{
    use HasFactory;

    const PURCHASE = '1';
    const SALE = '2';



//    const PURCHASE = '7';
//    const CUTTING = '7';
//    const SWING = '7';
//    const PUUNIT = '7';
//    const CDC = '7';
//    const SALE = '7';

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

    public function stocks()
    {
        return $this->belongsToMany(
            Product::class,
            'stock',
            'warehouse_id', 'product_id'
        )
            ->withPivot('qty', 'created_at', 'updated_at')
            ->withTimestamps();
    }



    /*
    |--------------------------------------------------------------------------
    | Others
    |--------------------------------------------------------------------------
    */
}
