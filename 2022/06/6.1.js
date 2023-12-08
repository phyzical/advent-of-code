const fs = require("fs");
const helpers = require("../../../2016/helpers");

const solve = (input, size = 4) => {
  let i = 0;
  while (i < input.length - size) {
    let chars = input.slice(i, size + i).split("");
    let uniqueChars = helpers.uniqueChars(chars);

    if (chars.length == uniqueChars.length) {
      return i + size;
    }
    i++;
  }
};

console.log(solve("mjqjpqmgbljsphdztnvjfqwrcgsmlb") == 7);
console.log(solve("bvwbjplbgvbhsrlpgdmjqwftvncz") == 5);
console.log(solve("nppdvjthqldpwncqszvftbrmjlhg") == 6);
console.log(solve("nznrnfrfntjfmvfwmzdfjlvtqnbhcprsg") == 10);
console.log(solve("zcfzfwzzqfrljwzlrfnpqdbhtmscgvjw") == 11);

console.log(solve(fs.readFileSync(__dirname + "/6.txt", "utf8")));
