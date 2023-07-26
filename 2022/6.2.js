const fs = require("fs");
const helpers = require("../2016/helpers");

const solve = (input, size = 4) => {
    let i = 0
    while (i < input.length - size) {
        let chars = input.slice(i, size + i).split("")
        let uniqueChars = helpers.uniqueChars(chars)

        if (chars.length == uniqueChars.length) {
            return i + size
        }
        i++
    }
};

console.log(solve("mjqjpqmgbljsphdztnvjfqwrcgsmlb", 14) == 19);
console.log(solve("bvwbjplbgvbhsrlpgdmjqwftvncz", 14) == 23);
console.log(solve("nppdvjthqldpwncqszvftbrmjlhg", 14) == 23);
console.log(solve("nznrnfrfntjfmvfwmzdfjlvtqnbhcprsg", 14) == 29);
console.log(solve("zcfzfwzzqfrljwzlrfnpqdbhtmscgvjw", 14) == 26);

console.log(solve(fs.readFileSync(__dirname + '/6.txt', 'utf8'), 14));
