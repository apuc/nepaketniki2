{assign var="url" value="{'payments_tour/'}{$model->id}"}
{core\App::$breadcrumbs->addItem(['text' => $model->title, 'url' => {$url}])}
{core\App::$breadcrumbs->addItem(['text' => 'Редактирование'])}
<div class="h1">{$h1}</div>

<div class="container">
    <form class="form-horizontal" name="create_form" id="create_form" method="post">
        <div class="form-group">
            <label for="tour_id">Тур:</label>
            <select class="form-control" name="tour_id" id="tour_id">
                {foreach from=$tours item=item}
                    {if $item->id eq $model->tour_id}
                        <option selected value="{$item->id}">{$item->name} {$item->price}</option>
                    {else}
                        <option value="{$item->id}">{$item->name} {$item->price}</option>
                    {/if}
                {/foreach}
            </select>
        </div>
        <div class="form-group">
            <label for="title">Заголовок:</label>
            <input id="title" type="text" name="title"  class="form-control" required="required" value="{$model->title}" />
            <small id="textMessage" class="form-text">{if isset($errors['title'])}{$errors['title']}{/if}</small>
        </div>
        <div class="form-group">
            <label for="description">Текст:</label>
            {workspace\modules\ckeditor\widgets\CkEditorWidget::widget(['name' => 'description', 'id' => 'description', 'text' => {$model->description}])
            ->setType('v5_classic')->run()}
            <small id="textMessage" class="form-text">{if isset($errors['description'])}{$errors['description']}{/if}</small>
        </div>
        <input type="hidden" name="id" value="{$model->id}">
        <div class="form-group">
            <input type="submit" name="submit" id="submit_button" class="btn btn-dark" value="Подтвердить">
        </div>
    </form>
</div>