<?php

use core\App;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class Section extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        App::$db->schema->create('section', function (Blueprint $table) {
            $table->increments('id');

            $table->integer('tour_id')->unsigned();
            $table->foreign('tour_id')->references('id')->on('tour');

            $table->string('name', 255);
            $table->text('text');
            $table->integer('count_images')->default(6);
            $table->integer('priority')->default(1);

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
        App::$db->schema->dropIfExists('section');
    }
}
