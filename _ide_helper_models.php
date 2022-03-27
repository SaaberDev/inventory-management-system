<?php

// @formatter:off
/**
 * A helper file for your Eloquent Models
 * Copy the phpDocs from this file to the correct Model,
 * And remove them from this file, to prevent double declarations.
 *
 * @author Barry vd. Heuvel <barryvdh@gmail.com>
 */


namespace App\Models{
/**
 * App\Models\Client
 *
 * @mixin IdeHelperClient
 * @property int $id
 * @property string $name
 * @property string|null $phone
 * @property string|null $email
 * @property string $country
 * @property string $city
 * @property string|null $address
 * @property \Illuminate\Support\Carbon|null $created_at
 * @property \Illuminate\Support\Carbon|null $updated_at
 * @method static \Database\Factories\ClientFactory factory(...$parameters)
 * @method static \Illuminate\Database\Eloquent\Builder|Client newModelQuery()
 * @method static \Illuminate\Database\Eloquent\Builder|Client newQuery()
 * @method static \Illuminate\Database\Eloquent\Builder|Client query()
 * @method static \Illuminate\Database\Eloquent\Builder|Client whereAddress($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Client whereCity($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Client whereCountry($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Client whereCreatedAt($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Client whereEmail($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Client whereId($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Client whereName($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Client wherePhone($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Client whereUpdatedAt($value)
 */
	class IdeHelperClient extends \Eloquent {}
}

namespace App\Models{
/**
 * App\Models\CustomRole
 *
 * @mixin IdeHelperCustomRole
 * @property int $id
 * @property string $name
 * @property string $guard_name
 * @property \Illuminate\Support\Carbon|null $created_at
 * @property \Illuminate\Support\Carbon|null $updated_at
 * @property-read \Illuminate\Database\Eloquent\Collection|\Spatie\Permission\Models\Permission[] $permissions
 * @property-read int|null $permissions_count
 * @property-read \Illuminate\Database\Eloquent\Collection|\App\Models\User[] $users
 * @property-read int|null $users_count
 * @method static \Illuminate\Database\Eloquent\Builder|CustomRole newModelQuery()
 * @method static \Illuminate\Database\Eloquent\Builder|CustomRole newQuery()
 * @method static \Illuminate\Database\Eloquent\Builder|Role permission($permissions)
 * @method static \Illuminate\Database\Eloquent\Builder|CustomRole query()
 * @method static \Illuminate\Database\Eloquent\Builder|CustomRole whereCreatedAt($value)
 * @method static \Illuminate\Database\Eloquent\Builder|CustomRole whereGuardName($value)
 * @method static \Illuminate\Database\Eloquent\Builder|CustomRole whereId($value)
 * @method static \Illuminate\Database\Eloquent\Builder|CustomRole whereName($value)
 * @method static \Illuminate\Database\Eloquent\Builder|CustomRole whereUpdatedAt($value)
 */
	class IdeHelperCustomRole extends \Eloquent {}
}

namespace App\Models{
/**
 * App\Models\Damaged
 *
 * @mixin IdeHelperDamaged
 * @method static \Database\Factories\DamagedFactory factory(...$parameters)
 * @method static \Illuminate\Database\Eloquent\Builder|Damaged newModelQuery()
 * @method static \Illuminate\Database\Eloquent\Builder|Damaged newQuery()
 * @method static \Illuminate\Database\Eloquent\Builder|Damaged query()
 */
	class IdeHelperDamaged extends \Eloquent {}
}

namespace App\Models{
/**
 * App\Models\DamagedItem
 *
 * @mixin IdeHelperDamagedItem
 * @property int $id
 * @property string $damage_date
 * @property string $reason
 * @property string|null $note
 * @property \Illuminate\Support\Carbon|null $created_at
 * @property \Illuminate\Support\Carbon|null $updated_at
 * @method static \Database\Factories\DamagedItemFactory factory(...$parameters)
 * @method static \Illuminate\Database\Eloquent\Builder|DamagedItem newModelQuery()
 * @method static \Illuminate\Database\Eloquent\Builder|DamagedItem newQuery()
 * @method static \Illuminate\Database\Eloquent\Builder|DamagedItem query()
 * @method static \Illuminate\Database\Eloquent\Builder|DamagedItem whereCreatedAt($value)
 * @method static \Illuminate\Database\Eloquent\Builder|DamagedItem whereDamageDate($value)
 * @method static \Illuminate\Database\Eloquent\Builder|DamagedItem whereId($value)
 * @method static \Illuminate\Database\Eloquent\Builder|DamagedItem whereNote($value)
 * @method static \Illuminate\Database\Eloquent\Builder|DamagedItem whereReason($value)
 * @method static \Illuminate\Database\Eloquent\Builder|DamagedItem whereUpdatedAt($value)
 */
	class IdeHelperDamagedItem extends \Eloquent {}
}

