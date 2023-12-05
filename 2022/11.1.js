const fs = require("fs");
const helpers = require("../2016/helpers");

const solve = (input, numRounds = 20, relief = true) => {
    const monkies = parseInput(input)
    const results = parseRounds(monkies, numRounds, relief)

    return calculateMonkeyBusiness(results.map(x => x.count))
};
module.exports.solve = solve

const calculateMonkeyBusiness = (results) => {
    results = results.sort((x, y) => y - x)
    // console.log(`${results[0]} * ${results[1]}`)
    return results[0] * results[1]
}


const parseRounds = (monkies, rounds = 20, relief = true) => {
    for (let i = 0; i < rounds; i++) {
        monkies = parseRound(monkies, relief)
        console.log(`round ${i + 1}`)
        // console.log(monkies)
    }
    return monkies
}
const parseRound = (monkies, relief) => {
    return monkies.map(monkey => {
        console.log(monkey.name)
        monkey.count += monkey.items.length

        while (monkey.items.length > 0) {
            console.log(monkey.items.length)
            const item = monkey.items.pop()
            const x = monkey.operation.x == "old" ? BigInt(item) : BigInt(monkey.operation.x)
            const y = monkey.operation.y == "old" ? BigInt(item) : BigInt(monkey.operation.y)
            let worry = item
            switch (monkey.operation.operation) {
                case "*":
                    worry = x * y
                    break;
                case "/":
                    worry = x / y
                    break;

                case "+":
                    worry = x + y
                    break;

                case "-":
                    worry = x - y
                    break;

            }
            // console.log(`${item} --> ${worry}`)
            if (relief) {
                const bored = 3
                worry = worry / BigInt(bored)
            }
            let newMonkey = monkey.falseMonkey
            if ((worry % monkey.test) == 0) {
                newMonkey = monkey.trueMonkey
            }
            // console.log(`${monkey.name} --> (${worry}) ${newMonkey}`)

            // careful this assumed itll update as expected mid loop
            monkies[newMonkey].items.push(worry)
        }
        return monkey
    })
}

const parseInput = (input) => {
    return input.split("\n\n").map((item) => {
        let [name, items, operationString, test, trueMonkey, falseMonkey] = item.split("\n")
        items = items.trim().replace("Starting items: ", "").split(", ").map(x => parseInt(x)) || []
        const [x, operation, y] = operationString.trim().replace("Operation: new = ", "").split(" ")
        test = BigInt(test.trim().replace("Test: divisible by ", ""))
        trueMonkey = BigInt(trueMonkey.trim().replace("If true: throw to monkey ", ""))
        falseMonkey = BigInt(falseMonkey.trim().replace("If false: throw to monkey ", ""))
        return {
            name, items, operation: { x, operation, y }, test, trueMonkey, falseMonkey, count: 0
        }

    })
}
console.log(solve(fs.readFileSync(__dirname + '/11test.txt', 'utf8')) == 10605);
// console.log(solve(fs.readFileSync(__dirname + '/11.txt', 'utf8')));


