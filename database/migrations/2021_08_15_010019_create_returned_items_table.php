<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateReturnedItemsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('returned_items', function (Blueprint $table) {
            $table->id();
            $table->foreignId('supplier_id')->nullable()->index()->constrained()->cascadeOnDelete();
            $table->foreignId('client_id')->nullable()->index()->constrained()->cascadeOnDelete();
            $table->string('return_date');
            $table->string('reason');
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
        Schema::dropIfExists('returned_items');
    }
}
