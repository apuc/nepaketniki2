{assign var="url" value="{'date/'}{$model->id}"}
{core\App::$breadcrumbs->addItem(['text' => $model->tour->name, 'url' => $url])}

{core\DetailView::widget()->setParams($model, $options)->run()}