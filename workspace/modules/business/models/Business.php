<?php


namespace workspace\modules\business\models;


use Illuminate\Database\Eloquent\Model;
use workspace\modules\business\requests\BusinessRequest;

class Business extends Model
{
    protected $table = "business";

    public $fillable = ['header', 'text_block_1', 'text_block_2', 'text_block_3'];


    public function _save(BusinessRequest $request)
    {
        $this->header = $request->header;
        $this->text_block_1 = $request->text_block_1;
        $this->text_block_2 = $request->text_block_2;
        $this->text_block_3 = $request->text_block_3;

        $this->save();
    }


    /**
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     */
    public function images()
    {
        return $this->hasMany('workspace\modules\business\models\BusinessImages');
    }
}