<?php

use core\App;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class Tour extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        App::$db->schema->create('tour', function (Blueprint $table) {
            $table->increments('id');
            $table->string('name');
            $table->text('main_description');
            $table->text('front_description');
            $table->string('front_date');
            $table->string('front_places_remaining');
            $table->string('price');
            $table->text('difficulties_and_weather');
            $table->string('amount_of_places');
            $table->string('reservation_title');
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
        App::$db->schema->table('tour', function ($table) {
            $table->dropForeign(['image_id']);
        });
        App::$db->schema->dropIfExists('tour');
    }
}
