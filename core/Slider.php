<?php


namespace core;


class Slider extends Widget
{

    public function run()
    {
        //$this->view->registerJs('/resources/js/gridView.js', [], true);
        return '<div class="comments" id="comments">
            <h2 class="comments__title">Сомневаешься стоит ли путешествовать с нами? <br/> Тогда читай, что пишут о нас</h2>
            <div class="comments__pagination">
                <button class="comments__button" id="prevPage"></button><span class="comments__current-page"><span id=\'currentPage\'></span> из <span id=\'pages\'></span></span>
                <button class="comments__button comments__button--active" id="nextPage"></button>
            </div>
            <div class="comments__list" id="commentsList"></div>
        </div>';
    }
}