jQuery(function ($) {

    var $choice = $('input[name=choice]');

    let $res = $('#res');
    let arr = [6632, 4545, 3565, 7943, 6883, 8643, 9742, 3465, 8753, 3240, 6732, 7630];

    $choice.click(function () {

        let a = document.getElementById("res").innerHTML;

        if (this.checked === true) {
            $res.text(parseInt(a) + arr[this.value - 1]);
        } else {
            $res.text(parseInt(a) - arr[this.value - 1]);
        }

        console.log(this.checked);
        console.log(arr[this.value - 1]);

    });

});