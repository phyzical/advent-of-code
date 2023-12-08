const fs = require("fs");
const helpers = require("../../../2016/helpers");

const solve = (input) => {
  const res = parseRows(input).reduce(findCommon, []).reduce(findSum, 0);
  return res;
};

const findCommon = (acc = [], [first, second, third]) => {
  let dupes = [];
  first.split("").forEach((x) => {
    if (second.indexOf(x) != -1 && third.indexOf(x) != -1) {
      dupes.push(x);
    }
  });
  if (dupes.length >= 1) acc.push(dupes[0]);
  return acc;
};

const findSum = (acc, common) => {
  return acc + helpers.alphabetArray().indexOf(common);
};

const parseRows = (input) => helpers.chunkArray(input.split("\n"), 3);

console.log(solve(fs.readFileSync(__dirname + "/3test.txt", "utf8")) == 70);
console.log(solve(fs.readFileSync(__dirname + "/3.txt", "utf8")));
