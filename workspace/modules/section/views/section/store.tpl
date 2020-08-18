{core\App::$breadcrumbs->addItem(['text' => 'Создание'])}
{assign var=count_images value=6}
{if isset($new_count_images)}
    {$count_images=$new_count_images}
{/if}

<div class="h1">{$h1}</div></br>

<div class="container">
    <form class="form-horizontal" name="image_change_form" id="create_form" method="post" action="/admin/section/create">
        <div class="form-group">
            <label for="count_imagesMessage">Количество картинок:</label>
            <input type="text" name="count_images" id="header" class="form-control"
                   required="required" value="{$count_images}"/>
            <small id="count_imagesMessage" class="form-text">{if isset($errors['count_images'])}{$errors['count_images']}{/if}</small>
        </div>
        <div class="form-group">
            <input type="submit" name="submit_count_images" id="submit_button_count_images" class="btn btn-dark" value="Изменить количество картинок">
        </div>
    </form>
    <form class="form-horizontal" name="create_form" id="create_form" method="post" action="/admin/section/create">
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
            <label for="name">Заголовок:</label>
            <input type="text" name="name" id="name" class="form-control" required="required" />
            <small id="nameMessage" class="form-text">{if isset($errors['name'])}{$errors['name']}{/if}</small>
        </div>
        <div class="form-group">
            <label for="text">Текст</label>
            {workspace\modules\ckeditor\widgets\CkEditorWidget::widget(['name' => 'text', 'id' => 'text_editor'])->run()}
            <small id="textMessage" class="form-text">{if isset($errors['text'])}{$errors['text']}{/if}</small>
        </div>
        <div class="form-group">
            <label for="text">Приоритет</label>
            <input type="text" name="priority" id="priority" class="form-control" required="required"/>
            <small id="priorityMessage" class="form-text">{if isset($errors['priority'])}{$errors['priority']}{/if}</small>
        </div>
        {for $i=1 to $count_images}
            {workspace\modules\elfinder\widgets\ElfinderBtnWidget::widget(['name' => 'images[]', 'label' => "Картинка {$i}:", 'id' => "_image_{$i}"])->run()}
        {/for}
        <div class="form-group">
            <input type="submit" name="submit" id="submit_button" class="btn btn-dark" value="Подтвердить">
        </div>
    </form>
</div>