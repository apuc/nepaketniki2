<div class="-single-tour-header">
    <div class="container">
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
                <div class="menu__item"><a href="#travels">О нас</a></div>
                <div class="menu__item"><a href="#schedule">Расписание</a></div>
                <div class="menu__item"><a href="#comments">Отзывы</a></div>
                <div class="menu__item"><a href="/">Фотоотчёты</a></div>
                <div class="menu__item"><a href="/">Для бизнеса</a></div>
                <div class="menu__item"><a href="/">Контакты</a></div>
            </div>
        </div>
        <div class="header__nav-info" id="headerNavInfo">
            {include file='includes/nav_menu.tpl'}
            {include file='includes/contacts.tpl'}
        </div>
        <div class="-single-tour-header__main">
            <div class="search-bar">
                <input type="text" value="как правильно отдыхать"/><span class="times"><i
                            class="fa fa-times"></i></span><i class="fa fa-search"></i>
                <div class="triangle"></div>
            </div>
            <h2 class="-single-tour-header__title">{$model->title_text}</h2>
            <img class="-single-tour-header__balloon" src="../../../resources/images/balloon.png" alt=""/>
        </div>
        <div class="-single-tour-header__logo">
            <img src="../../../resources/{$model->title_image->image}" alt=""/>
        </div>
        <div class="-single-tour-header__description">
            <p>{$model->main_description}</p>
        </div>
    </div>
</div>
<div class="-single-tour-info">
    <div class="-single-tour-info__dates">
        {foreach from=$model->dates item=item}
            <div class="-single-tour-info__date">{$item->tour_dates}</div>
            <div class="-single-tour-info__placesLeft">{$item->remaining_places}</div>
        {/foreach}
    </div>
    <div class="-single-tour-info__text">
        <div class="-tours-visa"><img class="-tours-visa__image" src="../../../resources/images/visa.png" alt=""/>
            <div class="-tours-visa__text">
                {$model->visa}
            </div>
        </div>
        <div class="-single-tour-info__weather"><strong>Сложность поездки и погода: </strong><span>{$model->difficulties_and_weather}</span></div>
        <div class="-single-tour-info__places"><span>{$model->amount_of_places}</span></div>
    </div>
</div>
<div class="-single-tour-schedule">
    <img src="../../../resources/{$model->bg_image->image}" alt="" class="-single-tour-schedule__bg" />
    <div class="-single-tour-schedule__title">
        <h3>{$model->activities_title}</h3>
    </div>
    <div class="-single-tour-schedule__column -single-tour-schedule__column--left">
        <div class="-single-tour-schedule__title--mobile">
            <h3> {$model->activities_title} </h3>
        </div>
        {for $i=0 to $model->amount_activities_items_1 - 1}
            {if isset($activities[$i]->feature)}
                <div class="-single-tour-schedule-item baselined">
                    <img class="-single-tour-schedule__point"
                         src="../../../resources/images/-single-tour-schedule-point.png" alt=""/>
                    <span>{$activities[$i]->feature}</span>
                </div>
            {/if}
        {/for}
    </div>
    <div class="-single-tour-schedule__column -single-tour-schedule__column--right">
        {for $i=$model->amount_activities_items_1 to $model->amount_activities_items_1 + $model->amount_activities_items_2 - 1}
            {if isset($activities[$i]->feature)}
                <div class="-single-tour-schedule-item baselined">
                    <img class="-single-tour-schedule__point"
                         src="../../../resources/images/-single-tour-schedule-point.png" alt=""/>
                    <span>{$activities[$i]->feature}</span>
                </div>
            {/if}
        {/for}
    </div>
</div>
<div class="-single-tour-plan">
    {if count($plan) neq 0}
        <h2 class="-single-tour-plan__title">План путешествия</h2>
    {/if}
    {for $i=0 to count($plan)-1}
        <div class="-single-tour-plan-item">
            <div class="-single-tour-plan-item__heading">
                <div class="-single-tour-plan-item__date">
                    <img class=".-single-tour-plan-item__day-logo"
                         src="../../../resources/images/-single-tour-plan-day-{$model->plans[$i]->day}.png" alt=""/>
                    <div class="-single-tour-plan-item__date-text">
                        {$model->plans[$i]->date}
                    </div>
                </div>
                <div class="-single-tour-plan-item__actions">
                    {str_replace('&nbsp;', ' ', $model->plans[$i]->description)}
                </div>
            </div>
            <div class="-single-tour-plan-item__description">
                <div class="-single-tour-plan-item__description-item"> {str_replace('&nbsp;', ' ', $model->plans[$i]->info)}</div>
            </div>
                {if count($model->plans[$i]->images) neq 0}
                    <div class="-single-tour-plan-item__photos-wrapper">
                        <button class="-single-tour-plan-item__button" id="singleTourPlanPrevPage-{$model->plans[$i]->day}"></button>
                        <div class="-single-tour-plan-item__photos" id="singleTourPlanPhotos-{$model->plans[$i]->day}"></div>
                        <button class="-single-tour-plan-item__button -single-tour-plan-item__button--active" id="singleTourPlanNextPage-{$model->plans[$i]->day}"></button>
                    </div>
                {/if}
        </div>
    {/for}
