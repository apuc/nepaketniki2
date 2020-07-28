{assign var="url" value="{'reviews/'}{$model->id}"}
{core\App::$breadcrumbs->addItem(['text' => $model->tour->name, 'url' => $url])}

{core\DetailView::widget()->setParams($model, $options)->run()}