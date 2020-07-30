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
            <div class="header-nav">
                <a href="/">На главную</a>
                {include file='includes/nav_menu.tpl'}
            </div>
            {include file='includes/contacts.tpl'}
        </div>
        <div class="-single-tour-header__main">
            <div class="search-bar">
                <input type="text" value="как правильно отдыхать"/><span class="times"><i
                            class="fa fa-times"></i></span><i class="fa fa-search"></i>
                <div class="triangle"></div>
            </div>
            <h2 class="-single-tour-header__title">Там где детская мечта может стать явью</h2>
            <img class="-single-tour-header__balloon" src="../../../resources/images/balloon.png" alt=""/>
        </div>
        <div class="-single-tour-header__logo">
            <img src="../../../{$model->title_image->image}" alt=""/>
        </div>
        <p class="-single-tour-header__description">
            {$model->main_description}
        </p>
    </div>
</div>
<div class="-single-tour-info">
    <div class="-single-tour-info__dates">
        {foreach from=$model->dates item=item}
            <div class="-single-tour-info__date">{$item->dates}</div>
            <div class="-single-tour-info__placesLeft">{$item->remaining_places}</div>
        {/foreach}
    </div>
    <div class="-single-tour-info__text">
        <div class="-tours-visa"><img class="-tours-visa__image" src="../resources/images/visa.png" alt=""/>
            <div class="-tours-visa__text">
                {$model->visa}
            </div>
        </div>
        <div class="-single-tour-info__weather"><strong>Сложность поездки и погода: </strong><span>{$model->difficulties_and_weather}</span></div>
        <div class="-single-tour-info__places"><span>{$model->amount_of_places}</span></div>
    </div>
</div>
<div class="-single-tour-schedule">
    <img src="{$model->bg_image->image}" alt="" class="-single-tour-schedule__bg" />
{*    <img src="../../../resources/images/-single-tour-schedule-min-bg.png" alt="" class="-single-tour-schedule__bg--min" />*}
    <div class="-single-tour-schedule__column -single-tour-schedule__column--left">
        <div class="-single-tour-schedule__title--mobile">
            {$model->activities_title}
        </div>
        {for $i=0 to $model->amount_activities_items_1 - 1}
            <div class="-single-tour-schedule-item baselined">
                <img class="-single-tour-schedule__point"
                     src="../../../resources/images/-single-tour-schedule-point.png" alt=""/>
                <span>{$activities[$i]->feature}</span>
            </div>
        {/for}
    </div>
    <div class="-single-tour-schedule__column -single-tour-schedule__column--right">
        <div class="-single-tour-schedule__title">
            <h3>{$model->activities_title}</h3>
        </div>
        {for $i=$model->amount_activities_items_1 to $model->amount_activities_items_1 + $model->amount_activities_items_2 - 1}
            <div class="-single-tour-schedule-item baselined">
                <img class="-single-tour-schedule__point"
                     src="../../../resources/images/-single-tour-schedule-point.png" alt=""/>
                <span>{$activities[$i]->feature}</span>
            </div>
        {/for}
    </div>