namespace App\Models{
/**
 * App\Models\DamagedItemDetail
 *
 * @mixin IdeHelperDamagedItemDetail
 * @property int $id
 * @property int $damaged_item_id
 * @property int $warehouse_id
 * @property int $product_id
 * @property float $qty
 * @property \Illuminate\Support\Carbon|null $created_at
 * @property \Illuminate\Support\Carbon|null $updated_at
 * @method static \Database\Factories\DamagedItemDetailFactory factory(...$parameters)
 * @method static \Illuminate\Database\Eloquent\Builder|DamagedItemDetail newModelQuery()
 * @method static \Illuminate\Database\Eloquent\Builder|DamagedItemDetail newQuery()
 * @method static \Illuminate\Database\Eloquent\Builder|DamagedItemDetail query()
 * @method static \Illuminate\Database\Eloquent\Builder|DamagedItemDetail whereCreatedAt($value)
 * @method static \Illuminate\Database\Eloquent\Builder|DamagedItemDetail whereDamagedItemId($value)
 * @method static \Illuminate\Database\Eloquent\Builder|DamagedItemDetail whereId($value)
 * @method static \Illuminate\Database\Eloquent\Builder|DamagedItemDetail whereProductId($value)
 * @method static \Illuminate\Database\Eloquent\Builder|DamagedItemDetail whereQty($value)
 * @method static \Illuminate\Database\Eloquent\Builder|DamagedItemDetail whereUpdatedAt($value)
 * @method static \Illuminate\Database\Eloquent\Builder|DamagedItemDetail whereWarehouseId($value)
 */
	class IdeHelperDamagedItemDetail extends \Eloquent {}
}

namespace App\Models{
/**
 * App\Models\Expense
 *
 * @mixin IdeHelperExpense
 * @property int $id
 * @property string $reason
 * @property string $expenses_date
 * @property int $expense_category_id
 * @property float $cost
 * @property \Illuminate\Support\Carbon|null $created_at
 * @property \Illuminate\Support\Carbon|null $updated_at
 * @property-read \App\Models\ExpenseCategory $ExpenseCategory
 * @method static \Database\Factories\ExpenseFactory factory(...$parameters)
 * @method static \Illuminate\Database\Eloquent\Builder|Expense newModelQuery()
 * @method static \Illuminate\Database\Eloquent\Builder|Expense newQuery()
 * @method static \Illuminate\Database\Eloquent\Builder|Expense query()
 * @method static \Illuminate\Database\Eloquent\Builder|Expense whereCost($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Expense whereCreatedAt($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Expense whereExpenseCategoryId($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Expense whereExpensesDate($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Expense whereId($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Expense whereReason($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Expense whereUpdatedAt($value)
 */
	class IdeHelperExpense extends \Eloquent {}
}

namespace App\Models{
/**
 * App\Models\ExpenseCategory
 *
 * @mixin IdeHelperExpenseCategory
 * @property int $id
 * @property string $name
 * @property string $desc
 * @property \Illuminate\Support\Carbon|null $created_at
 * @property \Illuminate\Support\Carbon|null $updated_at
 * @method static \Database\Factories\ExpenseCategoryFactory factory(...$parameters)
 * @method static \Illuminate\Database\Eloquent\Builder|ExpenseCategory newModelQuery()
 * @method static \Illuminate\Database\Eloquent\Builder|ExpenseCategory newQuery()
 * @method static \Illuminate\Database\Eloquent\Builder|ExpenseCategory query()
 * @method static \Illuminate\Database\Eloquent\Builder|ExpenseCategory whereCreatedAt($value)
 * @method static \Illuminate\Database\Eloquent\Builder|ExpenseCategory whereDesc($value)
 * @method static \Illuminate\Database\Eloquent\Builder|ExpenseCategory whereId($value)
 * @method static \Illuminate\Database\Eloquent\Builder|ExpenseCategory whereName($value)
 * @method static \Illuminate\Database\Eloquent\Builder|ExpenseCategory whereUpdatedAt($value)
 */
	class IdeHelperExpenseCategory extends \Eloquent {}
}

