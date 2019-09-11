var elem = document.getElementById('button');

elem.onclick = function () {

    var table = document.getElementById('MyTable');
    var usdCell = table.getElementsByClassName('usd');
    var rusCell = table.getElementsByClassName('rus');

    for (let i = 0; i < usdCell.length; i++) {
        //console.log(usdCell[i].innerHTML);
        rusCell[i].innerHTML = multy(usdCell[i].innerText, rusCell[i].innerText) + '₽';
        //rusCell.innerHTML = '';
        //rusCell.innerHTML = usdCell[i] * conv;
    }

};

function multy(x, y) {
    var conv = document.getElementById('convertForm1');
    y = x * conv.value;
    //console.log(y);
    return y;
}