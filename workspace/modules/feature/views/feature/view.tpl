{assign var="url" value="{'feature/'}{$model->id}"}

{core\DetailView::widget()->setParams($model, $options)->run()}