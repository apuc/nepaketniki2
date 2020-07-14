{assign var="url" value="{'date/'}{$model->id}"}

{core\DetailView::widget()->setParams($model, $options)->run()}