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
{*            <input type="text" name="image_id" id="image_id" class="form-control" />*}
            <select class="form-control" name="image_id" id="image_id">
                {foreach from=$images item=item}
                    <option value="{$item->id}">{$item->image}</option>
                {/foreach}
            </select>
        </div>
        <div class="form-group">
            <div class="form-group">
                <label for="main_description">Описание на странице просмотра тура:</label>
                <input type="text" name="main_description" id="main_description" class="form-control" />
            </div>
            <label for="difficulties_and_weather">Сложности и погода:</label>
            <input type="text" name="difficulties_and_weather" id="difficulties_and_weather" class="form-control" />
        </div>
        <div class="form-group">
            <label for="amount_of_places">Количество мест:</label>
            <input type="text" name="amount_of_places" id="amount_of_places" class="form-control" />
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