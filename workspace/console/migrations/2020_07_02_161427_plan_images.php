<?php

use core\App;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class PlanImages extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        App::$db->schema->create('plan_images', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('plan_id')->unsigned();
            $table->foreign('plan_id')->references('id')->on('plan');
            $table->integer('image_id')->unsigned();
            $table->foreign('image_id')->references('id')->on('image');
            $table->integer('tour_id')->unsigned();
            $table->foreign('tour_id')->references('id')->on('tour');
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
        App::$db->schema->table('plan_images', function ($table) {
            $table->dropForeign(['plan_id']);
        });
        App::$db->schema->table('plan_images', function ($table) {
            $table->dropForeign(['image_id']);
        });
        App::$db->schema->table('plan_images', function ($table) {
            $table->dropForeign(['tour_id']);
        });
        App::$db->schema->dropIfExists('plan_images');
    }
}
