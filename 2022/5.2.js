const fs = require("fs");
const FiveOne = require("./5.1");

console.log(FiveOne.solve(fs.readFileSync(__dirname + "/5test.txt", "utf8"), true) == "MCD");
console.log(FiveOne.solve(fs.readFileSync(__dirname + '/5.txt', 'utf8'), true));

