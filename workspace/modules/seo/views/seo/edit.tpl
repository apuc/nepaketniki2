{core\App::$breadcrumbs->addItem(['text' => 'Редактирование meta-тегов'])}
<div class="h1">{$h1}</div>

<div class="container mt-5">
    <form class="form-horizontal" name="create_form" id="create_form" method="post" action="/admin/seo/update/{$model->id}">
        <div class="form-group">
            <label for="date">Страница:</label>
            <input type="text" name="page" id="title" class="form-control" value="{$model->page}"/>
            <small id="pageMessage" class="form-text">{if isset($errors['page'])}{$errors['page']}{/if}</small>
        </div>
        <div class="form-group">
            <label for="date">Title:</label>
            <input type="text" name="title" id="title" class="form-control" value="{$model->title}"/>
            <small id="titleMessage" class="form-text">{if isset($errors['title'])}{$errors['title']}{/if}</small>
        </div>
        <div class="form-group">
            <label for="date">Keywords:</label>
            <input type="text" name="keywords" id="keywords" class="form-control" value="{$model->keywords}"/>
            <small id="keywordsMessage" class="form-text">{if isset($errors['keywords'])}{$errors['keywords']}{/if}</small>
        </div>
        <div class="form-group">
            <label for="date">Description:</label>
            <input type="text" name="description" id="title" class="form-control" value="{$model->description}"/>
            <small id="descriptionMessage" class="form-text">{if isset($errors['description'])}{$errors['description']}{/if}</small>
        </div>
        <div class="form-group">
            <input type="submit" name="submit" id="submit_button" class="btn btn-dark" value="Подтвердить">
        </div>
    </form>
</div>