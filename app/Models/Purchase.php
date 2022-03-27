<?php

    namespace App\Models;

    use Illuminate\Database\Eloquent\Factories\HasFactory;
    use Illuminate\Database\Eloquent\Model;
    use Spatie\MediaLibrary\HasMedia;
    use Spatie\MediaLibrary\InteractsWithMedia;

    /**
 * @mixin IdeHelperPurchase
 */
    class Purchase extends Model implements HasMedia
    {
        use HasFactory, InteractsWithMedia;

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
            return $this->hasMany(PurchaseDetail::class);
        }

        public function suppliers()
        {
            return $this->belongsTo(Supplier::class, 'supplier_id');
        }

//        public function stocks()
//        {
//            return $this->belongsToMany(Warehouse::class, 'stock', 'product_id', 'warehouse_id')
//                ->withPivot('qty', 'created_at', 'updated_at')
//                ->withTimestamps();
//        }


        /*
        |--------------------------------------------------------------------------
        | Others
        |--------------------------------------------------------------------------
        */
        public function registerMediaCollections(): void
        {
            $this->addMediaCollection('document')
                ->acceptsMimeTypes(['image/jpeg', 'image/png', 'application/pdf']);
        }
    }
