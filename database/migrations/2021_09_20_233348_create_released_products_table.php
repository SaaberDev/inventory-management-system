<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateReleasedProductsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('released_products', function (Blueprint $table) {
            $table->id();
            $table->string('code')->index()->unique();
            $table->string('released_date');
            $table->foreignId('from_warehouse_id')->index()->constrained('warehouses')->cascadeOnDelete();
            $table->foreignId('product_id')->index()->constrained()->cascadeOnDelete();
            $table->unsignedBigInteger('product_type_id');
            $table->float('qty', '10', '0')->default('0');
            $table->mediumText('note')->nullable();
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
        Schema::dropIfExists('released_products');
    }
}
