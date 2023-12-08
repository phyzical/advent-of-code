const fs = require('fs');

const solve = (input) => {
    const res = parseRows(input).reduce(findFullOverlaps, [])
    return res.length
}

const findFullOverlaps = (acc = [], [[x1,x2],[y1,y2]]) => {
    if ((x1 >= y1 && x2 <= y2) || (y1 >= x1 && y2 <= x2)) {
        acc.push([[x1,x2],[y1,y2]])
    }
    return acc
}

const  parseRows = (input) => input.split("\n").map(x => x.split(",").map(y => y.split("-").map(parseFloat)))

console.log(solve(fs.readFileSync(__dirname + '/4test.txt', 'utf8')) == 2);
console.log(solve(fs.readFileSync(__dirname + '/4.txt', 'utf8')));
