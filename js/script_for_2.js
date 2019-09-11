var execute_butt = document.getElementById('excute-butt');
var clear_butt   = document.getElementById('clear-butt');

execute_butt.onclick = function () {
    /*document.getElementById('res').value = '000000';*/
    var regex = /\s|,\s|\.\s*/;
    var text = document.getElementById('text');
    var res = document.getElementById('res');
    var result = text.value.toString().split(regex);
    console.log(result);
    var count = 0;
    var longestWord = '';
    for(let i = 0; i < result.length; i++){
        if(result[i].length > count){
            count = result[i].length;
            longestWord = result[i];
        }
        console.log(longestWord);
    }
    res.innerHTML = longestWord;

};
clear_butt.onclick = function () {
    var text = document.getElementById('text');
    text.value = '';
};