namespace App\Models{
/**
 * App\Models\GroupPermission
 *
 * @mixin IdeHelperGroupPermission
 * @property int $id
 * @property string $name
 * @property string|null $group_name
 * @property string|null $title
 * @property string $guard_name
 * @property \Illuminate\Support\Carbon|null $created_at
 * @property \Illuminate\Support\Carbon|null $updated_at
 * @property-read \Illuminate\Database\Eloquent\Collection|Permission[] $permissions
 * @property-read int|null $permissions_count
 * @property-read \Illuminate\Database\Eloquent\Collection|\Spatie\Permission\Models\Role[] $roles
 * @property-read int|null $roles_count
 * @property-read \Illuminate\Database\Eloquent\Collection|\App\Models\User[] $users
 * @property-read int|null $users_count
 * @method static \Illuminate\Database\Eloquent\Builder|GroupPermission newModelQuery()
 * @method static \Illuminate\Database\Eloquent\Builder|GroupPermission newQuery()
 * @method static \Illuminate\Database\Eloquent\Builder|Permission permission($permissions)
 * @method static \Illuminate\Database\Eloquent\Builder|GroupPermission query()
 * @method static \Illuminate\Database\Eloquent\Builder|Permission role($roles, $guard = null)
 * @method static \Illuminate\Database\Eloquent\Builder|GroupPermission whereCreatedAt($value)
 * @method static \Illuminate\Database\Eloquent\Builder|GroupPermission whereGroupName($value)
 * @method static \Illuminate\Database\Eloquent\Builder|GroupPermission whereGuardName($value)
 * @method static \Illuminate\Database\Eloquent\Builder|GroupPermission whereId($value)
 * @method static \Illuminate\Database\Eloquent\Builder|GroupPermission whereName($value)
 * @method static \Illuminate\Database\Eloquent\Builder|GroupPermission whereTitle($value)
 * @method static \Illuminate\Database\Eloquent\Builder|GroupPermission whereUpdatedAt($value)
 */
	class IdeHelperGroupPermission extends \Eloquent {}
}

namespace App\Models{
/**
 * App\Models\Product
 *
 * @mixin IdeHelperProduct
 * @property int $id
 * @property string $code
 * @property string $name
 * @property int $unit_id
 * @property int $product_type_id
 * @property string|null $stock_alert_limit
 * @property \Illuminate\Support\Carbon|null $created_at
 * @property \Illuminate\Support\Carbon|null $updated_at
 * @property-read \App\Models\ProductType $productTypes
 * @property-read \App\Models\PurchaseDetail $purchaseDetails
 * @property-read \App\Models\SaleDetail $salesDetails
 * @property-read \Illuminate\Database\Eloquent\Collection|\App\Models\Warehouse[] $stocks
 * @property-read int|null $stocks_count
 * @property-read \App\Models\Unit $units
 * @method static \Database\Factories\ProductFactory factory(...$parameters)
 * @method static \Illuminate\Database\Eloquent\Builder|Product newModelQuery()
 * @method static \Illuminate\Database\Eloquent\Builder|Product newQuery()
 * @method static \Illuminate\Database\Eloquent\Builder|Product query()
 * @method static \Illuminate\Database\Eloquent\Builder|Product whereCode($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Product whereCreatedAt($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Product whereId($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Product whereName($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Product whereProductTypeId($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Product whereStockAlertLimit($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Product whereUnitId($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Product whereUpdatedAt($value)
 */
	class IdeHelperProduct extends \Eloquent {}
}

namespace App\Models{
/**
 * App\Models\ProductType
 *
 * @mixin IdeHelperProductType
 * @property int $id
 * @property string $name
 * @property string $shortcut
 * @property \Illuminate\Support\Carbon|null $created_at
 * @property \Illuminate\Support\Carbon|null $updated_at
 * @property-read \Illuminate\Database\Eloquent\Collection|\App\Models\Product[] $products
 * @property-read int|null $products_count
 * @method static \Database\Factories\ProductTypeFactory factory(...$parameters)
 * @method static \Illuminate\Database\Eloquent\Builder|ProductType newModelQuery()
 * @method static \Illuminate\Database\Eloquent\Builder|ProductType newQuery()
 * @method static \Illuminate\Database\Eloquent\Builder|ProductType query()
 * @method static \Illuminate\Database\Eloquent\Builder|ProductType whereCreatedAt($value)
 * @method static \Illuminate\Database\Eloquent\Builder|ProductType whereId($value)
 * @method static \Illuminate\Database\Eloquent\Builder|ProductType whereName($value)
 * @method static \Illuminate\Database\Eloquent\Builder|ProductType whereShortcut($value)
 * @method static \Illuminate\Database\Eloquent\Builder|ProductType whereUpdatedAt($value)
 */
	class IdeHelperProductType extends \Eloquent {}
}

