<?php

use core\App;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddNullableBusiness extends Migration
{
    private $table = 'business';

    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        App::$db->schema->table($this->table, function (Blueprint $table) {
            $table->string('header')->nullable()->change();;
            $table->text('text_block_1')->nullable()->change();
            $table->text('text_block_2')->nullable()->change();
            $table->text('text_block_3')->nullable()->change();
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
            $table->string('header')->change();
            $table->text('text_block_1')->change();
            $table->text('text_block_2')->change();
            $table->text('text_block_3')->change();
        });
    }
}