</div>
{if count($model->included) neq 0}
    <div class="-single-tour-includes">
        <h3 class="-single-tour-includes__title">В стоимость путешествия включено:</h3>
        <div class="-single-tour-includes__details">
            <div class="-single-tour-includes__column -single-tour-includes__column--left">
                    {foreach from=$model->included item=item}
                        {if $item->column_side eq 0}
                            <div class="-single-tour-schedule-item">
                                <img class="-single-tour-schedule__point"
                                     src="../../../resources/images/-single-tour-schedule-point.png"
                                     alt=""/><span>{$item->text}</span>
                            </div>
                        {/if}
                    {/foreach}
            </div>
            <div class="-single-tour-includes__column -single-tour-includes__column--right">
                {foreach from=$model->included item=item}
                    {if $item->column_side neq 0}
                        <div class="-single-tour-schedule-item">
                            <img class="-single-tour-schedule__point"
                                 src="../../../resources/images/-single-tour-schedule-point.png"
                                 alt=""/><span>{$item->text}</span>
                        </div>
                    {/if}
                {/foreach}
            </div>
        </div>
    </div>
{/if}
{if count($model->sections) neq 0}
    <div class="-single-tour-customs">
        <div class="container">
            <div id="singleTourSection">
                <div class="-single-tour-plan">
                    {foreach from=$model->sections item=section}
                        <div class="-single-tour-custom-item">
                            <div class="-single-tour-custom-item__title"><h3>{$section->name}</h3></div>
                            <div class="-single-tour-custom-item__description"><p>{$section->text}</p></div>
                            <div class="-single-tour-section-item__photos-wrapper">
                                <button class="-single-tour-section-item__button" id="singleTourSectionPrevPage-{$section->id}"></button>
                                <div class="-single-tour-section-item__photos" id="singleTourSectionPhotos-{$section->id}"></div>
                                <button class="-single-tour-section-item__button -single-tour-section-item__button--active" id="singleTourSectionNextPage-{$section->id}"></button>
                            </div>
                        </div>
                    {/foreach}
                </div>
            </div>
        </div>
    </div>
{/if}


<div class="-single-tour-price">
    <div class="-single-tour-price__main">
        <p class="-single-tour-price__person"><strong>Стоимость тура за 1 человека:</strong></p>
        <div class="-single-tour-price__cost">
            <p>{$model->price}</p>
            <p><strong>835 евро</strong> - до 20 марта</p>
        </div>
        <div class="-single-tour-price__discount">
            <strong>Скидка 10 евро</strong>
            если бронируете путешествие
            вдвоём или втроём
        </div>
    </div>
    <div class="-single-tour-price__additional">
        <div class="-single-tour-price__payment">Дополнительно оплачиваются:</div>
        <ul>
            {foreach from=$model->additional_price item=item}
                <li>- {$item->text}</li>
            {/foreach}
        </ul>
        <div class="-single-tour-price__how-to">
            <h3>Как оплатить тур?</h3>
            <p>
                После бронирования места в путешествии необходимо
                внести предоплату в размере 350 евро. Оставшаяся часть
                оплачивается за 30 дней до поездки. <strong>Предоплата является
                    невозвратной.</strong> Мы бронируем отели и достопримечательности
                на нашу группу заранее, поэтому если у вас не получится поехать,
                мы сможем вернуть предоплату только если найдём на ваше
                место другого туриста.
            </p>
        </div>
    </div>
</div>
{workspace\modules\reservation\widgets\ReservationWidget::widget()->run()}
{workspace\modules\admin_review_main_page\widgets\Slider::widget()->run()}
<div class="footer">
    <div class="footer__container">
        <div class="footer__text"><span class="traveling-text">travelling</span>
            <p class="travel-format-text">Открой для себя новый <br/>формат путешествий</p>
        </div>
        <div class="footer__contact-info">
            {include file='../includes/contacts.tpl'}
            <div class="search-bar">
                <input type="text" value="Контакты Nepaketniki"/><span class="times"><i
                            class="fa fa-times"></i></span><i class="fa fa-search"></i>
                <div class="triangle"></div>
            </div>
        </div>
    </div>
</div>
{*<script src="../resources/js/handler_reserve_form.js"></script>*}