{core\App::$breadcrumbs->addItem(['text' => 'Create'])}
{*<div class="h1">{$h1}</div>*}

<div class="container">
    <form class="form-horizontal" enctype="multipart/form-data" name="create_form" id="create_form" method="post" action="/admin/reviews/create">
        <div class="form-group">
            <label for="name">Имя:</label>
            <input type="text" name="name" id="name" class="form-control" required="required" />
        </div>
        <div class="form-group">
            <label for="instagramLinks">Инстаграм:</label>
            <input type="text" name="instagramLinks" id="instagramLinks" class="form-control" required="required"/>
        </div>
        {workspace\modules\elfinder\widgets\ElfinderBtnWidget::widget(['name' => 'avatar'])->run()}
        <div class="form-group mt-3">
            <label for="text">Отзыв:</label>
            <textarea rows="8" name="text" id="text" class="form-control" required="required"></textarea>
        </div>
        <div class="form-group">
            <input type="submit" name="submit" id="submit_button" class="btn btn-dark" value="Submit">
        </div>
    </form>
</div>