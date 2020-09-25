{assign var="url" value="{'admin/tour/'}{$model->id}"}
{core\App::$breadcrumbs->addItem(['text' => $model->name, 'url' => $url])}
<div class="h1">{$model->name}</div>

{core\DetailView::widget()->setParams($model, $options)->run()}

<div class="h3">Планы на день <a href="/admin/plan/create" class="btn btn-outline-dark">Создать</a></div>
{core\GridView::widget()->setParams($plans, $plans_options)->run()}

<div class="h3">Особенности тура <a href="/admin/feature/create" class="btn btn-outline-dark">Создать</a></div>
{core\GridView::widget()->setParams($features, $features_options)->run()}

<div class="h3">Включено в тур <a href="/admin/included/create" class="btn btn-outline-dark">Создать</a></div>
{core\GridView::widget()->setParams($included, $included_options)->run()}

<div class="h3">Даты <a href="/admin/date/create" class="btn btn-outline-dark">Создать</a></div>
{core\GridView::widget()->setParams($dates, $dates_options)->run()}

<div class="h3">Доп. оплата <a href="/admin/additional_price/create" class="btn btn-outline-dark">Создать</a></div>
{core\GridView::widget()->setParams($additional_prices, $additional_prices_options)->run()}

<div class="h2">Разделы <a href="/admin/section/create" class="btn btn-outline-dark">Создать</a></div>
{core\GridView::widget()->setParams($sections, $sections_options)->run()}