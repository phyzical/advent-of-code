const helpers = require("../helpers");

const fs = require("fs");

function solve(input) {
  let inputs = input.split("\n");
  let lastValue = 4294967295;
  let result = 0;
  while (inputs.length > 0) {
    let highestIndex = 0;
    let highest = 0;
    inputs.map((input, i) => {
      let low = parseInt(input.split("-")[0]);
      let high = parseInt(input.split("-")[1]);
      if (high > highest) {
        highestIndex = i;
        highest = high;
      }
    });
    let low = parseInt(inputs[highestIndex].split("-")[0]);
    let high = parseInt(inputs[highestIndex].split("-")[1]);
    let diff = lastValue - high - 1;
    // means theres an overlap
    if (diff < 0) {
      diff = 0;
      if (low < lastValue) {
        lastValue = low;
      }
    } else {
      lastValue = low;
    }
    result += diff;
    inputs.splice(highestIndex, 1);
  }
  return result;
}
console.log(solve(fs.readFileSync(__dirname + "/20.txt", "utf8")));
