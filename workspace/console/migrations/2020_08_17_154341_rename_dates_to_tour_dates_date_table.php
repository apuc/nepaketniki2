<?php

use core\App;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class RenameDatesToTourDatesDateTable extends Migration
{
    private $table = 'date';

    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        App::$db->schema->table($this->table, function (Blueprint $table) {
            $table->renameColumn('dates', 'tour_dates');
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
            $table->renameColumn('tour_dates', 'dates');
        });
    }
}
