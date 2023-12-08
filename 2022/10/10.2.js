const fs = require("fs");
const helpers = require("../../../2016/helpers");

const solve = (input) => {
  let register = 1;
  let inputs = parseInput(input);
  let counter = 0;
  let row = Array.apply(null, Array(40)).map((_) => ({ value: "." }));
  const nextInput = (acc) => {
    if (counter == 40) {
      counter = 0;
      acc.push(row);
      row = Array.apply(null, Array(40)).map((_) => ({ value: "." }));
    }

    if (Math.abs(counter - register) <= 1) row[counter].value = "#";
    counter++;
    return acc;
  };
  const pixels = inputs.reduce((acc, input, count) => {
    acc = nextInput(acc);
    if (input != 0) {
      acc = nextInput(acc);
      register += input;
    }

    //  handles last loop not being handled
    if (count == inputs.length - 1) {
      acc = nextInput(acc);
    }

    return acc;
  }, []);
  const picture = helpers.displayBoard(pixels);

  return picture;
};

const parseInput = (input) => {
  return input.split("\n").map((x) => {
    const splits = x.split(" ");
    if (splits.length > 1) {
      return parseInt(splits[1]);
    } else {
      return 0;
    }
  });
};
res =
  "##..##..##..##..##..##..##..##..##..##..\n" +
  "###...###...###...###...###...###...###.\n" +
  "####....####....####....####....####....\n" +
  "#####.....#####.....#####.....#####.....\n" +
  "######......######......######......####\n" +
  "#######.......#######.......#######.....\n";
console.log(solve(fs.readFileSync(__dirname + "/10test.txt", "utf8")) == res);
console.log(solve(fs.readFileSync(__dirname + "/10.txt", "utf8")));
