module.exports.displayBoard = (board) =>{
    var buffer = '';
    for (var i = 0; i < board.length; i++) {
        for (var x = 0; x < board[i].length; x++) {
            buffer += board[i][x].value;
        }
        buffer += '\n';
    }
    console.log(buffer);
}

module.exports.reverse = (s) => {
    return s.split("").reverse().join("");
}

module.exports.toFixed = (x) => {
    if (Math.abs(x) < 1.0) {
        var e = parseInt(x.toString().split('e-')[1]);
        if (e) {
            x *= Math.pow(10,e-1);
            x = '0.' + (new Array(e)).join('0') + x.toString().substring(2);
        }
    } else {
        var e = parseInt(x.toString().split('+')[1]);
        if (e > 20) {
            e -= 20;
            x /= Math.pow(10,e);
            x += (new Array(e+1)).join('0');
        }
    }
    return x;
}
