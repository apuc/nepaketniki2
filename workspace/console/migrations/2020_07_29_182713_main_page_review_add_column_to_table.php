<?php

use core\App;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class MainPageReviewAddColumnToTable extends Migration
{
    private $table = 'main_page_review';
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        App::$db->schema->table($this->table, function (Blueprint $table) {
            $is_tour_id_exist = App::$db->schema->hasColumn($this->table, 'tour_id');
            if (!$is_tour_id_exist) {
                // foreign key
                $table->integer('tour_id')->unsigned()->default(0);
            }
            $is_priority_exist = App::$db->schema->hasColumn($this->table, 'priority');
            if (!$is_priority_exist) {
                $table->integer('priority')->default(1);
            }
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
