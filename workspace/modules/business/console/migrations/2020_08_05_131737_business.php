<?php

use core\App;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class Business extends Migration
{
    private $table = 'business';

    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        App::$db->schema->create($this->table, function (Blueprint $table) {
            $table->increments('id');
            $table->string('header')->nullable();
            $table->text('text_block_1')->nullable();
            $table->text('text_block_2');
            $table->text('text_block_3');
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
        App::$db->schema->table($this->table, function (Blueprint $table) {
            if (App::$db->schema->hasColumn($this->table, 'tour_id')) $table->dropColumn('tour_id');
            if (App::$db->schema->hasColumn($this->table, 'priority')) $table->dropColumn('tour_id');
        });
    }
}
