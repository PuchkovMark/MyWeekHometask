<link rel="stylesheet" type="text/css" href="/templates/elsu_style/graduate/graduate.css" />

<h6><span>Список зарегистрированных выпускников</span></h6>
<p class="center">по состоянию на {date}</p>
<hr/>
<div class="graduatelist" id="graduatelist">
    <ol>
        {graduate_list}
    </ol>
</div>


<script type="text/javascript">
    jQuery(function ($) {
        /*region Highslide */
        hs.maxHeight = 600;
        hs.align = 'center';
        hs.transitions = ['expand','crossfade'];
        hs.addSlideshow({
            interval: 3000,
            repeat: true,
            useControls: true,
            overlayOptions:{
                opacity: 0.75,
                position: 'bottom center',
                hideOnMouseOut: true
            }
        });
        /*endregion*/

        //region Настройка элементов страницы

        // Удаляем пустые (не заполненные пользователем) элементы
        $gl = $('#graduatelist');
        $('span', $gl).each(function(){
            if ($(this).text() == '') {
                $(this).parents('p').remove();
            }
        });


        //endregion


    });
</script>


