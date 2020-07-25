{core\App::$breadcrumbs->addItem(['text' => 'Create'])}
{*<div class="h1">{$h1}</div>*}

<div class="container">
    <form class="form-horizontal" name="create_form" id="create_form" method="post" action="/admin/tour/create">
        <div class="form-group">
            <label for="name">Название:</label>
            <input type="text" name="name" id="name" class="form-control" required="required" />
        </div>
        <div class="form-group">
            <label for="front_date">Даты тура на главной странице:</label>
            <input type="text" name="front_date" id="front_date" class="form-control" />
        </div>
        <div class="form-group">
            <label for="front_description">Описание тура на главной странице:</label>
            <input type="text" name="front_description" id="front_description" class="form-control" />
        </div>
        <div class="form-group">
            <label for="front_places_remaining">Отсавшиеся места в туре на главной странице:</label>
            <input type="text" name="front_places_remaining" id="front_places_remaining" class="form-control" />
        </div>
        <div class="form-group">
            <label for="price">Цена тура на главной странице:</label>
            <input type="text" name="price" id="price" class="form-control" />
        </div>
        <div class="form-group">
            <label for="image_id">Картинка тура на главной странице:</label>
            <select class="form-control" name="image_id" id="image_id">
                {foreach from=$images item=item}
                    <option value="{$item->id}">{$item->image}</option>
                {/foreach}
            </select>
        </div>
        <div class="form-group">
            <label for="title_image_id">Картинка заголовка тура:</label>
            <select class="form-control" name="title_image_id" id="title_image_id">
                {foreach from=$images item=item}
                    <option value="{$item->id}">{$item->image}</option>
                {/foreach}
            </select>
        </div>
        <div class="form-group">
            <label for="bg_image_id">Картинка фона тура:</label>
            <select class="form-control" name="bg_image_id" id="bg_image_id">
                {foreach from=$images item=item}
                    <option value="{$item->id}">{$item->image}</option>
                {/foreach}
            </select>
        </div>
        <div class="form-group">
            <label for="main_description">Описание на странице просмотра тура:</label>
            {workspace\modules\ckeditor\widgets\CkEditorWidget::widget(['name' => 'main_description', 'id' => 'text_editor_main_description'])->run()}
        </div>
        <div class="form-group">
            <label for="difficulties_and_weather">Сложности и погода:</label>
            {workspace\modules\ckeditor\widgets\CkEditorWidget::widget(['name' => 'difficulties_and_weather', 'id' => 'text_editor_difficulties_and_weather'])->run()}
        </div>
        <div class="form-group">
            <label for="amount_of_places">Количество мест:</label>
            <input type="text" name="amount_of_places" id="amount_of_places" class="form-control" />
        </div>
        <div class="form-group">
            <label for="visa">Виза:</label>
            <input type="text" name="visa" id="visa" class="form-control" />
        </div>
        <div class="form-group">
            <label for="activities_title">Заголовок активностей:</label>
            <input type="text" name="activities_title" id="activities_title" class="form-control" />
        </div>
        <div class="form-group">
            <label for="amount_activities_items_1">Количество активностей в левом столбце:</label>
            <input type="text" name="amount_activities_items_1" id="amount_activities_items_1" class="form-control" />
        </div>
        <div class="form-group">
            <label for="amount_activities_items_2">Количество активностей в правом столбце:</label>
            <input type="text" name="amount_activities_items_2" id="amount_activities_items_2" class="form-control" />
        </div>
        <div class="form-group">
            <label for="reservation_title">Заголовок бронирования:</label>
            <input type="text" name="reservation_title" id="reservation_title" class="form-control" />
        </div>
        <div class="form-group">
            <input type="submit" name="submit" id="submit_button" class="btn btn-dark" value="Submit">
        </div>
    </form>
</div>