<?php


namespace workspace\modules\section\models;


use Illuminate\Database\Eloquent\Model;

class SectionImages extends Model
{
    public $fillable = ['section_id', 'image_id'];
    protected $table = "section_images";

    public function _save(int $section_id, int $image_id)
    {
        $this->section_id = $section_id;
        $this->image_id = $image_id;

        $this->save();
    }

    /**
     * @return mixed.
     *
     */
    public function image()
    {
        return $this->belongsTo('workspace\modules\image\models\Image');
    }

    /**
     * @return mixed
     */
    public function section()
    {
        return $this->belongsTo('workspace\modules\section\models\Section');
    }
}