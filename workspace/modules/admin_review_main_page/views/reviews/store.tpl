{core\App::$breadcrumbs->addItem(['text' => 'Создание'])}
<div class="h1">{$h1}</div></br>

<div class="container">
    <form class="form-horizontal" enctype="multipart/form-data" name="create_form" id="create_form" method="post" action="/admin/reviews/create">
        <div class="form-group">
            <label for="name">Имя:</label>
            <input type="text" name="name" id="name" class="form-control" required="required" />
            <small id="nameMessage" class="form-text">{if isset($errors['name'])}{$errors['name']}{/if}</small>
        </div>
        <div class="form-group">
            <label for="tour_id">Тур:</label>
            <select class="form-control" name="tour_id" id="tour_id">
                {foreach from=$tours item=item}
                    {if $item->id eq $model->id}
                        <option selected value="{$item->id}">{$item->name} {$item->price}</option>
                    {else}
                        <option value="{$item->id}">{$item->name} {$item->price}</option>
                    {/if}
                {/foreach}
            </select>
        </div>
        <div class="form-group">
            <label for="instagram_link">Инстаграм:</label>
            <input type="text" name="instagram_link" id="instagram_link" class="form-control" required="required"/>
            <small id="instagram_linkMessage" class="form-text">{if isset($errors['instagram_link'])}{$errors['instagram_link']}{/if}</small>
        </div>
        {workspace\modules\elfinder\widgets\ElfinderBtnWidget::widget(['name' => 'avatar', 'label' => 'Аватар:'])->run()}
        <div class="form-group mt-3">
            <label for="text">Отзыв:</label>
            {workspace\modules\ckeditor\widgets\CkEditorWidget::widget(['name' => 'text', 'id' => 'text_editor'])->run()}
            <small id="textMessage" class="form-text">{if isset($errors['text'])}{$errors['text']}{/if}</small>
        </div>
        <div class="form-group">
            <label for="priority">Приоритет:</label>
            <input type="text" name="priority" id="priority" class="form-control" required="required"/>
            <small id="priorityMessage" class="form-text">{if isset($errors['priority'])}{$errors['priority']}{/if}</small>
        </div>
        <div class="form-group">
            <input type="submit" name="submit" id="submit_button" class="btn btn-dark" value="Подтвердить">
        </div>
    </form>
</div>