jQuery(function ($) {

    let $choice = $('input[name=choice]');
    let $num = $('#num');
    let $res = $('#res');

    let checked = $choice.val();

    $choice.on('click', function () {

        if ($num.val() !== '') {
            $res.text(this.value * $num.val());
        }
        checked = this.value;
    });

    $num.on('input', function () {
        $res.text(checked * $num.val());

        if ($num.val() === '') {
            $res.text('');
        }
    });
});