<?php

namespace Database\Seeders;

use App\Models\Purchase;
use App\Models\PurchaseDetail;
use App\Models\Warehouse;
use Illuminate\Database\Seeder;

class PurchaseSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $warehouse = Warehouse::findOrFail(Warehouse::PURCHASE);

        $purchase_details = PurchaseDetail::factory()->count(3)->make();
        $subTotal = $purchase_details->sum('single_total');
        $transportCost = 10.00;
        $totalPaid = 100.00;

        $purchases = Purchase::factory()
            ->count(10)
            ->state([
                'sub_total' => $subTotal,
                'total_discount' => $this->totalDiscount($purchase_details),
                'transport_cost' => $transportCost,
                'grand_total' => ($subTotal + $transportCost),
                'total_paid' => $totalPaid,
                'total_due' => ($subTotal - $totalPaid),
            ])
            ->sequence(fn ($sequence) => [
                'code' => $warehouse->shortcut . str_pad(($sequence->index + 1), 5, '0', STR_PAD_LEFT)
            ])
            ->create()
        ;

        $purchases->each(function (Purchase $purchase) use ($purchase_details){
            $items = collect($purchase_details)->toArray();
            foreach ($items as $item) {
                $purchase->purchaseDetails()->create($item);
            }
        });
    }

    function totalDiscount($purchase_details)
    {
        $total_discount = [];
        foreach ($purchase_details as $purchase_inventory) {
            $single_total = ($purchase_inventory->quantity * $purchase_inventory->unit_price);
            $single_discount = (($purchase_inventory->single_discount / 100) * $single_total);
            return $total_discount[] = $single_discount;
        }
        return $total_discount;
    }
}
