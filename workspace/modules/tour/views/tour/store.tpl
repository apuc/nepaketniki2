{core\App::$breadcrumbs->addItem(['text' => 'Создание'])}
{*<div class="h1">{$h1}</div>*}

<div class="container">
    <form class="form-horizontal" name="create_form" id="create_form" method="post" action="/admin/tour/create">
        <div class="form-group">
            <label for="name">Название:</label>
            <input type="text" name="name" id="name" class="form-control" required="required" />
            <small id="nameMessage" class="form-text">{if isset($errors['name'])}{$errors['name']}{/if}</small>
        </div>
        <div class="form-group">
            <label for="front_date">Даты тура на главной странице:</label>
            <input type="text" name="front_date" id="front_date" class="form-control" />
            <small id="front_dateMessage" class="form-text">{if isset($errors['front_date'])}{$errors['front_date']}{/if}</small>
        </div>
        <div class="form-group">
            <label for="front_description">Описание тура на главной странице:</label>
            <input type="text" name="front_description" id="front_description" class="form-control" />
            <small id="front_descriptionMessage" class="form-text">{if isset($errors['front_description'])}{$errors['front_description']}{/if}</small>
        </div>
        <div class="form-group">
            <label for="front_places_remaining">Отсавшиеся места в туре на главной странице:</label>
            <input type="text" name="front_places_remaining" id="front_places_remaining" class="form-control" />
            <small id="front_places_remainingMessage" class="form-text">{if isset($errors['front_places_remaining'])}{$errors['front_places_remaining']}{/if}</small>
        </div>
        <div class="form-group">
            <label for="price">Цена тура на главной странице:</label>
            <input type="text" name="price" id="price" class="form-control" />
            <small id="priceMessage" class="form-text">{if isset($errors['price'])}{$errors['price']}{/if}</small>
        </div>
        <div class="form-group">
            {workspace\modules\elfinder\widgets\ElfinderBtnWidget::widget(['name' => 'image_id', 'label' => "Картинка тура на главной странице:", 'id' => "image_id"])->run()}
        </div>
        <div class="form-group">
            {workspace\modules\elfinder\widgets\ElfinderBtnWidget::widget(['name' => 'title_image_id', 'label' => "Картинка заголовка тура:", 'id' => "title_image_id"])->run()}
        </div>
        <div class="form-group">
            {workspace\modules\elfinder\widgets\ElfinderBtnWidget::widget(['name' => 'bg_image_id', 'label' => "Картинка фона тура:", 'id' => "bg_image_id"])->run()}
        </div>
        <div class="form-group">
            <label for="main_description">Описание на странице просмотра тура:</label>
            {workspace\modules\ckeditor\widgets\CkEditorWidget::widget(['name' => 'main_description', 'id' => 'text_editor_main_description'])->run()}
            <small id="main_descriptionMessage" class="form-text">{if isset($errors['main_description'])}{$errors['main_description']}{/if}</small>
        </div>
        <div class="form-group">
            <label for="difficulties_and_weather">Сложности и погода:</label>
            {workspace\modules\ckeditor\widgets\CkEditorWidget::widget(['name' => 'difficulties_and_weather', 'id' => 'text_editor_difficulties_and_weather'])->run()}
            <small id="difficulties_and_weatherMessage" class="form-text">{if isset($errors['difficulties_and_weather'])}{$errors['difficulties_and_weather']}{/if}</small>
        </div>
        <div class="form-group">
            <label for="amount_of_places">Количество мест:</label>
            <input type="text" name="amount_of_places" id="amount_of_places" class="form-control" />
            <small id="amount_of_placesMessage" class="form-text">{if isset($errors['amount_of_places'])}{$errors['amount_of_places']}{/if}</small>
        </div>
        <div class="form-group">
            <label for="visa">Виза:</label>
            <input type="text" name="visa" id="visa" class="form-control" />
            <small id="visaMessage" class="form-text">{if isset($errors['visa'])}{$errors['visa']}{/if}</small>
        </div>
        <div class="form-group">
            <label for="activities_title">Заголовок активностей:</label>
            <input type="text" name="activities_title" id="activities_title" class="form-control" />
            <small id="activities_titleMessage" class="form-text">{if isset($errors['activities_title'])}{$errors['activities_title']}{/if}</small>
        </div>
        <div class="form-group">
            <label for="amount_activities_items_1">Количество активностей в левом столбце:</label>
            <input type="text" name="amount_activities_items_1" id="amount_activities_items_1" class="form-control" />
            <small id="amount_activities_items_1Message" class="form-text">{if isset($errors['amount_activities_items_1'])}{$errors['amount_activities_items_1']}{/if}</small>
        </div>
        <div class="form-group">
            <label for="amount_activities_items_2">Количество активностей в правом столбце:</label>
            <input type="text" name="amount_activities_items_2" id="amount_activities_items_2" class="form-control" />
            <small id="amount_activities_items_2Message" class="form-text">{if isset($errors['amount_activities_items_2'])}{$errors['amount_activities_items_2']}{/if}</small>
        </div>
        <div class="form-group">
            <label for="reservation_title">Заголовок бронирования:</label>
            <input type="text" name="reservation_title" id="reservation_title" class="form-control" />
            <small id="reservation_titleMessage" class="form-text">{if isset($errors['reservation_title'])}{$errors['reservation_title']}{/if}</small>
        </div>
        <div class="form-group">
            <input type="submit" name="submit" id="submit_button" class="btn btn-dark" value="Подтвердить">
        </div>
    </form>
</div>