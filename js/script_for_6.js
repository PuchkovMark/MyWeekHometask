jQuery(function ($) {

    let $choice = $('input[name=choice]');
    let $num    = $('#num');
    let $res    = $('#res');

    $num.on('input', function () {
        $res.text($choice.val() * $num.val());
    });
    $choice.on('click', function () {
        if($num.val() !== ''){
            $res.text(this.value * $num.val());
        }
    });

});
