{assign var="url" value="{'plan/'}{$model->id}"}
{assign var="image" value=""}
{core\App::$breadcrumbs->addItem(['text' => {$model->tour->name|cat: ', день '|cat: $model->day}, 'url' => {$url}])}
<div class="h1">{$h1} {$model->name}</div>

<div class="container">
    <form class="form-horizontal" name="create_form" id="create_form" method="post"
          action="/admin/plan/update/{$model->id}">
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
            <label for="name">День:</label>
            <input type="text" name="day" id="day" class="form-control" required="required" value="{$model->day}"/>
            <small id="dayMessage" class="form-text">{if isset($errors['day'])}{$errors['day']}{/if}</small>
        </div>
        <div class="form-group">
            <label for="date">Даты:</label>
            <input type="text" name="date" id="date" class="form-control" value="{$model->date}"/>
            <small id="dateMessage" class="form-text">{if isset($errors['date'])}{$errors['date']}{/if}</small>
        </div>
        <div class="form-group mt-3">
            <label for="text">Описание:</label>
            {workspace\modules\ckeditor\widgets\CkEditorWidget::widget(['name' => 'description', 'id' => 'text_editor_description', 'text' => {$model->description}])->run()}
            <small id="descriptionMessage"
                   class="form-text">{if isset($errors['description'])}{$errors['description']}{/if}</small>
        </div>
        <div class="form-group mt-3">
            <label for="text">Информация:</label>
            {workspace\modules\ckeditor\widgets\CkEditorWidget::widget(['name' => 'info', 'id' => 'text_editor_info', 'text' => {$model->info}])->run()}
            <small id="infoMessage" class="form-text">{if isset($errors['info'])}{$errors['info']}{/if}</small>
        </div>
        {for $i=1 to 6}
            {if isset($model->images[$i-1]->image->image)}
                {workspace\modules\elfinder\widgets\ElfinderBtnWidget::widget(['name' => 'images[]', 'label' => "Картинка {$i}:", 'id' => "_image_{$i}", 'value' => $model->images[{$i}-1]->image->image])->run()}
            {else}
                {workspace\modules\elfinder\widgets\ElfinderBtnWidget::widget(['name' => 'images[]', 'label' => "Картинка {$i}:", 'id' => "_image_{$i}", 'value' => ''])->run()}{/if}
        {/for}
        <div class="form-group">
            <input type="submit" name="submit" id="submit_button" class="btn btn-dark" value="Подтвердить">
        </div>
    </form>
</div>