<?php

use core\App;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class Section extends Migration
{
    private $table = 'section';

    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        App::$db->schema->create($this->table, function (Blueprint $table) {
            $table->increments('id');
            $table->string('name');
            $table->text('text');
            $table->integer('tour_id')->unsigned();
            $table->foreign('tour_id')->references('id')->on('tour');
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
        App::$db->schema->table($this->table, function ($table) {
            $table->dropForeign(['tour_id']);
        });
        App::$db->schema->dropIfExists($this->table);
    }
}
