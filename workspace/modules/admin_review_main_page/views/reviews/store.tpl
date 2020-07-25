{core\App::$breadcrumbs->addItem(['text' => 'Create'])}
{*<div class="h1">{$h1}</div>*}

<div class="container">
    <form class="form-horizontal" enctype="multipart/form-data" name="create_form" id="create_form" method="post" action="/admin/reviews/create">
        <div class="form-group">
            <label for="name">Имя:</label>
            <input type="text" name="name" id="name" class="form-control" required="required" />
            <small id="nameMessage" class="form-text">{if isset($errors['name'])}{$errors['name']}{/if}</small>
        </div>
        <div class="form-group">
            <label for="instagram_link">Инстаграм:</label>
            <input type="text" name="instagram_link" id="instagram_link" class="form-control" required="required"/>
            <small id="instagram_linkMessage" class="form-text">{if isset($errors['instagram_link'])}{$errors['instagram_link']}{/if}</small>
        </div>
        {workspace\modules\elfinder\widgets\ElfinderBtnWidget::widget(['name' => 'avatar', 'label' => 'Аватар:'])->run()}
        <div class="form-group mt-3">
            <label for="text">Отзыв:</label>
            <textarea rows="8" name="text" id="text" class="form-control" required="required"></textarea>
            <small id="textMessage" class="form-text">{if isset($errors['text'])}{$errors['text']}{/if}</small>
        </div>
        <div class="form-group">
            <input type="submit" name="submit" id="submit_button" class="btn btn-dark" value="Submit">
        </div>
    </form>
</div>