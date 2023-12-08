const fs = require("fs");
const helpers = require("../../../2016/helpers");

const solve = (input) => {
  const res = parseRows(input).reduce(findCommon, []).reduce(findSum, 0);
  return res;
};

const findCommon = (acc = [], { left, right }) => {
  let dupes = [];
  left.split("").forEach((x) => {
    if (right.indexOf(x) != -1) {
      dupes.push(x);
    }
  });
  if (dupes.length >= 1) acc.push(dupes[0]);
  return acc;
};

const findSum = (acc, common) => {
  return acc + helpers.alphabetArray().indexOf(common);
};

const parseRows = (input) => {
  return input.split("\n").map((x) => {
    return {
      left: x.slice(0, Math.floor(x.length / 2)),
      right: x.slice(Math.floor(x.length / 2)),
    };
  });
};

console.log(solve(fs.readFileSync(__dirname + "/3test.txt", "utf8")) == 157);
console.log(solve(fs.readFileSync(__dirname + "/3.txt", "utf8")));
