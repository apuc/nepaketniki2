<?php

use core\App;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class StaticPage extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        App::$db->schema->create('static_page', function (Blueprint $table) {
            $table->increments('id');

            $table->string('name', 255);
            $table->string('slug', 255);
            $table->longText('content')->nullable();
            $table->string('layout', 255)->nullable();
            $table->string('view', 255)->nullable();
            $table->tinyInteger('status');

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
        App::$db->schema->dropIfExists('static_page');
    }
}
