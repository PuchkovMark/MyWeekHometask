<link rel="stylesheet" type="text/css" href="/templates/elsu_style/assets/css/jquery.gritter.min.css" />
<link rel="stylesheet" type="text/css" href="/templates/elsu_style/assets/css/dropzone.css" />
<link rel="stylesheet" type="text/css" href="/templates/elsu_style/graduate/graduate.css" />

[error]
<div class="alert alert-error">
	<h4>{titleW}</h4>
	<p>{bodyW}</p>
</div>
[/error]

<h6><span>Регистрация выпускника</span></h6>
<p>Елецкий государственный университет им. И.А. Бунина приглашает своих выпускников пройти регистрацию!</p>
<hr/>

<form id="form" action="" method="post" enctype="multipart/form-data">
	<div class="row">
		<div class="span8">
			<label for="surname">Фамилия:</label><br />
			<input type="text" id="surname" name="surname" class="span8" value='{surname}' required><br />
			<label for="name">Имя:</label><br />
			<input type="text" name="name" id="name" class="span8" value='{name}' required><br />
			<label for="patronymic">Отчество:</label><br />
			<input type="text" name="patronymic" id="patronymic" class="span8" value='{patronymic}'><br/>
			<label for="year">Год окончания ВУЗа:</label><br />
			<input type="number" name="year" id="year" min="1950" max="2019" class="span4" value='{year}' required><br/>
		</div>
		<div class="span4">
			<div id="dropzone" class="photo dropzone"></div>
		</div>
	</div>
	<div class="row">
		<div class="span12">
			<label for="faculty">Факультет / Институт:</label><br />
			<input type="text" name="faculty" id="faculty" class="span12" value='{faculty}' ><br/>
			<label for="speciality">Специальность / Направление подготовки:</label><br />
			<input type="text" name="speciality" id="speciality" class="span12" value='{speciality}' ><br/>
			<label for="workPlace">Место работы:</label><br />
			<input type="text" name="workPlace" id="workPlace" class="span12" value='{workPlace}'><br/>

			<label for="email">E-mail:</label><br />
			<input type="email" name="email" id="email" class="span12" value='{email}'><br/>

			<label for="wish">Пожелание университету в 100-летний юбилей:</label><br />
			<textarea name="wish" id="wish" class="span12" rows="5">{wish}</textarea><br/>


			<script src='https://www.google.com/recaptcha/api.js'></script>
			<div class="g-recaptcha" data-sitekey="6LcnEfwSAAAAAFcOZtke-vCf3xAAeqKP3yaXgkSY"></div>

			<hr/>
			<label>
				<input id="agreement" type="checkbox" name="agreement" value="yes"/> согласие на обработку персональных данных - <a id="go" href="#">прочитать</a>
			</label><br/>
			<button id="submit" name="submit" class="btn btn-info" type="submit" disabled><span>Зарегистрироваться</span></button>
			<input type="hidden" name="action" value="submit"/>
		</div>
	</div>

</form>

<div id="modal_form">
    <span id="modal_close">X</span>
    <h2 align="center">СОГЛАСИЕ<br />на обработку персональных данных</h2>
    <p align="justify">Настоящим в целях обеспечения соблюдения законов и иных нормативных правовых актов регистрирующийся даёт согласие ФГБОУ ВО &laquo;Елецкий государственный университет им. И.А. Бунина&raquo; (ИНН: 4821004595), расположенному по адресу: 399770, Липецкая обл., г. Елец, ул. Коммунаров, 28, на автоматизированную, а также без использования средств автоматизации обработку моих персональных данных, а именно совершение действий, предусмотренных пунктом 3 статьи 3 Федерального закона от 27.07.2006 № 152-ФЗ &laquo;О персональных данных&raquo;.<br />Перечень моих персональных данных, на обработку которых я даю согласие:</p>
    <ul>
        <li>фамилия, имя, отчество;</li>
        <li>год окончания университета;</li>
        <li>факультет / институт;</li>
        <li>специальность / направление подготовки;</li>
		<li>место работы;</li>
		<li>электронная почта.</li>
    </ul>
    <br />
    <p align="justify">Настоящее согласие действует со дня его подписания до дня отзыва в письменной форме.</p>
</div>

<div id="overlay"></div>

<script type="text/javascript" src="/templates/elsu_style/assets/js/jquery.gritter.min.js"></script>
<script type="text/javascript" src="/templates/elsu_style/assets/js/dropzone.js"></script>
<script type="text/javascript" src="/templates/elsu_style/graduate/graduate_form.js"></script>