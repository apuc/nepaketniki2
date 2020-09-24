<?php


namespace workspace\modules\section\models;


use Illuminate\Database\Eloquent\Model;
use workspace\modules\section\requests\SectionRequest;

class Section extends Model
{
    public $fillable = ['name', 'text', 'tour_id', 'count_images', 'priority'];
    protected $table = "section";

    public function _save(SectionRequest $request)
    {
        $this->name = $request->name;
        $this->text = $request->text;
        $this->tour_id = $request->tour_id;
        $this->priority = $request->priority;

        $this->save();
    }

    public function _save_image_count(int $count)
    {
        $this->count_images = $count;

        $this->save();
    }

    public function images()
    {
        return $this->hasMany('workspace\modules\section\models\SectionImages');
    }

    public function tour()
    {
        return $this->belongsTo('workspace\modules\tour\models\Tour');
    }
}