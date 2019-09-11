jQuery(function ($) {

    //change these if need to change qty or message:
    var characters = 255;
    var message = "Осталось <strong>{characters}</strong> символов.";

    $("#counter").append(message.replace("{characters}", characters));
    $("#text").keyup(function () {
        if ($(this).val().length > characters) {
            $(this).val($(this).val().substr(0, characters));
        }
        var remaining = characters - $(this).val().length;
        $("#counter").html(message.replace("{characters}", remaining));
        if (remaining <= 20) {
            $("#counter").css("color", "red");
        } else {
            $("#counter").css("color", "black");
        }
        return($("#text").val());
    });

    var $choice = $('input[name=choice]');
    var choice = $choice.val();

    var $text = $('#text');
    var $res = $('#res');
    var str;

    $text.on('input', function () {
        str = $text.val();
        $res.text(textChange(choice, str));
    });

    $choice.change(function () {
        choice = $choice.filter(':checked').val();
        str = $text.val();
        $res.text(textChange(choice, str));
    });

    var textChange = function (choice, str) {
        var result;
        switch (choice) {
            case '1':
                result = str[0].toUpperCase() + str.substring(1).toLocaleLowerCase();
                break;
            case '2':
                result = str.toLocaleLowerCase();
                break;
            case '3':
                result = str.toLocaleUpperCase();
                break;
            case '4':
                result = '';
                var f = true;
                for (let i = 0; i < str.length; i++) {
                    var ch = str[i];
                    if ((ch === ' ') || (ch === '\t') || (ch === '\n')) {
                        f = true;
                        result += ch;
                    } else {
                        if (f) {
                            result += ch.toLocaleUpperCase();
                        } else {
                            result += ch.toLocaleLowerCase();
                        }
                        f = false;
                    }
                }
                break;
            case '5':
                result = '';
                var fo = true;
                for (let i = 0; i < str.length; i++) {
                    var ch = str[i];
                    if ((ch === ' ') || (ch === '\t') || (ch === '\n')) {
                        fo = true;
                        result += ch;
                    } else {
                        if (fo) {
                            result += ch.toLocaleLowerCase();
                        } else {
                            result += ch.toLocaleUpperCase();
                        }
                        fo = false;
                    }
                }
                break;
            default:
                result = str;
        }
        return result;
    }


});