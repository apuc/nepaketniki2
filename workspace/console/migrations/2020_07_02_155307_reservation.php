<?php

use core\App;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class Reservation extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        App::$db->schema->create('reservation', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('tour_id')->unsigned();
            $table->foreign('tour_id')->references('id')->on('tour');
            $table->string('name');
            $table->string('phone');
            $table->string('email');
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
        App::$db->schema->table('reservation', function ($table) {
            $table->dropForeign(['tour_id']);
        });
        App::$db->schema->dropIfExists('reservation');
    }
}
