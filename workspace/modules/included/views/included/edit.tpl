{assign var="url" value="{'included/'}{$model->id}"}
{core\App::$breadcrumbs->addItem(['text' => $model->tour->name, 'url' => {$url}])}
<div class="h1">{$h1}</div>

<div class="container">
    <form class="form-horizontal" name="create_form" id="create_form" method="post" action="/admin/included/update/{$model->id}">
        <div class="form-group">
            <label for="tour_id">Тур:</label>
            <select class="form-control" name="tour_id" id="tour_id" >
                {foreach from=$tours item=item}
                    <option value="{$item->id}">{$item->name} {$item->price}</option>
                {/foreach}
            </select>
        </div>
        <div class="form-group">
            <label for="text">Текст:</label>
            <input type="text" name="text" id="text" class="form-control" required="required" value="{$model->text}"/>
            <small id="textMessage" class="form-text">{if isset($errors['text'])}{$errors['text']}{/if}</small>
        </div>
        <div class="form-group">
            <label for="column_side">Тур:</label>
            <select class="form-control" name="column_side" id="column_side">
                <option value="0">Левый столбец</option>
                <option value="1">Правый столбец</option>
            </select>
        </div>
        <div class="form-group">
            <input type="submit" name="submit" id="submit_button" class="btn btn-dark" value="Подтвердить">
        </div>
    </form>
</div>