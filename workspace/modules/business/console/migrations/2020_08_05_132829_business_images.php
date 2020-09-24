<?php

use core\App;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class BusinessImages extends Migration
{
    private $table = 'business_images';

    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        App::$db->schema->create($this->table, function (Blueprint $table) {
            $table->increments('id');
            $table->integer('business_id')->unsigned();
            $table->foreign('business_id')->references('id')->on('business');
            $table->integer('image_id')->unsigned();
            $table->foreign('image_id')->references('id')->on('image');
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
        App::$db->schema->table('business', function ($table) {
            $table->dropForeign(['business_id']);
        });
        App::$db->schema->table('business', function ($table) {
            $table->dropColumn(['business_id']);
        });
        App::$db->schema->table('image', function ($table) {
            $table->dropForeign(['image_id']);
        });

        App::$db->schema->dropIfExists($this->table);
    }
}
