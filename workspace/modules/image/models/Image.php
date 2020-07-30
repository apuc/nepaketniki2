<?php


namespace workspace\modules\image\models;


use Illuminate\Database\Eloquent\Model;

class Image extends Model
{
    protected $table = "image";

    public $fillable = ['image'];

    public function _save($image)
    {
        if (!stripos($image, 'resource')) $this->image = '/resources/' . $image;
        else $this->image = $image;
        $this->save();
    }
}