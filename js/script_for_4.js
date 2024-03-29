var str = '';

function validate(evt) {
    var button = document.getElementById('button');
    var theEvent = evt || window.event;
    var key = theEvent.keyCode || theEvent.which;
    var el = document.getElementById('convertForm1');
    key = String.fromCharCode(key);
    str += key;

    var regex = /^\d+\.?\d{0,2}$/;
    if (!regex.test(str)) {
        theEvent.returnValue = false;
        str = el.value;

        if (theEvent.preventDefault) theEvent.preventDefault();
    }
    el.addEventListener('keydown', function (event) {
        if (event.keyCode === 8) { // BACKSPACE was pressed
            str = el.value;
        }
        if (event.keyCode === 46) { // DELETE was pressed
            str = el.value;
        }
    });

    button.onclick = convert;
}

function convert() {
    var conv1 = document.getElementById('convertForm1').value;
    var conv2 = document.getElementById('convertForm2');
    var res = conv1 / 2.205;

    if (conv1 === '') {
        res = '';
        conv2.value = res;
    } else {
        conv2.value = res.toFixed(3);
    }
}