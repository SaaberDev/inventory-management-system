<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreatePurchaseDetailsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('purchase_details', function (Blueprint $table) {
            $table->id();
            $table->foreignId('purchase_id')->index()->constrained()->cascadeOnDelete();
            $table->foreignId('product_id')->index()->constrained();
            $table->foreignId('warehouse_id')->index()->constrained()->cascadeOnDelete();
            $table->float('qty', '10', '0')->default('0');
            $table->string('unit_price');
            $table->string('single_discount')->nullable();
            $table->string('single_total');
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
        Schema::dropIfExists('purchase_details');
    }
}
