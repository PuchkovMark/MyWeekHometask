<link rel="stylesheet" type="text/css" href="/templates/elsu_style/assets/css/jquery.gritter.min.css" />
<link rel="stylesheet" type="text/css" href="/templates/elsu_style/assets/css/sweetalert2.min.css" />
<link rel="stylesheet" type="text/css" href="/templates/elsu_style/graduate/graduate.css" />

<h6><span>Список зарегистрированных выпускников</span></h6>
<p class="center">по состоянию на {date}</p>
<hr/>

<div class="admin_panel">
    <div class="btn-group">
        <span id="regCount" class="btn"><i class="fa fa-user fa-lg green"></i>&nbsp;Зарегистрировано 100 человек</span>
        <a href="#filter" data-filter="public" class="btn" title="Скрыть опубликованные записи"><i class="fa fa-eye fa-lg blue"></i></a>
        <a href="#filter" data-filter="no-public" class="btn" title="Скрыть не опубликованные записи"><i class="fa fa-eye-slash fa-lg blue"></i></a>
        <a href="#" class="btn" title=""><i class="fa fa-remove fa-lg red"></i></a>
        <a href="#" class="btn" title=""><i class="fa fa-remove fa-lg red"></i></a>
        <a href="#erasecache" class="btn" title="Очистить кэш"><i class="fa fa-eraser fa-lg red"></i></a>
    </div>
</div>

<hr/>

<div class="graduatelist" id="graduatelist">
    <ol>
        {graduate_list}
    </ol>
</div>

<div id="modal_edit" class="modal hide fade">
    <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h3>Редактирование записи</h3>
    </div>
    <div class="modal-body">
        <p>One fine body…</p>
    </div>
    <div class="modal-footer">
        <a href="#" class="btn" data-dismiss="modal" >Закрыть</a>
        <a href="#" class="btn btn-primary">Сохранить</a>
    </div>
</div>


<script type="text/javascript">
    jQuery(function ($) {
        $gl = $('#graduatelist');

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

        //region Функции
        sendAction = function (action, id = -1) {
            url = 'http://www.elsu.ru/graduate/' + action;
            if (id > 0 ) url = url + '/' + id;

            var deferred = $.ajax(url, {type: 'POST', dataType: 'json'});
            return deferred.promise();
        }

        // msg = function (title, text, type='success') {
        //     $.gritter.add({
        //         title: title,
        //         text: text,
        //         time: 2000,
        //         class_name: 'gritter-' + type + ' gritter-center'
        //     });
        // }
        msg = function (title, text, type='success') {
            type = type || 'error';
            if (type == 'success') {
                background = '#dff0d8';
                confirmButtonClass = 'btn btn-success';
            } else {
                background = '#f2dede';
                confirmButtonClass = 'btn btn-danger';
            }
            swal({
                title: title,
                text: text,
                type: type,
                timer: 5000,
                background: background,
                allowOutsideClick: true,
                buttonsStyling: false,
                confirmButtonText: '&emsp;Ok&emsp;',
                confirmButtonClass: confirmButtonClass
            });

        }

        //endregion

        /*region Настраиваем панели кнопок */

        //region Кнопка скрытия записей
        $('a[href="#filter"]').off('click').on('click', function (e) {
            e.preventDefault();
            filter = $(this).data('filter');
            $('li.' + filter, $gl).toggleClass('hide');
            $el = $(this);
            $el.toggleClass('active');
            title = '';
            if ($el.hasClass('active')) {
                title = 'Отобразить ';
            } else {
                title = 'Скрыть ';
            }
            if (filter == 'no-public') title += 'не ';
            $el.attr('title', title + 'опубликованные записи');
        });
        //endregion


        //region Кнопка Редактировать
        $('a[href="#edit"]').off('click').on('click', function (e) {
            e.preventDefault();

            console.log('doEdit(' + $(this).data('id') + ')'); // TODO: удалить

            $modal_edit = $('#modal_edit');
            $modal_edit.modal();


        });
        //endregion



        //region Кнопка Опубликовать / Снять с публикации
        publicSwitch = function($el, public) {
            if (public) {
                $el.parents('li').removeClass('no-public').addClass('public');
                $el.find('i').removeClass('fa-eye').addClass('fa-eye-slash');
                $el.attr('title' ,'Снять с публикации');
            } else {
                $el.parents('li').removeClass('public').addClass('no-public');
                $el.find('i').removeClass('fa-eye-slash').addClass('fa-eye');
                $el.attr('title' ,'Опубликовать');
            }
            $el.data('public', public);
        }

        $('.public').each(function(){
            publicSwitch($(this), $(this).data('public'));

            $(this).off('click').on('click', function(e){
                e.preventDefault();
                $el = $(this);
                public = $(this).data('public');
                var action = 'public_off';
                if (!public) action = 'public_on';
                sendAction(action, $(this).data('id'))
                    .done(function(data){
                        if (public) {
                            publicSwitch($el, false);
                        } else {
                            publicSwitch($el, true);
                        }
                    })
                    .fail(function(data){
                        msg('Ошибка публикации записи', 'Произошла непредвиденная ошибка при публикации записи', 'error');
                    });
            });
        });
        //endregion

        //region Кнопка Удалить
        $('a[href="#remove"]').off('click').on('click', function (e) {
            e.preventDefault();
            var $el =  $(this).parents('li');
            var id = $(this).data('id');
            // Спрашиваем у пользователя, точно ли нужно удалять
            swal({
                title: "Внимание!",
                text: "Вы действительно хотите удалить запись?",
                type: "warning",
                timer: 10000,
                background:"#fcf8e3",
                allowOutsideClick: false,
                buttonsStyling: false,
                confirmButtonText: "Удалить",
                confirmButtonClass: "btn btn-warning",
                showCancelButton: true,
                focusCancel: true,
                cancelButtonText: "Отменить",
                cancelButtonClass: "btn"
            }).then(function() {
                sendAction('remove', id)
                    .done(function(data){
                        $el.remove();
                        msg('Удаление записи', 'Запись успешно удалена!');
                    })
                    .fail(function(data){
                        msg('Ошибка удаления записи', 'Произошла непредвиденная ошибка при удалении записи', 'error');
                    });

            }).catch(swal.noop);
        });
        //endregion

        //region Кнопка Очистить кэш
        $('a[href="#erasecache"]').off('click').on('click', function (e) {
            e.preventDefault();
            sendAction('erasecache')
                .done(function(data){
                    msg('Очистка кэша', 'Кэш успешно очищен!');
                })
                .fail(function(data){
                    msg('Ошибка очистки кэша', 'Произошла непредвиденная ошибка очистки кэша', 'error');
                });
        });
        //endregion

        /*endregion*/




        //region Настройка элементов страницы

        //region Удаляем пустые (не заполненные пользователем) элементы
        $('span', $gl).each(function(){
            if ($(this).text() == '') {
                $(this).parents('p').remove();
            }
        });//endregion

        //region Получаем и обновляем число зарегистрировавшихся
        sendAction('count')
            .done(function(data){
                console.log(JSON.stringify(data, null, '\t')); // TODO: удалить
                $('#regCount').html('<i class="fa fa-user fa-lg green"></i>&nbsp;Зарегистрировано ' + data.gr_reg_pf);
            })
            .fail(function(data){
                console.log('count fail');
            });

        //endregion

        //endregion



    });
</script>


<script type="text/javascript" src="/templates/elsu_style/assets/js/jquery.gritter.min.js"></script>
<script type="text/javascript" src="/templates/elsu_style/assets/js/sweetalert2.min.js"></script>