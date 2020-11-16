<?php

use core\App;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class BusinessImages extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        App::$db->schema->create('business_images', function (Blueprint $table) {
            $table->increments('id');

            $table->integer('business_id')->unsigned();
            $table->foreign('business_id')->references('id')->on('business');

            $table->integer('image_id')->unsigned();
            $table->foreign('image_id')->references('id')->on('image');

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
        App::$db->schema->dropIfExists('business_images');
    }
}
