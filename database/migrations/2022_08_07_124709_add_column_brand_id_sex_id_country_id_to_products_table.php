<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('products', function (Blueprint $table) {
            $table->foreignId('brand_id')->default(1)->index()->constrained('brands')->after('preview_image');
            $table->foreignId('sex_id')->default(1)->index()->constrained('sex')->after('brand_id');
            $table->foreignId('country_id')->default(1)->index()->constrained('countries')->after('sex_id');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('products', function (Blueprint $table) {
            //
        });
    }
};
