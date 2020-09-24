<?php


namespace workspace\modules\business\models;


use Illuminate\Database\Eloquent\Model;

class BusinessImages extends Model
{
    public $fillable = ['business_id', 'image_id'];
    protected $table = "business_images";

    public function _save(int $business_id, int $image_id)
    {
        $this->business_id = $business_id;
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
    public function business()
    {
        return $this->belongsTo('workspace\modules\business\models\Business');
    }
}