namespace App\Models{
/**
 * App\Models\Purchase
 *
 * @mixin IdeHelperPurchase
 * @property int $id
 * @property string $code
 * @property string $purchase_date
 * @property int $supplier_id
 * @property string $sub_total
 * @property string|null $total_discount
 * @property string|null $transport_cost
 * @property string $grand_total
 * @property string $total_paid
 * @property string $total_due
 * @property string $payment_method
 * @property string $payment_status
 * @property string|null $note
 * @property \Illuminate\Support\Carbon|null $created_at
 * @property \Illuminate\Support\Carbon|null $updated_at
 * @property-read \Spatie\MediaLibrary\MediaCollections\Models\Collections\MediaCollection|\Spatie\MediaLibrary\MediaCollections\Models\Media[] $media
 * @property-read int|null $media_count
 * @property-read \Illuminate\Database\Eloquent\Collection|\App\Models\PurchaseDetail[] $purchaseDetails
 * @property-read int|null $purchase_details_count
 * @property-read \App\Models\Supplier $suppliers
 * @method static \Database\Factories\PurchaseFactory factory(...$parameters)
 * @method static \Illuminate\Database\Eloquent\Builder|Purchase newModelQuery()
 * @method static \Illuminate\Database\Eloquent\Builder|Purchase newQuery()
 * @method static \Illuminate\Database\Eloquent\Builder|Purchase query()
 * @method static \Illuminate\Database\Eloquent\Builder|Purchase whereCode($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Purchase whereCreatedAt($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Purchase whereGrandTotal($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Purchase whereId($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Purchase whereNote($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Purchase wherePaymentMethod($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Purchase wherePaymentStatus($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Purchase wherePurchaseDate($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Purchase whereSubTotal($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Purchase whereSupplierId($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Purchase whereTotalDiscount($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Purchase whereTotalDue($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Purchase whereTotalPaid($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Purchase whereTransportCost($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Purchase whereUpdatedAt($value)
 */
	class IdeHelperPurchase extends \Eloquent implements \Spatie\MediaLibrary\HasMedia {}
}

namespace App\Models{
/**
 * App\Models\PurchaseDetail
 *
 * @mixin IdeHelperPurchaseDetail
 * @property int $id
 * @property int $purchase_id
 * @property int $product_id
 * @property int $warehouse_id
 * @property float $qty
 * @property string $unit_price
 * @property string|null $single_discount
 * @property string $single_total
 * @property \Illuminate\Support\Carbon|null $created_at
 * @property \Illuminate\Support\Carbon|null $updated_at
 * @property-read \App\Models\Product $products
 * @property-read \App\Models\Purchase $purchases
 * @property-read \App\Models\Warehouse $warehouses
 * @method static \Database\Factories\PurchaseDetailFactory factory(...$parameters)
 * @method static \Illuminate\Database\Eloquent\Builder|PurchaseDetail newModelQuery()
 * @method static \Illuminate\Database\Eloquent\Builder|PurchaseDetail newQuery()
 * @method static \Illuminate\Database\Eloquent\Builder|PurchaseDetail query()
 * @method static \Illuminate\Database\Eloquent\Builder|PurchaseDetail whereCreatedAt($value)
 * @method static \Illuminate\Database\Eloquent\Builder|PurchaseDetail whereId($value)
 * @method static \Illuminate\Database\Eloquent\Builder|PurchaseDetail whereProductId($value)
 * @method static \Illuminate\Database\Eloquent\Builder|PurchaseDetail wherePurchaseId($value)
 * @method static \Illuminate\Database\Eloquent\Builder|PurchaseDetail whereQty($value)
 * @method static \Illuminate\Database\Eloquent\Builder|PurchaseDetail whereSingleDiscount($value)
 * @method static \Illuminate\Database\Eloquent\Builder|PurchaseDetail whereSingleTotal($value)
 * @method static \Illuminate\Database\Eloquent\Builder|PurchaseDetail whereUnitPrice($value)
 * @method static \Illuminate\Database\Eloquent\Builder|PurchaseDetail whereUpdatedAt($value)
 * @method static \Illuminate\Database\Eloquent\Builder|PurchaseDetail whereWarehouseId($value)
 */
	class IdeHelperPurchaseDetail extends \Eloquent {}
}

namespace App\Models{
/**
 * App\Models\ReleasedProduct
 *
 * @mixin IdeHelperReleasedProduct
 * @property int $id
 * @property string $code
 * @property string $released_date
 * @property int $from_warehouse_id
 * @property int $product_id
 * @property int $product_type_id
 * @property float $qty
 * @property string|null $note
 * @property \Illuminate\Support\Carbon|null $created_at
 * @property \Illuminate\Support\Carbon|null $updated_at
 * @property-read \App\Models\Product $products
 * @property-read \Illuminate\Database\Eloquent\Collection|\App\Models\ReleasedProductDetail[] $releasedProductDetails
 * @property-read int|null $released_product_details_count
 * @property-read \App\Models\Warehouse $warehouses
 * @method static \Database\Factories\ReleasedProductFactory factory(...$parameters)
 * @method static \Illuminate\Database\Eloquent\Builder|ReleasedProduct newModelQuery()
 * @method static \Illuminate\Database\Eloquent\Builder|ReleasedProduct newQuery()
 * @method static \Illuminate\Database\Eloquent\Builder|ReleasedProduct query()
 * @method static \Illuminate\Database\Eloquent\Builder|ReleasedProduct whereCode($value)
 * @method static \Illuminate\Database\Eloquent\Builder|ReleasedProduct whereCreatedAt($value)
 * @method static \Illuminate\Database\Eloquent\Builder|ReleasedProduct whereFromWarehouseId($value)
 * @method static \Illuminate\Database\Eloquent\Builder|ReleasedProduct whereId($value)
 * @method static \Illuminate\Database\Eloquent\Builder|ReleasedProduct whereNote($value)
 * @method static \Illuminate\Database\Eloquent\Builder|ReleasedProduct whereProductId($value)
 * @method static \Illuminate\Database\Eloquent\Builder|ReleasedProduct whereProductTypeId($value)
 * @method static \Illuminate\Database\Eloquent\Builder|ReleasedProduct whereQty($value)
 * @method static \Illuminate\Database\Eloquent\Builder|ReleasedProduct whereReleasedDate($value)
 * @method static \Illuminate\Database\Eloquent\Builder|ReleasedProduct whereUpdatedAt($value)
 */
	class IdeHelperReleasedProduct extends \Eloquent {}
}

