<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

/**
 * @mixin IdeHelperProduct
 */
class Product extends Model
{
    use HasFactory;

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


    public function purchaseDetails()
    {
        return $this->belongsTo(PurchaseDetail::class, 'purchase_id');
    }
    public function salesDetails()
    {
        return $this->belongsTo(SaleDetail::class, 'sale_id');
    }

    public function units()
    {
        return $this->belongsTo(Unit::class, 'unit_id');
    }

    public function stocks()
    {
        return $this->belongsToMany(
            Warehouse::class,
            'stock',
            'product_id', 'warehouse_id'
        )
            ->withPivot('qty', 'created_at', 'updated_at')
            ->using(Stock::class)
            ->withTimestamps()
            ;
    }

    public function productTypes()
    {
        return $this->belongsTo(ProductType::class, 'product_type_id');
    }

    public function productStock()
    {
        return $this->hasMany(Stock::class);
    }

    /*
    |--------------------------------------------------------------------------
    | Others
    |--------------------------------------------------------------------------
    */
}
