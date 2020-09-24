{assign var="url" value="{'included/'}{$model->id}"}
{core\App::$breadcrumbs->addItem(['text' => $model->tour->name, 'url' => $url])}
<div class="h1">{$model->tour->name}</div>

{core\DetailView::widget()->setParams($model, $options)->run()}