namespace App\Models{
/**
 * App\Models\ReleasedProductDetail
 *
 * @mixin IdeHelperReleasedProductDetail
 * @property int $id
 * @property int $released_product_id
 * @property int $product_id
 * @property float $qty
 * @property \Illuminate\Support\Carbon|null $created_at
 * @property \Illuminate\Support\Carbon|null $updated_at
 * @property-read \App\Models\Product $products
 * @property-read \App\Models\ReleasedProduct $releasedProducts
 * @method static \Database\Factories\ReleasedProductDetailFactory factory(...$parameters)
 * @method static \Illuminate\Database\Eloquent\Builder|ReleasedProductDetail newModelQuery()
 * @method static \Illuminate\Database\Eloquent\Builder|ReleasedProductDetail newQuery()
 * @method static \Illuminate\Database\Eloquent\Builder|ReleasedProductDetail query()
 * @method static \Illuminate\Database\Eloquent\Builder|ReleasedProductDetail whereCreatedAt($value)
 * @method static \Illuminate\Database\Eloquent\Builder|ReleasedProductDetail whereId($value)
 * @method static \Illuminate\Database\Eloquent\Builder|ReleasedProductDetail whereProductId($value)
 * @method static \Illuminate\Database\Eloquent\Builder|ReleasedProductDetail whereQty($value)
 * @method static \Illuminate\Database\Eloquent\Builder|ReleasedProductDetail whereReleasedProductId($value)
 * @method static \Illuminate\Database\Eloquent\Builder|ReleasedProductDetail whereUpdatedAt($value)
 */
	class IdeHelperReleasedProductDetail extends \Eloquent {}
}

namespace App\Models{
/**
 * App\Models\ReturnedItem
 *
 * @mixin IdeHelperReturnedItem
 * @property int $id
 * @property int|null $supplier_id
 * @property int|null $client_id
 * @property string $return_date
 * @property string $reason
 * @property string|null $note
 * @property \Illuminate\Support\Carbon|null $created_at
 * @property \Illuminate\Support\Carbon|null $updated_at
 * @method static \Database\Factories\ReturnedItemFactory factory(...$parameters)
 * @method static \Illuminate\Database\Eloquent\Builder|ReturnedItem newModelQuery()
 * @method static \Illuminate\Database\Eloquent\Builder|ReturnedItem newQuery()
 * @method static \Illuminate\Database\Eloquent\Builder|ReturnedItem query()
 * @method static \Illuminate\Database\Eloquent\Builder|ReturnedItem whereClientId($value)
 * @method static \Illuminate\Database\Eloquent\Builder|ReturnedItem whereCreatedAt($value)
 * @method static \Illuminate\Database\Eloquent\Builder|ReturnedItem whereId($value)
 * @method static \Illuminate\Database\Eloquent\Builder|ReturnedItem whereNote($value)
 * @method static \Illuminate\Database\Eloquent\Builder|ReturnedItem whereReason($value)
 * @method static \Illuminate\Database\Eloquent\Builder|ReturnedItem whereReturnDate($value)
 * @method static \Illuminate\Database\Eloquent\Builder|ReturnedItem whereSupplierId($value)
 * @method static \Illuminate\Database\Eloquent\Builder|ReturnedItem whereUpdatedAt($value)
 */
	class IdeHelperReturnedItem extends \Eloquent {}
}

namespace App\Models{
/**
 * App\Models\ReturnedItemDetail
 *
 * @mixin IdeHelperReturnedItemDetail
 * @property int $id
 * @property int|null $returned_item_id
 * @property int|null $warehouse_id
 * @property int|null $product_id
 * @property float $qty
 * @property \Illuminate\Support\Carbon|null $created_at
 * @property \Illuminate\Support\Carbon|null $updated_at
 * @method static \Database\Factories\ReturnedItemDetailFactory factory(...$parameters)
 * @method static \Illuminate\Database\Eloquent\Builder|ReturnedItemDetail newModelQuery()
 * @method static \Illuminate\Database\Eloquent\Builder|ReturnedItemDetail newQuery()
 * @method static \Illuminate\Database\Eloquent\Builder|ReturnedItemDetail query()
 * @method static \Illuminate\Database\Eloquent\Builder|ReturnedItemDetail whereCreatedAt($value)
 * @method static \Illuminate\Database\Eloquent\Builder|ReturnedItemDetail whereId($value)
 * @method static \Illuminate\Database\Eloquent\Builder|ReturnedItemDetail whereProductId($value)
 * @method static \Illuminate\Database\Eloquent\Builder|ReturnedItemDetail whereQty($value)
 * @method static \Illuminate\Database\Eloquent\Builder|ReturnedItemDetail whereReturnedItemId($value)
 * @method static \Illuminate\Database\Eloquent\Builder|ReturnedItemDetail whereUpdatedAt($value)
 * @method static \Illuminate\Database\Eloquent\Builder|ReturnedItemDetail whereWarehouseId($value)
 */
	class IdeHelperReturnedItemDetail extends \Eloquent {}
}

