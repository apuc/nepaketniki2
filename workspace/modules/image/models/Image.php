<?php


namespace workspace\modules\image\models;


use Illuminate\Database\Eloquent\Model;

class Image extends Model
{
    protected $table = "image";

    public $fillable = ['image'];

    public function _save(string $image)
    {
        if (!stripos($image, 'resource') AND strlen($image) !== 0) {
            $this->image = '/resources/' . $image;
        }
        else $this->image = $image;
        $this->save();
    }
}