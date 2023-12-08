const fs = require("fs");
const partOne = require("./11.1.js");

console.log(partOne.solve(fs.readFileSync(__dirname + '/11test.txt', 'utf8'), 10000, false) == 2713310158);
// console.log(partOne.solve(fs.readFileSync(__dirname + '/11.txt', 'utf8'), 10000, false));


