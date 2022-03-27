<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreatePurchasesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('purchases', function (Blueprint $table) {
            $table->id();
            $table->string('code')->unique()->index();
            $table->string('purchase_date');
            $table->foreignId('supplier_id')->constrained();
            $table->string('sub_total'); // difference (total - cost)
            $table->string('total_discount')->nullable(); // Sum of Item Discount
            $table->string('transport_cost')->nullable();
            $table->string('grand_total');
            $table->string('total_paid');
            $table->string('total_due');
            $table->string('payment_method');
            $table->string('payment_status');
            $table->string('note')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('purchases');
    }
}
