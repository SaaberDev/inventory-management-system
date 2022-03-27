<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateReturnedItemDetailsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('returned_item_details', function (Blueprint $table) {
            $table->id();
            $table->foreignId('returned_item_id')->nullable()->index()->constrained()->cascadeOnDelete();
            $table->foreignId('warehouse_id')->nullable()->index()->constrained()->cascadeOnDelete();
            $table->foreignId('product_id')->nullable()->index()->constrained()->cascadeOnDelete();
            $table->float('qty', '10', '0')->default('0');
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
        Schema::dropIfExists('returned_item_details');
    }
}
