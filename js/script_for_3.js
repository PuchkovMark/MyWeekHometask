var str = '';

function validate(evt) {
    var theEvent = evt || window.event;
    var key = theEvent.keyCode || theEvent.which;
    var el = document.getElementById('convertForm1');
    key = String.fromCharCode(key);
    str += key;
    console.log(key);
    console.log('str - "' + str + '"');
    var regex = /^\d+\.?\d{0,2}$/;
    if (!regex.test(str)) {
        theEvent.returnValue = false;
        //str = el.value;
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
    el.oninput = convert;
}

function convert() {
    var conv1 = document.getElementById('convertForm1').value;
    var res   =  conv1 * 1.609;

    if (conv1 === ''){
        res = '';
        document.getElementById('convertForm2').value = res;
    } else {
        document.getElementById('convertForm2').value = res.toFixed(3);
    }
}