namespace App\Models{
/**
 * App\Models\Sale
 *
 * @mixin IdeHelperSale
 * @property int $id
 * @property string $code
 * @property string $sale_date
 * @property int $client_id
 * @property string $sub_total
 * @property string|null $total_discount
 * @property string|null $transport_cost
 * @property string $grand_total
 * @property string $total_paid
 * @property string $total_due
 * @property string $payment_method
 * @property string $payment_status
 * @property string|null $note
 * @property \Illuminate\Support\Carbon|null $created_at
 * @property \Illuminate\Support\Carbon|null $updated_at
 * @property-read \App\Models\Client $client
 * @property-read \Illuminate\Database\Eloquent\Collection|\App\Models\SaleDetail[] $salesDetails
 * @property-read int|null $sales_details_count
 * @method static \Database\Factories\SaleFactory factory(...$parameters)
 * @method static \Illuminate\Database\Eloquent\Builder|Sale newModelQuery()
 * @method static \Illuminate\Database\Eloquent\Builder|Sale newQuery()
 * @method static \Illuminate\Database\Eloquent\Builder|Sale query()
 * @method static \Illuminate\Database\Eloquent\Builder|Sale whereClientId($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Sale whereCode($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Sale whereCreatedAt($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Sale whereGrandTotal($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Sale whereId($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Sale whereNote($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Sale wherePaymentMethod($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Sale wherePaymentStatus($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Sale whereSaleDate($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Sale whereSubTotal($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Sale whereTotalDiscount($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Sale whereTotalDue($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Sale whereTotalPaid($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Sale whereTransportCost($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Sale whereUpdatedAt($value)
 */
	class IdeHelperSale extends \Eloquent {}
}

namespace App\Models{
/**
 * App\Models\SaleDetail
 *
 * @mixin IdeHelperSaleDetail
 * @property int $id
 * @property int $sale_id
 * @property int $product_id
 * @property float $qty
 * @property string $unit_price
 * @property string|null $single_discount
 * @property string $single_total
 * @property \Illuminate\Support\Carbon|null $created_at
 * @property \Illuminate\Support\Carbon|null $updated_at
 * @property-read \App\Models\Product $products
 * @method static \Database\Factories\SaleDetailFactory factory(...$parameters)
 * @method static \Illuminate\Database\Eloquent\Builder|SaleDetail newModelQuery()
 * @method static \Illuminate\Database\Eloquent\Builder|SaleDetail newQuery()
 * @method static \Illuminate\Database\Eloquent\Builder|SaleDetail query()
 * @method static \Illuminate\Database\Eloquent\Builder|SaleDetail whereCreatedAt($value)
 * @method static \Illuminate\Database\Eloquent\Builder|SaleDetail whereId($value)
 * @method static \Illuminate\Database\Eloquent\Builder|SaleDetail whereProductId($value)
 * @method static \Illuminate\Database\Eloquent\Builder|SaleDetail whereQty($value)
 * @method static \Illuminate\Database\Eloquent\Builder|SaleDetail whereSaleId($value)
 * @method static \Illuminate\Database\Eloquent\Builder|SaleDetail whereSingleDiscount($value)
 * @method static \Illuminate\Database\Eloquent\Builder|SaleDetail whereSingleTotal($value)
 * @method static \Illuminate\Database\Eloquent\Builder|SaleDetail whereUnitPrice($value)
 * @method static \Illuminate\Database\Eloquent\Builder|SaleDetail whereUpdatedAt($value)
 */
	class IdeHelperSaleDetail extends \Eloquent {}
}

namespace App\Models{
/**
 * App\Models\Stock
 *
 * @mixin IdeHelperStock
 * @property int $id
 * @property float $qty
 * @property int $product_id
 * @property int $warehouse_id
 * @property \Illuminate\Support\Carbon|null $created_at
 * @property \Illuminate\Support\Carbon|null $updated_at
 * @property-read \App\Models\Product $products
 * @property-read \App\Models\Warehouse $warehouses
 * @method static \Database\Factories\StockFactory factory(...$parameters)
 * @method static \Illuminate\Database\Eloquent\Builder|Stock newModelQuery()
 * @method static \Illuminate\Database\Eloquent\Builder|Stock newQuery()
 * @method static \Illuminate\Database\Eloquent\Builder|Stock query()
 * @method static \Illuminate\Database\Eloquent\Builder|Stock whereCreatedAt($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Stock whereId($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Stock whereProductId($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Stock whereQty($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Stock whereUpdatedAt($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Stock whereWarehouseId($value)
 */
	class IdeHelperStock extends \Eloquent {}
}

