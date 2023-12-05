const fs = require("fs");
const helpers = require("../2016/helpers");

const solve = (input) => {
    let register = 1
    let counter = 1
    let modKey = 20

    const handleNextInput = (acc) => {
        counter++
        if (counter == modKey) {
            modKey += 40
            acc.push(register * counter)
        }
        return acc
    }

    const signalStrengths = parseInput(input).reduce((acc, input) => {
        acc = handleNextInput(acc)

        if (input != 0) {
            register += input
            acc = handleNextInput(acc)
        }

        return acc
    }, [])

    return signalStrengths.reduce((acc, x) => {
        return acc + x
    }, 0)
};

const parseInput = (input) => {
    return input.split("\n").map(x => {
        const splits = x.split(" ")
        if (splits.length > 1) {
            return parseInt(splits[1])
        } else {
            return 0
        }
    })
}
console.log(solve(fs.readFileSync(__dirname + '/10test.txt', 'utf8')) == 13140);
console.log(solve(fs.readFileSync(__dirname + '/10.txt', 'utf8')));

