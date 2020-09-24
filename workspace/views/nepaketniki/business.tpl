<div class="-about-header">
    <div class="menu" id="menu">
        <div class="menu__icon" id="menuIcon">
            <div class="squares">
                <div class="square"></div>
                <div class="square"></div>
                <div class="square"></div>
                <div class="square"></div>
                <div class="square"></div>
                <div class="square"></div>
                <div class="square"></div>
                <div class="square"></div>
                <div class="square"></div>
            </div>
        </div>
        <div class="menu__list" id="menuList">
            <div class="menu__item"><a href="/">Главная</a></div>
            <div class="menu__item"><a href="#travels">О нас</a></div>
            <div class="menu__item"><a href="#schedule">Расписание</a></div>
            <div class="menu__item"><a href="#comments">Отзывы</a></div>
            <div class="menu__item"><a href="/">Фотоотчёты</a></div>
            <div class="menu__item"><a href="/">Для бизнеса</a></div>
            <div class="menu__item"><a href="/">Контакты</a></div>
        </div>
    </div>
    <div class="container">
        <div class="header__nav-info" id="headerNavInfo">
            {include file='includes/nav_menu.tpl'}
            {include file='includes/contacts.tpl'}
        </div>
        <div class="-about-header__main">
            <div class="-about-header__text">
                <p class="-about-header__author-tours"><strong>Мы создаём авторские туры</strong> в самые красивые места нашей планеты - <br />Бали, Японию, Эльзас, Каппадокию. </p>
                <h2 class="-about-header__travel-format-text maxed">
                    {if isset($model->header)}{str_replace('&nbsp', ' ', $model->header)}{/if}
                </h2>
            </div>
            <div class="-about-header__traveling"><span class="traveling-text">travelling</span>
                <div class="search-bar">
                    <input type="text" value="как правильно отдыхать?"/><span class="times"><i class="fa fa-times"></i></span><i class="fa fa-search"></i>
                    <div class="triangle"></div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="-business">
    <div class="container">
        <div class="-business__text">
            {if isset($model->text_block_1)}{str_replace('&nbsp', ' ', $model->text_block_1)}{/if}
        </div>
        <div class="-business__text">
            {if isset($model->text_block_2)}{str_replace('&nbsp', ' ', $model->text_block_2)}{/if}
        </div>
        <div class="-business__text -business__text--wide">
            {if isset($model->text_block_3)}{str_replace('&nbsp', ' ', $model->text_block_3)}{/if}
        </div>
    </div>
</div>
<div class="-business-photos">
    <div class="container">
        <div class="-business-photos__masonry">
            <div class="grid">
                <div class="grid-sizer"></div>
                {if isset($model->images)}
                    {assign var=index value=1}
                    {foreach from=$model->images item=image}
                        {if $index <= $model->count_images}
                            {if $index eq 2}
                                <div class="grid-item grid-item--upper"><img src="{$image->image->image}" alt=""/></div>
                            {else}
                                <div class="grid-item"><img src="{$image->image->image}" alt=""/></div>
                            {/if}
                            {assign var=index value=$index+1}
                        {else}
                            {break}
                        {/if}
                    {/foreach}
                {/if}
            </div>
        </div>
    </div>
</div>
{workspace\modules\admin_review_main_page\widgets\Slider::widget()->run()}
<div class="footer">
    <div class="footer__container">
        <div class="footer__text"><span class="traveling-text">travelling</span>
            <p class="travel-format-text">Открой для себя новый <br />формат путешествий</p>
        </div>
        <div class="footer__contact-info">
            <div class="contacts">
                {include file='../includes/contacts.tpl'}
            </div>
            <div class="search-bar">
                <input type="text" value="Контакты Nepaketniki"/><span class="times"><i class="fa fa-times"></i></span><i class="fa fa-search"></i>
                <div class="triangle"></div>
            </div>
        </div>
    </div>
</div>