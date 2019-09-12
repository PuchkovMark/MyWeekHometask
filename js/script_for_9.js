var keys = document.querySelectorAll('#calculator span');
var operators = ['+', '-', 'x', '÷'];
var decimalAdded = false;

for (var i = 0; i < keys.length; i++) {
    keys[i].onclick = function (e) {

        let input = document.querySelector('.screen');
        let inputVal = input.innerHTML;
        let btnVal = this.innerHTML;
        let total;
        let lastChar = inputVal[inputVal.length - 1];

        if (btnVal === 'C') {
            input.innerHTML = '';
            decimalAdded = false;
        } else if (btnVal === '=') {
            var equation = inputVal;

            equation = equation.replace(/x/g, '*').replace(/÷/g, '/');

            if (operators.indexOf(lastChar) > -1 || lastChar === '.')
                equation = equation.replace(/.$/, '');

            if (equation) {
                total = eval(equation);
                if (total.toString().indexOf('.') !== -1)
                    total = total.toFixed(2);

                input.innerHTML = total;
            }

            decimalAdded = false;
        } else if (operators.indexOf(btnVal) > -1) {

            if (inputVal !== '' && operators.indexOf(lastChar) === -1)
                input.innerHTML += btnVal;

            else if (inputVal === '' && btnVal === '-')
                input.innerHTML += btnVal;

            if (operators.indexOf(lastChar) > -1 && inputVal.length > 1) {
                input.innerHTML = inputVal.replace(/.$/, btnVal);
            }

            decimalAdded = false;
        } else if (btnVal === '.') {
            if (!decimalAdded) {
                input.innerHTML += btnVal;
                decimalAdded = true;
            }
        } else {
            input.innerHTML += btnVal;
        }

        e.preventDefault();
    }
}