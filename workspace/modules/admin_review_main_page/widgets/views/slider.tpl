<div class="comments" id="comments">
    <h2 class="comments__title">Сомневаешься стоит ли путешествовать с нами? <br/> Тогда читай, что пишут о нас</h2>
    <div class="comments__pagination">
        <button class="comments__button" id="commentsPrevPage"></button><span class="comments__current-page"><span id="commentsCurrentPage"></span> из <span id="commentsPages"></span></span>
        <button class="comments__button comments__button--active" id="commentsNextPage"></button>
    </div>
    <div class="comments__list" id="commentsList" data-tour-id="{if isset($model->id)}{$model->id}{else}0{/if}"></div>
</div>