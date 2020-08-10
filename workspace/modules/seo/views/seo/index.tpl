<div class="h1">{$h1}</div>
{*<a href="/admin/seo/create" class="btn btn-dark">Создать</a>*}
{core\GridView::widget()
->setParams($model, $options)
->deleteActionBtn('edit')
->deleteActionBtn('view')
->deleteActionBtn('delete')
->run()}