namespace App\Models{
/**
 * App\Models\Supplier
 *
 * @mixin IdeHelperSupplier
 * @property int $id
 * @property string $name
 * @property string $phone
 * @property string $email
 * @property string $country
 * @property string $city
 * @property string $address
 * @property \Illuminate\Support\Carbon|null $created_at
 * @property \Illuminate\Support\Carbon|null $updated_at
 * @property-read \Illuminate\Database\Eloquent\Collection|\App\Models\Purchase[] $purchases
 * @property-read int|null $purchases_count
 * @method static \Database\Factories\SupplierFactory factory(...$parameters)
 * @method static \Illuminate\Database\Eloquent\Builder|Supplier newModelQuery()
 * @method static \Illuminate\Database\Eloquent\Builder|Supplier newQuery()
 * @method static \Illuminate\Database\Eloquent\Builder|Supplier query()
 * @method static \Illuminate\Database\Eloquent\Builder|Supplier whereAddress($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Supplier whereCity($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Supplier whereCountry($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Supplier whereCreatedAt($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Supplier whereEmail($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Supplier whereId($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Supplier whereName($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Supplier wherePhone($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Supplier whereUpdatedAt($value)
 */
	class IdeHelperSupplier extends \Eloquent {}
}

namespace App\Models{
/**
 * App\Models\Transfer
 *
 * @mixin IdeHelperTransfer
 * @property int $id
 * @property string $code
 * @property string $transfer_date
 * @property int $from_warehouse_id
 * @property int $to_warehouse_id
 * @property string|null $note
 * @property \Illuminate\Support\Carbon|null $created_at
 * @property \Illuminate\Support\Carbon|null $updated_at
 * @property-read \App\Models\Warehouse $from_warehouses
 * @property-read \App\Models\Warehouse $to_warehouses
 * @property-read \Illuminate\Database\Eloquent\Collection|\App\Models\TransferDetail[] $transferDetails
 * @property-read int|null $transfer_details_count
 * @method static \Database\Factories\TransferFactory factory(...$parameters)
 * @method static \Illuminate\Database\Eloquent\Builder|Transfer newModelQuery()
 * @method static \Illuminate\Database\Eloquent\Builder|Transfer newQuery()
 * @method static \Illuminate\Database\Eloquent\Builder|Transfer query()
 * @method static \Illuminate\Database\Eloquent\Builder|Transfer whereCode($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Transfer whereCreatedAt($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Transfer whereFromWarehouseId($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Transfer whereId($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Transfer whereNote($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Transfer whereToWarehouseId($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Transfer whereTransferDate($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Transfer whereUpdatedAt($value)
 */
	class IdeHelperTransfer extends \Eloquent {}
}

namespace App\Models{
/**
 * App\Models\TransferDetail
 *
 * @mixin IdeHelperTransferDetail
 * @property int $id
 * @property int $transfer_id
 * @property int $product_id
 * @property float $qty
 * @property \Illuminate\Support\Carbon|null $created_at
 * @property \Illuminate\Support\Carbon|null $updated_at
 * @property-read \App\Models\Product $products
 * @property-read \App\Models\Transfer $transfers
 * @method static \Database\Factories\TransferDetailFactory factory(...$parameters)
 * @method static \Illuminate\Database\Eloquent\Builder|TransferDetail newModelQuery()
 * @method static \Illuminate\Database\Eloquent\Builder|TransferDetail newQuery()
 * @method static \Illuminate\Database\Eloquent\Builder|TransferDetail query()
 * @method static \Illuminate\Database\Eloquent\Builder|TransferDetail whereCreatedAt($value)
 * @method static \Illuminate\Database\Eloquent\Builder|TransferDetail whereId($value)
 * @method static \Illuminate\Database\Eloquent\Builder|TransferDetail whereProductId($value)
 * @method static \Illuminate\Database\Eloquent\Builder|TransferDetail whereQty($value)
 * @method static \Illuminate\Database\Eloquent\Builder|TransferDetail whereTransferId($value)
 * @method static \Illuminate\Database\Eloquent\Builder|TransferDetail whereUpdatedAt($value)
 */
	class IdeHelperTransferDetail extends \Eloquent {}
}

