<?php

use core\App;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class SectionImages extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        App::$db->schema->create('section_images', function (Blueprint $table) {
            $table->increments('id');

            $table->integer('section_id')->unsigned();
            $table->foreign('section_id')->references('id')->on('section');

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
        App::$db->schema->dropIfExists('section_images');
    }
}