</div>
<div class="-single-tour-plan">
    <h2 class="-single-tour-plan__title">План путешествия</h2>
    {for $i=0 to count($plan)-1}
{*    {foreach from=$plan item=item_plan}*}
        <div class="-single-tour-plan-item">
            <div class="-single-tour-plan-item__heading">
                <div class="-single-tour-plan-item__date"><img class=".-single-tour-plan-item__day-logo"
                                                               src="../../../resources/images/-single-tour-plan-day-{$model->plans[$i]->day}.png"
                                                               alt=""/>
                    <div class="-single-tour-plan-item__date-text">
                        {$model->plans[$i]->date}
{*                        {$item_plan->date}*}
                    </div>
                </div>
                <div class="-single-tour-plan-item__actions">
                    {$model->plans[$i]->description}
                    {*                    {$item_plan->description}*}
                </div>
            </div>
            <div class="-single-tour-plan-item__description">
                <div class="-single-tour-plan-item__description-item">{$model->plans[$i]->info}</div>
            </div>
            <div class="-single-tour-plan-item__photos">
                {if count($model->plans[$i]->images) <= 3}
                    <div class="-single-tour-plan-item__photos-wrapper">
                        <button class="-single-tour-plan-item__button" id="singleTourPlanPrevPage-{$i+1}"></button>
                        <div class="-single-tour-plan-item__photos" id="singleTourPlanPhotos-{$i+1}"></div>
                        <button class="-single-tour-plan-item__button -single-tour-plan-item__button--active" id="singleTourPlanNextPage-{$i+1}"></button>
                    </div>
                {/if}
{*                {for $j=0 to count($model->plans[$i]->images)-1}*}
{*                    <div class="-single-tour-plan-item__photos-item"><img class=".-single-tour-plan-item__photo"*}
{*                                                                          src="{$model->plans[$i]->images[$j]->image->image}"*}
{*                                                                          alt="Картинки плана дня"/></div>*}
{*                {/for}*}
            </div>
        </div>
    {/for}

