{assign var="url" value="{'tour/'}{$model->id}"}
{core\App::$breadcrumbs->addItem(['text' => $model->name, 'url' => {$url}])}
<div class="h1">{$h1} {$model->name}</div>

<div class="container">
    <form class="form-horizontal" name="create_form" id="create_form" method="post" action="/admin/tour/update/{$model->id}">
        <div class="form-group">
            <label for="tour_id">Тур:</label>
            <select class="form-control" name="name" id="name">
                {foreach from=$tours item=item}
                    {if $item->id eq $model->id}
                        <option selected value="{$item->name}">{$item->name} {$item->price}</option>
                    {else}
                        <option value="{$item->name}">{$item->name} {$item->price}</option>
                    {/if}
                {/foreach}
            </select>
        </div>
        <div class="form-group">
            <label for="front_date">Даты тура на главной странице:</label>
            <input type="text" name="front_date" id="front_date" class="form-control" value="{$model->front_date}" />
        </div>
        <div class="form-group">
            <label for="front_description">Описание тура на главной странице:</label>
            <textarea rows="7" name="front_description" id="front_description" class="form-control">{$model->front_description}</textarea>
        </div>
        <div class="form-group">
            <label for="front_places_remaining">Отсавшиеся места в туре на главной странице:</label>
            <input type="text" name="front_places_remaining" id="front_places_remaining" class="form-control" value="{$model->front_places_remaining}" />
        </div>
        <div class="form-group">
            <label for="price">Цена тура на главной странице:</label>
            <input type="text" name="price" id="price" class="form-control" value="{$model->price}" />
        </div>
        <div class="form-group">
            <label for="image_id">Картинка тура на главной странице:</label>
            <select class="form-control" name="image_id" id="image_id">
                {foreach from=$images item=item}
                    {if $item->id == $model->image_id}
                        <option selected value="{$item->id}">{$item->image}</option>
                    {else}
                        <option value="{$item->id}">{$item->image}</option>
                    {/if}
                {/foreach}
            </select>
        </div>
        <div class="form-group">
            <label for="title_image_id">Картинка заголовка тура:</label>
            <select class="form-control" name="title_image_id" id="title_image_id">
                {foreach from=$images item=item}
                    {if $item->id == $model->title_image_id}
                        <option selected value="{$item->id}">{$item->image}</option>
                    {else}
                        <option value="{$item->id}">{$item->image}</option>
                    {/if}
                {/foreach}
            </select>
        </div>
        <div class="form-group">
            <label for="bg_image_id">Картинка фона тура:</label>
            <select class="form-control" name="bg_image_id" id="bg_image_id">
                {foreach from=$images item=item}
                    {if $item->id == $model->bg_image_id}
                        <option selected value="{$item->id}">{$item->image}</option>
                    {else}
                        <option value="{$item->id}">{$item->image}</option>
                    {/if}
                {/foreach}
            </select>
        </div>
        <div class="form-group">
            <div class="form-group">
                <label for="main_description">Описание на странице просмотра тура:</label>
                <textarea rows="7" name="main_description" id="main_description" class="form-control">{$model->main_description}</textarea>
            </div>
            <label for="difficulties_and_weather">Сложности и погода:</label>
            <textarea rows="7" name="difficulties_and_weather" id="difficulties_and_weather" class="form-control">{$model->difficulties_and_weather}</textarea>
        </div>
        <div class="form-group">
            <label for="amount_of_places">Количество мест:</label>
            <input type="text" name="amount_of_places" id="amount_of_places" class="form-control" value="{$model->amount_of_places}" />
        </div>
        <div class="form-group">
            <label for="visa">Виза:</label>
            <input type="text" name="visa" id="visa" class="form-control" value="{$model->visa}" />
        </div>
        <div class="form-group">
            <label for="activities_title">Заголовок активностей:</label>
            <input type="text" name="activities_title" id="activities_title" class="form-control" value="{$model->activities_title}" />
        </div>
        <div class="form-group">
            <label for="amount_activities_items_1">Количество активностей в левом столбце:</label>
            <input type="text" name="amount_activities_items_1" id="amount_activities_items_1" class="form-control" value="{$model->amount_activities_items_1}" />
        </div>
        <div class="form-group">
            <label for="amount_activities_items_2">Количество активностей в правом столбце:</label>
            <input type="text" name="amount_activities_items_2" id="amount_activities_items_2" class="form-control" value="{$model->amount_activities_items_2}" />
        </div>
        <div class="form-group">
            <label for="reservation_title">Заголовок бронирования:</label>
            <input type="text" name="reservation_title" id="reservation_title" class="form-control" value="{$model->reservation_title}" />
        </div>
        <div class="form-group">
            <input type="submit" name="submit" id="submit_button" class="btn btn-dark" value="Подтвердить">
        </div>
    </form>
</div>