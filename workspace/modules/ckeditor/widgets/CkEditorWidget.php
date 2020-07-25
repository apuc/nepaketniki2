<?php


namespace workspace\modules\ckeditor\widgets;


use core\Widget;

class CkEditorWidget extends Widget
{
    public $viewPath = '/modules/ckeditor/widgets/views/';

    protected $id = 'editor';
    protected $name = 'editorName';
    protected $text = '';

    public function run()
    {
        $this->view->registerJs('https://cdn.ckeditor.com/ckeditor5/20.0.0/classic/ckeditor.js');

        return $this->view->getTpl('editor.tpl', [
            'id' => $this->id,
            'name' => $this->name,
            'text' => $this->text
        ]);
    }

}