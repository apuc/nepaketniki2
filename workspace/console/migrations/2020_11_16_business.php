<?php

use core\App;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class Business extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        App::$db->schema->create('business', function (Blueprint $table) {
            $table->increments('id');

            $table->string('header', 255)->nullable();
            $table->text('text_block_1')->nullable();
            $table->text('text_block_2')->nullable();
            $table->text('text_block_3')->nullable();
            $table->integer('count_images')->default(6);

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
        App::$db->schema->dropIfExists('business');
    }
}
