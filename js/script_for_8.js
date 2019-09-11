var width  = document.getElementById('width');
var height = document.getElementById('height');
var res = document.getElementById('res');

width.onchange = function () {
    //
    if(height.value !== 'Выберите высоту'){
        res.innerText = parseInt(width.value) + parseInt(height.value);
    }
};
height.onchange = function () {
    //
    if(width.value !== 'Выберите ширину'){
        res.innerText = parseInt(width.value) + parseInt(height.value);
    }
};