<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

/**
 * @mixin IdeHelperPurchaseDetail
 */
class PurchaseDetail extends Model
{
    use HasFactory;

    protected $table = 'purchase_details';

    /*
    |--------------------------------------------------------------------------
    | Mass Assignment
    |--------------------------------------------------------------------------
    */
    protected $guarded = [];

    /*
    |--------------------------------------------------------------------------
    | Accessors
    |--------------------------------------------------------------------------
    */
    public function getSingleDiscountAttribute($value)
    {
        return round($value);
    }

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

    public function purchases()
    {
        return $this->belongsTo(Purchase::class, 'purchase_id');
    }

    public function warehouses()
    {
        return $this->belongsTo(Warehouse::class, 'warehouse_id');
    }

    public function products()
    {
        return $this->belongsTo(Product::class, 'product_id');
    }

//    public function stocks()
//    {
//        return $this->belongsToMany(Product::class, 'stock', 'warehouse_id', 'product_id')
//            ->withPivot('qty', 'created_at', 'updated_at')
//            ->withTimestamps();
//    }
}
