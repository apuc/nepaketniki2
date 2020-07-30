{assign var="url" value="{'plan/'}{$model->id}"}
{assign var="image" value=""}
{core\App::$breadcrumbs->addItem(['text' => $model->username, 'url' => {$url}])}
{core\App::$breadcrumbs->addItem(['text' => 'Edit'])}
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
            <input type="text" name="date" id="date" class="form-control" required="required" value="{$model->date}"/>
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
{*                {workspace\modules\elfinder\widgets\ElfinderBtnWidget::widget(['name' => 'images[]', 'label' => 'Картинка 1:', 'id' => '_image_1', 'value' => $model->images[0]->image->image])->run()}*}
{*                {workspace\modules\elfinder\widgets\ElfinderBtnWidget::widget(['name' => 'images[]', 'label' => 'Картинка 2:', 'id' => '_image_2', 'value' => $model->images[1]->image->image])->run()}*}
{*                {workspace\modules\elfinder\widgets\ElfinderBtnWidget::widget(['name' => 'images[]', 'label' => 'Картинка 3:', 'id' => '_image_3', 'value' => $model->images[2]->image->image])->run()}*}
{*                {workspace\modules\elfinder\widgets\ElfinderBtnWidget::widget(['name' => 'images[]', 'label' => 'Картинка 4:', 'id' => '_image_4', 'value' => $model->images[3]->image->image])->run()}      *}
{*                {workspace\modules\elfinder\widgets\ElfinderBtnWidget::widget(['name' => 'images[]', 'label' => 'Картинка 5:', 'id' => '_image_5', 'value' => $model->images[4]->image->image])->run()}*}
{*                {workspace\modules\elfinder\widgets\ElfinderBtnWidget::widget(['name' => 'images[]', 'label' => 'Картинка 6:', 'id' => '_image_6', 'value' => $model->images[5]->image->image])->run()}*}
        <div class="form-group">
            <input type="submit" name="submit" id="submit_button" class="btn btn-dark" value="Подтвердить">
        </div>
    </form>
</div>