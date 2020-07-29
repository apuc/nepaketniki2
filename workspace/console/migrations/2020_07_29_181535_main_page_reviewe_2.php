<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class MainPageReviewe2 extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('main_page_review', function($table) {
            $table->integer('tour_id')->unsigned();
            $table->foreign('tour_id')->references('id')->on('tour');
            $table->integer('priority');
        });;
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('main_page_review', function($table) {
            $table->dropColumn('tour_id');
        });
    }
}
