<li>
    <div class="controls" data-id="{id}">
        <div class="btn-group">
            <a href="#edit" data-id="{id}" class="btn" title="Редактировать"><i class="fa fa-pencil-square-o fa-lg green"></i></a>
            <a href="#public" data-id="{id}" data-public="{public}" class="btn public" title="Опубликовать"><i class="fa fa-eye fa-lg blue"></i></a>
            <a href="#remove" data-id="{id}" class="btn" title="Удалить"><i class="fa fa-remove fa-lg red"></i></a>
            <a href="#erasecache" class="btn" title="Очистить кэш"><i class="fa fa-eraser fa-lg red"></i></a>
        </div>
    </div>
    <p class="fio">{surname} {name} {patronymic}</p>
    <p>Год выпуска: <span>{year}</span></p>
    <p>Факультет / Институт: <span>{faculty}</span></p>
    <p>Специальность / Направление подготовки: <span>{speciality}</span></p>
    <p>Место работы: <span>{workPlace}</span></p>
    <p>E-mail: <span>{email}</span></p>
    <p class="wish">Пожелание университету в 100-летний юбилей: <span>{wish}</span></p>
    <div class="img-rounded">
        {photo}
    </div>
</li>