{*    <div class="-single-tour-plan-item">*}
{*        <div class="-single-tour-plan-item__heading">*}
{*            <div class="-single-tour-plan-item__date"><img class=".-single-tour-plan-item__day-logo"*}
{*                                                           src="../../../resources/images/-single-tour-plan-day-1.png"*}
{*                                                           alt=""/>*}
{*                <div class="-single-tour-plan-item__date-text">*}
{*                    <p>7, 10 или 14 мая, четверг</p>*}
{*                    <p>(10 мая - воскресенье)</p>*}
{*                </div>*}
{*            </div>*}
{*            <div class="-single-tour-plan-item__actions">*}
{*                <p>Прилетаем в аэропорт Кайсери</p>*}
{*                <p>(из Киева и Москвы - в 10:25-10:35).</p>*}
{*            </div>*}
{*        </div>*}
{*        <div class="-single-tour-plan-item__description">*}
{*            <p class="-single-tour-plan-item__description-item">Заселяемся в наш шикарный бутик-отель с красивой*}
{*                террасой. Для нашего путешествия мы выбрали новейший и лучший отель в сердце Гёреме, с сауной и закрытым*}
{*                бассейном, расположенном в пещере. Отправляемся на обед-знакомство в уютный ресторанчик традиционной*}
{*                кухни, узнаем друг друга поближе за бокалом каппадокийского вина.</p>*}
{*            <p class="-single-tour-plan-item__description-item">После устроим прогулку по центру Гёреме, неспешно*}
{*                прогуляемся, прочувствуем неторопливую атмосферу городка, насладимся гранатовым фрешем &quot;to go&quot;.*}
{*                Не забываем, что нужно отдохнуть после перелета - в нашем распоряжении сауна и бассейн с подогревом в*}
{*                скале в нашем отеле.</p>*}
{*            <p class="-single-tour-plan-item__description-item">После заката отправляемся на ужин, где делимся*}
{*                впечатлениями о первом дне, любуемся панорамным видом на Гёреме и смотрим на специальную подачу*}
{*                традиционного турецкого блюда - кебаба. Ложимся пораньше, завтра нас ждёт главная цель поездки!</p>*}
{*        </div>*}
{*        <div class="-single-tour-plan-item__photos">*}
{*            <div class="-single-tour-plan-item__photos-item"><img class=".-single-tour-plan-item__photo"*}
{*                                                                  src="../../../resources/images/-single-tour-plan-1-1.png"*}
{*                                                                  alt=""/></div>*}
{*            <div class="-single-tour-plan-item__photos-item"><img class=".-single-tour-plan-item__photo"*}
{*                                                                  src="../../../resources/images/-single-tour-plan-1-3.png"*}
{*                                                                  alt=""/></div>*}
{*            <div class="-single-tour-plan-item__photos-item"><img class=".-single-tour-plan-item__photo"*}
{*                                                                  src="../../../resources/images/-single-tour-plan-1-4.png"*}
{*                                                                  alt=""/></div>*}
{*            <div class="-single-tour-plan-item__photos-item"><img class=".-single-tour-plan-item__photo"*}
{*                                                                  src="../../../resources/images/-single-tour-plan-1-5.png"*}
{*                                                                  alt=""/></div>*}
{*            <div class="-single-tour-plan-item__photos-item"><img class=".-single-tour-plan-item__photo"*}
{*                                                                  src="../../../resources/images/-single-tour-plan-1-6.png"*}
{*                                                                  alt=""/></div>*}
{*        </div>*}
{*    </div>*}
{*    <div class="-single-tour-plan-item">*}
{*        <div class="-single-tour-plan-item__heading">*}
{*            <div class="-single-tour-plan-item__date"><img class=".-single-tour-plan-item__day-logo"*}
{*                                                           src="../../../resources/images/-single-tour-plan-day-2.png"*}
{*                                                           alt=""/>*}
{*                <div class="-single-tour-plan-item__date-text">*}
{*                    <p>8, 11 или 15 мая, пятница</p>*}
{*                    <p>(11 мая - понедельник)</p>*}
{*                </div>*}
{*            </div>*}
{*            <div class="-single-tour-plan-item__actions">*}
{*                <p>Полет на воздушном шаре, посещение</p>*}
{*                <p>музеев и подземного города</p>*}
{*            </div>*}
{*        </div>*}
{*        <div class="-single-tour-plan-item__description">*}
{*            <p class="-single-tour-plan-item__description-item">Полет на воздушном шаре! Ради этого стоит встать в 4*}
{*                утра:) Перед полётом нас угостят чаем/кофе с печеньем. Сначала мы увидим, как мощный поток пламени*}
{*                надувает огромный шар - уже с этого зрелища начинается безумный восторг. Садимся в корзину и взлетаем в*}
{*                небо с сотнями других шаров одновременно. Каппадокия очень красива с высоты, а шары рядом создают особую*}
{*                сказку. Это незабываемое ощущение, которые вы однозначно запомните на всю оставшуюся жизнь.</p>*}
{*            <p class="-single-tour-plan-item__description-item">​После полёта мы выпьем бокал шампанского, получим*}
{*                памятный сертификат о полете и поедем на завтрак в наш отель.Мы летим в высокий сезон, вероятность*}
{*                отмены полёта из-за погодных условий очень низкая. Но если полет будет отменен, у нас с вами будут ещё*}
{*                два дополнительных рассвета для полёта.</p>*}
{*            <p class="-single-tour-plan-item__description-item">Затем отправимся на экскурсию в самые красивые места*}
{*                Каппадокии - Музей под открытым небом, Долину монахов, Долину голубей. Спустимся в подземный город,*}
{*                посмотрим как там жили несколько веков назад и узнаем о бытовых особенностях жизни в подземных городах.*}
{*                Мы выбрали нераскрученный и атмосферный подземный город, чтобы не толкаться рядом с другими туристами. В*}
{*                завершение экскурсии заедем в винный магазинчик на дегустацию местных сортов.</p>*}
{*        </div>*}
{*        <div class="-single-tour-plan-item__photos">*}
{*            <div class="-single-tour-plan-item__photos-item"><img class=".-single-tour-plan-item__photo"*}
{*                                                                  src="../../../resources/images/-single-tour-plan-2-1.png"*}
{*                                                                  alt=""/></div>*}
{*            <div class="-single-tour-plan-item__photos-item"><img class=".-single-tour-plan-item__photo"*}
{*                                                                  src="../../../resources/images/-single-tour-plan-2-2.png"*}
{*                                                                  alt=""/></div>*}
{*            <div class="-single-tour-plan-item__photos-item"><img class=".-single-tour-plan-item__photo"*}
{*                                                                  src="../../../resources/images/-single-tour-plan-2-3.png"*}
{*                                                                  alt=""/></div>*}
{*            <div class="-single-tour-plan-item__photos-item"><img class=".-single-tour-plan-item__photo"*}
{*                                                                  src="../../../resources/images/-single-tour-plan-2-4.png"*}
{*                                                                  alt=""/></div>*}
{*            <div class="-single-tour-plan-item__photos-item"><img class=".-single-tour-plan-item__photo"*}
{*                                                                  src="../../../resources/images/-single-tour-plan-2-5.png"*}
{*                                                                  alt=""/></div>*}
{*            <div class="-single-tour-plan-item__photos-item"><img class=".-single-tour-plan-item__photo"*}
{*                                                                  src="../../../resources/images/-single-tour-plan-2-6.png"*}
{*                                                                  alt=""/></div>*}
{*        </div>*}
{*    </div>*}
{*    <div class="-single-tour-plan-item">*}
{*        <div class="-single-tour-plan-item__heading">*}
{*            <div class="-single-tour-plan-item__date"><img class=".-single-tour-plan-item__day-logo"*}
{*                                                           src="../../../resources/images/-single-tour-plan-day-3.png"*}
{*                                                           alt=""/>*}
{*                <div class="-single-tour-plan-item__date-text">*}
{*                    <p>9, 12 или 16 мая, суббота</p>*}
{*                    <p>(12 мая - вторник)</p>*}
{*                </div>*}
{*            </div>*}
{*            <div class="-single-tour-plan-item__actions">*}
{*                <p>фотосессия на крыше и необычном</p>*}
{*                <p>ковровом магазине и море шопинга</p>*}
{*            </div>*}
{*        </div>*}
{*        <div class="-single-tour-plan-item__description">*}
{*            <p class="-single-tour-plan-item__description-item">Сегодня нас ждёт фотосессия на крыше нашего отеля, мы*}
{*                подобрали несколько платьев в пол, чтобы вы не беспокоились о нарядах. Шары пролетят прямо над террасой*}
{*                отеля и это зрелище не менее потрясающее, чем с высоты!</p>*}
{*            <p class="-single-tour-plan-item__description-item">​После завтрака отправимся в знаменитый магазин ковров,*}
{*                который разрывает Инстаграм! В смутное время, когда продажи ковров шли &quot;не очень&quot;,*}
{*                предприимчивый владелец лавки превратил ее в фотозону и теперь, чтобы попасть сюда, нужно заранее*}
{*                бронировать время, каждый день расписан по минутам. Обычно здесь не протолкнуться, поэтому мы специально*}
{*                бронируем место для нашей группы, чтобы вы смогли сделать желанные снимки. В нашем распоряжении все*}
{*                помещение без посторонних.</p>*}
{*            <p class="-single-tour-plan-item__description-item">Затем совершим шоппинг в турецких лавках: свежайший*}
{*                рахат лукум, пахлава, килограммы фисташек, стопки ковров, подсвечники ручной работы - каждый найдет*}
{*                здесь что-то для себя. Во второй половине дня отправимся на прогулку по Красной и Розовой долинам на*}
{*                квадроциклах.</p>*}
{*        </div>*}
{*        <div class="-single-tour-plan-item__photos">*}
{*            <div class="-single-tour-plan-item__photos-item"><img class=".-single-tour-plan-item__photo"*}
{*                                                                  src="../../../resources/images/-single-tour-plan-3-1.png"*}
{*                                                                  alt=""/></div>*}
{*            <div class="-single-tour-plan-item__photos-item"><img class=".-single-tour-plan-item__photo"*}
{*                                                                  src="../../../resources/images/-single-tour-plan-3-2.png"*}
{*                                                                  alt=""/></div>*}
{*            <div class="-single-tour-plan-item__photos-item"><img class=".-single-tour-plan-item__photo"*}
{*                                                                  src="../../../resources/images/-single-tour-plan-3-3.png"*}
{*                                                                  alt=""/></div>*}
{*            <div class="-single-tour-plan-item__photos-item"><img class=".-single-tour-plan-item__photo"*}
{*                                                                  src="../../../resources/images/-single-tour-plan-3-4.png"*}
{*                                                                  alt=""/></div>*}
{*            <div class="-single-tour-plan-item__photos-item"><img class=".-single-tour-plan-item__photo"*}
{*                                                                  src="../../../resources/images/-single-tour-plan-3-5.png"*}
{*                                                                  alt=""/></div>*}
{*            <div class="-single-tour-plan-item__photos-item"><img class=".-single-tour-plan-item__photo"*}
{*                                                                  src="../../../resources/images/-single-tour-plan-3-6.png"*}
{*                                                                  alt=""/></div>*}
{*        </div>*}
{*    </div>*}
{*    <div class="-single-tour-plan-item">*}
{*        <div class="-single-tour-plan-item__heading">*}
{*            <div class="-single-tour-plan-item__date"><img class=".-single-tour-plan-item__day-logo"*}
{*                                                           src="../../../resources/images/-single-tour-plan-day-4.png"*}
{*                                                           alt=""/>*}
{*                <div class="-single-tour-plan-item__date-text">*}
{*                    <p>10, 13 или 17 мая, воскресенье</p>*}
{*                    <p>(13 мая - среда)</p>*}
{*                </div>*}
{*            </div>*}
{*            <div class="-single-tour-plan-item__actions">*}
{*                <p>фотосессия на крыше и необычном</p>*}
{*                <p>ковровом магазине и море шопинга</p>*}
{*            </div>*}
{*        </div>*}
{*        <div class="-single-tour-plan-item__description">*}
{*            <p class="-single-tour-plan-item__description-item">Сегодня утром нас ждёт прогулка на лошадях. По пути мы*}
{*                ещё раз полюбуемся шарами возле Долины любви. А потом у нас будет немного свободного времени на*}
{*                повторный шоппинг, чашечку турецкого кофе или вкуснейшую пахлаву с фисташками.</p>*}
{*            <p class="-single-tour-plan-item__description-item">По дороге в аэропорт мы заедем в один из лучших*}
{*                ресторанов Каппадокии с панорамным видом, и после обеда отправимся домой с сотней фотографий на фоне*}
{*                воздушных шаров и долин и решим, где встретимся в следующий раз - на Бали, в Токио или на Мачу-Пикчу.*}
{*                Вылет в Киев в 18:10, в Москву - в 20:00.</p>*}
{*        </div>*}
{*        <div class="-single-tour-plan-item__photos">*}
{*            <div class="-single-tour-plan-item__photos-item"><img class=".-single-tour-plan-item__photo"*}
{*                                                                  src="../../../resources/images/-single-tour-plan-4-1.png"*}
{*                                                                  alt=""/></div>*}
{*            <div class="-single-tour-plan-item__photos-item"><img class=".-single-tour-plan-item__photo"*}
{*                                                                  src="../../../resources/images/-single-tour-plan-4-2.png"*}
{*                                                                  alt=""/></div>*}
{*            <div class="-single-tour-plan-item__photos-item"><img class=".-single-tour-plan-item__photo"*}
{*                                                                  src="../../../resources/images/-single-tour-plan-4-3.png"*}
{*                                                                  alt=""/></div>*}
{*            <div class="-single-tour-plan-item__photos-item"><img class=".-single-tour-plan-item__photo"*}
{*                                                                  src="../../../resources/images/-single-tour-plan-4-4.png"*}
{*                                                                  alt=""/></div>*}
{*            <div class="-single-tour-plan-item__photos-item"><img class=".-single-tour-plan-item__photo"*}
{*                                                                  src="../../../resources/images/-single-tour-plan-4-5.png"*}
{*                                                                  alt=""/></div>*}
{*            <div class="-single-tour-plan-item__photos-item"><img class=".-single-tour-plan-item__photo"*}
{*                                                                  src="../../../resources/images/-single-tour-plan-4-6.png"*}
{*                                                                  alt=""/></div>*}
{*        </div>*}
{*    </div>*}
</div>
<div class="-single-tour-includes">
    <h3 class="-single-tour-includes__title">В стоимость путешествия включено:</h3>
    <div class="-single-tour-includes__details">
        <div class="-single-tour-includes__column -single-tour-includes__column--left">
                {foreach from=$model->included item=item}
                {if $item->column_side eq 0}
                    <div class="-single-tour-schedule-item"><img class="-single-tour-schedule__point"*}
                                                                                 src="../resources/images/-single-tour-schedule-point.png"
                                                                                 alt=""/><span>{$item->text}</span>
                    </div>
                {/if}
                {/foreach}
        </div>
        <div class="-single-tour-includes__column -single-tour-includes__column--right">
            {foreach from=$model->included item=item}
            {if $item->column_side neq 0}
            <div class="-single-tour-schedule-item"><img class="-single-tour-schedule__point"
                                                         src="../resources/images/-single-tour-schedule-point.png"
                                                         alt=""/><span>{$item->text}</span>
            </div>
                {/if}
                {/foreach}
        </div>
    </div>
