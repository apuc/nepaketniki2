{assign var="url" value="{'plan/'}{$model->id}"}
{core\App::$breadcrumbs->addItem(['text' => $model->tour->name|cat: ', День '|cat: $model->day, 'url' => $url])}
<div class="h1">{$model->name}</div>

{core\DetailView::widget()->setParams($model, $options)->run()}