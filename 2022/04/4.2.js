const fs = require('fs');

const solve = (input) => {
    const res = parseRows(input).reduce(findAnyOverlaps, [])
    console.log(res)
    return res.length
}

const findAnyOverlaps = (acc = [], [[x1,x2],[y1,y2]]) => {
    if ((x2 >= y1 && y1 >= x1) || (y2 >= x1 && x1 >= y1)) {
        acc.push([[x1,x2],[y1,y2]])
    }
    return acc
}

const  parseRows = (input) => input.split("\n").map(x => x.split(",").map(y => y.split("-").map(parseFloat)))

console.log(solve(fs.readFileSync(__dirname + '/4test.txt', 'utf8')) == 4);
console.log(solve(fs.readFileSync(__dirname + '/4.txt', 'utf8')));
