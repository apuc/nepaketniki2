<?php

use core\App;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class MainPageReviewAddColumnToTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        App::$db->schema->table('main_page_review', function (Blueprint $table) {
            $table->integer('tour_id')->unsigned()->default(0);
            $table->foreign('tour_id')->references('id')->on('tour');
            $table->integer('priority')->default(1);;
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        App::$db->schema->table('main_page_review', function (Blueprint $table) {
            $table->dropColumn('tour_id');
        });
    }
}
