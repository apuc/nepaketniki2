<div class="h1">{$h1}</div>
<a href="/admin/additional_price/create" class="btn btn-dark">Создать</a>
{core\GridView::widget()->setParams($models, $options)->run()}