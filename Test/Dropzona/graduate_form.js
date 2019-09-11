jQuery(function ($) {

	var $form = $('#form');
	var $submit = $('#submit', $form);

	// --- Чек-бокс согласия на обработку ПДн ---------------------------------------------------------
	{
		$("#agreement").change(function() {
		    var $input = $(this);
		    if($input.prop("checked")){
		        $submit.removeAttr("disabled");
		        $submit.removeAttr("title");
		    } else {
		        $submit.attr("disabled", "disabled");
		        $submit.attr("title", "Необходимо дать согласие на обработку персональных данных");
		    }
		}).change();
	}

	// --- Overlay ---------------------------------------------------------------------------------
	{
		$('a#go').click( function(event){
			event.preventDefault();
			$('#overlay').fadeIn(400,
				function(){
					$('#modal_form')
						.css('display', 'block')
						.animate({opacity: 1, top: '50%'}, 200);
				});
		});
		$('#modal_close, #overlay').click( function(){
			$('#modal_form')
				.animate({opacity: 0, top: '45%'}, 200, function(){
						$(this).css('display', 'none');
						$('#overlay').fadeOut(400);
					}
				);
		});
	}

    // --- Google reCAPTCHA v2 ------------------------------------------------------------------------
    {
        $form.off('submit').on('submit', function () {
            if (!grecaptcha.getResponse()) {
                $.gritter.add({
                    title: 'Вы не заполнили поле "Я не робот!"',
                    text: 'Пройдите обязательную проверку роботом',
                    time: 3000,
                    class_name: 'gritter-error gritter-center'
                });
                return false; // возвращаем false и предотвращаем отправку формы
            }
        });
    }

	// --- Dropzone --------------------------------------------------------------------------------
    {
        Dropzone.autoDiscover = false;
        $('.photo').dropzone({
            url: '#',
            maxFilesize: 10,
            maxFiles: 3,
            autoProcessQueue: false,
            acceptedFiles: 'image/*',
            dictDefaultMessage: 'Выберите фотографию или перетащите ее сюда<br>(не более 3-х)<br /><i class="fa fa-picture-o"></i>',
            dictFileTooBig: 'Размер файла {{filesize}} Мб превышает допустимые {{maxFilesize}} Мб',
            dictInvalidFileType: 'Недопустимый тип файла',
            dictRemoveFile: 'Удалить',
            dictMaxFilesExceeded: 'Достигнут предел загружаемых файлов',
            init: function() {
                var dz = this;
                var fileCount = 0;

                this.on('addedfile', function(file) {
                    fileCount++;
                    if (fileCount <= dz.options.maxFiles) {
                        var usedInput = dz.hiddenFileInput;
                        // Обязательно добавляем через setTimeout, иначе Dropzone.js затрет своими элементами
                        setTimeout(() => {
                            $form.append($(usedInput)); // Добавляем скрытый input с файлом к форме
                            usedInput.name = "file[]";
                        }, 0);

                        // Добавляем кнопку удаления файла
                        var removeButton = Dropzone.createElement('<a class="remove" href="#"><i class="fa fa-times"></i></a>');
                        removeButton.addEventListener("click", function(e) {
                            e.preventDefault();
                            e.stopPropagation();
                            dz.removeFile(file); 	// Удаляем файл из предпросмотра
                            $(usedInput).remove();	// Удаляем связанный с ним input
                            fileCount--;
                        });
                        file.previewElement.appendChild(removeButton);
                    } else {
                        fileCount--;
                        $.gritter.add({
                            title: dz.options.dictMaxFilesExceeded,
                            text: 'Разрешено к загрузке не более ' + dz.options.maxFiles + ' файлов',
                            time: 3000,
                            class_name: 'gritter-error gritter-center'
                        });
                    }

                });

                this.on('maxfilesexceeded', function(file) {
                    this.removeFile(file);
                });
            }
        });

    }





});