namespace App\Models{
/**
 * App\Models\Unit
 *
 * @mixin IdeHelperUnit
 * @property int $id
 * @property string $name
 * @property string $shortcut
 * @property \Illuminate\Support\Carbon|null $created_at
 * @property \Illuminate\Support\Carbon|null $updated_at
 * @method static \Database\Factories\UnitFactory factory(...$parameters)
 * @method static \Illuminate\Database\Eloquent\Builder|Unit newModelQuery()
 * @method static \Illuminate\Database\Eloquent\Builder|Unit newQuery()
 * @method static \Illuminate\Database\Eloquent\Builder|Unit query()
 * @method static \Illuminate\Database\Eloquent\Builder|Unit whereCreatedAt($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Unit whereId($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Unit whereName($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Unit whereShortcut($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Unit whereUpdatedAt($value)
 */
	class IdeHelperUnit extends \Eloquent {}
}

namespace App\Models{
/**
 * App\Models\Used
 *
 * @mixin IdeHelperUsed
 * @method static \Database\Factories\UsedFactory factory(...$parameters)
 * @method static \Illuminate\Database\Eloquent\Builder|Used newModelQuery()
 * @method static \Illuminate\Database\Eloquent\Builder|Used newQuery()
 * @method static \Illuminate\Database\Eloquent\Builder|Used query()
 */
	class IdeHelperUsed extends \Eloquent {}
}

namespace App\Models{
/**
 * App\Models\User
 *
 * @mixin IdeHelperUser
 * @property int $id
 * @property string $name
 * @property string|null $designation
 * @property string $username
 * @property string $email
 * @property \Illuminate\Support\Carbon|null $email_verified_at
 * @property string $password
 * @property string|null $remember_token
 * @property \Illuminate\Support\Carbon|null $created_at
 * @property \Illuminate\Support\Carbon|null $updated_at
 * @property-read \Spatie\MediaLibrary\MediaCollections\Models\Collections\MediaCollection|\Spatie\MediaLibrary\MediaCollections\Models\Media[] $media
 * @property-read int|null $media_count
 * @property-read \Illuminate\Notifications\DatabaseNotificationCollection|\Illuminate\Notifications\DatabaseNotification[] $notifications
 * @property-read int|null $notifications_count
 * @property-read \Illuminate\Database\Eloquent\Collection|\Spatie\Permission\Models\Permission[] $permissions
 * @property-read int|null $permissions_count
 * @property-read \Illuminate\Database\Eloquent\Collection|\Spatie\Permission\Models\Role[] $roles
 * @property-read int|null $roles_count
 * @method static \Database\Factories\UserFactory factory(...$parameters)
 * @method static \Illuminate\Database\Eloquent\Builder|User newModelQuery()
 * @method static \Illuminate\Database\Eloquent\Builder|User newQuery()
 * @method static \Illuminate\Database\Eloquent\Builder|User permission($permissions)
 * @method static \Illuminate\Database\Eloquent\Builder|User query()
 * @method static \Illuminate\Database\Eloquent\Builder|User role($roles, $guard = null)
 * @method static \Illuminate\Database\Eloquent\Builder|User whereCreatedAt($value)
 * @method static \Illuminate\Database\Eloquent\Builder|User whereDesignation($value)
 * @method static \Illuminate\Database\Eloquent\Builder|User whereEmail($value)
 * @method static \Illuminate\Database\Eloquent\Builder|User whereEmailVerifiedAt($value)
 * @method static \Illuminate\Database\Eloquent\Builder|User whereId($value)
 * @method static \Illuminate\Database\Eloquent\Builder|User whereName($value)
 * @method static \Illuminate\Database\Eloquent\Builder|User wherePassword($value)
 * @method static \Illuminate\Database\Eloquent\Builder|User whereRememberToken($value)
 * @method static \Illuminate\Database\Eloquent\Builder|User whereUpdatedAt($value)
 * @method static \Illuminate\Database\Eloquent\Builder|User whereUsername($value)
 */
	class IdeHelperUser extends \Eloquent implements \Spatie\MediaLibrary\HasMedia {}
}

namespace App\Models{
/**
 * App\Models\Warehouse
 *
 * @mixin IdeHelperWarehouse
 * @property int $id
 * @property int $position
 * @property string $name
 * @property string $shortcut
 * @property string $icon
 * @property \Illuminate\Support\Carbon|null $created_at
 * @property \Illuminate\Support\Carbon|null $updated_at
 * @property-read \Illuminate\Database\Eloquent\Collection|\App\Models\Product[] $stocks
 * @property-read int|null $stocks_count
 * @method static \Database\Factories\WarehouseFactory factory(...$parameters)
 * @method static \Illuminate\Database\Eloquent\Builder|Warehouse newModelQuery()
 * @method static \Illuminate\Database\Eloquent\Builder|Warehouse newQuery()
 * @method static \Illuminate\Database\Eloquent\Builder|Warehouse query()
 * @method static \Illuminate\Database\Eloquent\Builder|Warehouse whereCreatedAt($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Warehouse whereIcon($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Warehouse whereId($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Warehouse whereName($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Warehouse wherePosition($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Warehouse whereShortcut($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Warehouse whereUpdatedAt($value)
 */
	class IdeHelperWarehouse extends \Eloquent {}
}

