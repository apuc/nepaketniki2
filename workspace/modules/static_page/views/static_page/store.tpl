{core\App::$breadcrumbs->addItem(['text' => 'Создание страницы'])}
{*<div class="h1">{$h1}</div>*}

<div class="container">
    <form class="form-horizontal" name="create_form" id="create_form" method="post" action="/admin/static_page/create">
        <div class="form-group">
            <label for="name">Название:</label>
            <input type="text" name="name" id="name" class="form-control" required="required" />
            <small id="nameMessage" class="form-text">{if isset($errors['name'])}{$errors['name']}{/if}</small>
        </div>
        <div class="form-group">
            <label for="date">Адрес:</label>
            <input type="text" name="slug" id="slug" class="form-control" required="required"/>
            <small id="slugMessage" class="form-text">{if isset($errors['slug'])}{$errors['slug']}{/if}</small>
        </div>
        <div class="form-group mt-3">
            <label for="text_editor_content">Контент:</label>
            {workspace\modules\ckeditor\widgets\CkEditorWidget::widget(['name' => 'content', 'id' => 'text_editor_content'])->run()}
            <small id="descriptionMessage" class="form-text">{if isset($errors['content'])}{$errors['content']}{/if}</small>
        </div>
        <div class="form-group">
            <label for="date">Шаблон:</label>
            <input type="text" name="layout" id="layout" class="form-control"/>
            <small id="layoutMessage" class="form-text">{if isset($errors['layout'])}{$errors['layout']}{/if}</small>
        </div>
        <div class="form-group">
            <label for="date">Вид:</label>
            <input type="text" name="view" id="view" class="form-control"/>
            <small id="viewMessage" class="form-text">{if isset($errors['view'])}{$errors['view']}{/if}</small>
        </div>
        <div class="form-group mt-3">
            <div class="form-check">
                <input class="form-check-input" type="radio" name="status" id="active" value="true" checked>
                <label class="form-check-label" for="active">
                    Активна
                </label>
            </div>
            <div class="form-check">
                <input class="form-check-input" type="radio" name="status" id="inactive" value="false">
                <label class="form-check-label" for="inactive">
                    Не активна
                </label>
            </div>
        </div>
        <div class="form-group">
            <label for="date">Title:</label>
            <input type="text" name="title" id="title" class="form-control"/>
            <small id="titleMessage" class="form-text">{if isset($errors['title'])}{$errors['title']}{/if}</small>
        </div>
        <div class="form-group">
            <label for="date">Keywords:</label>
            <input type="text" name="keywords" id="keywords" class="form-control"/>
            <small id="keywordsMessage" class="form-text">{if isset($errors['keywords'])}{$errors['keywords']}{/if}</small>
        </div>
        <div class="form-group">
            <label for="date">Description:</label>
            <input type="text" name="description" id="title" class="form-control"/>
            <small id="descriptionMessage" class="form-text">{if isset($errors['description'])}{$errors['description']}{/if}</small>
        </div>
        <div class="form-group">
            <input type="submit" name="submit" id="submit_button" class="btn btn-dark" value="Подтвердить">
        </div>
    </form>
</div>