</div>
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
{*            <li>- авиаперелет (из Киева ~210 евро, из Москвы ~380 евро, из других городов поможем найти выгодные*}
{*                авиабилеты)*}
{*            </li>*}
{*            <li>- обеды и ужины (~15-30 евро за день)</li>*}
{*            <li>- страховка (~5-10 евро)</li>*}
{*            <li>- личные расходы, шоппинг, сувениры</li>*}
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
{*<div class="-single-tour-form">*}
{*    <div class="-single-tour-form__column -single-tour-form__column--wide">*}
{*        <h3 class="-single-tour-form__title">{$model->reservation_title}</h3>*}
{*        <p class="-single-tour-form__proposition">*}
{*            Смело заполняйте форму и жмите кнопку*}
{*            “Забронировать место” или напишите нам*}
{*            в <strong>Instagram</strong> в Direct (@nepaketniki), или в*}
{*            <strong>Telegram/WhatsApp/Viber</strong> по номеру*}
{*        <p class="-single-tour-form__number">+38 099 490 24 54</p>*}
{*        </p>*}
{*    </div>*}
{*    <form name="request-form" id="request-form" method="post">*}
{*        <div class="-single-tour-form__column -single-tour-form__column--thin">*}
{*            <div class="-single-tour-form__inputs">*}
{*                <div class="-single-tour-form__input">*}
{*                    <input id="name" name="name" type="text" placeholder="Введите имя"/>*}
{*                    <small id="nameMessage" class="schedule-form__news"></small>*}
{*                </div>*}
{*                <div class="-single-tour-form__input">*}
{*                    <input id="phone" name='phone' type="text" placeholder="Введите телефон"/>*}
{*                    <small id="phoneMessage" class="schedule-form__news"></small>*}
{*                </div>*}
{*                <div class="-single-tour-form__input">*}
{*                    <input id="email" name="email" type="email" placeholder="Введите емаил"/>*}
{*                    <small id="emailMessage" class="schedule-form__news"></small>*}
{*                </div>*}
{*                <input name="id" type="hidden" value=>*}
{*                <div class="-single-tour-form__button">*}
{*                    <button id="submit" name="submit" type="submit">Забронировать место</button>*}
{*                </div>*}
{*            </div>*}
{*        </div>*}
{*    </form>*}
{*</div>*}
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