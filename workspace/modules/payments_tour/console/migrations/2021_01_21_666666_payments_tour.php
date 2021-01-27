<?php

use core\App;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class PaymentsTour extends Migration
{
    public function up()
    {
        App::$db->schema->create('payments_tour', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('tour_id')->unsigned();
            $table->foreign('tour_id')->references('id')->on('tour');
            $table->string('title', 255);
            $table->text('description');
        });
    }

    public function down()
    {
        App::$db->schema->dropIfExists('payments_tour');
    }
}
