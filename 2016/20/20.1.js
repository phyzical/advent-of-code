const fs = require('fs');

function solve(input) {
    let inputs = input.split('\n')
    let index = 0
    let count = 0
    let nextValue = 0
    while (count < inputs.length) {
        let low = parseInt(inputs[index].split('-')[0])
        let high = parseInt(inputs[index].split('-')[1])
        if (low <= nextValue) {
            nextValue = high + 1
            count = 0
            inputs.splice(index,1)

        }
        index++
        if (index >= inputs.length) {
            index = 0
        }
        count++
    }
    return nextValue
}
const test1Res = solve(fs.readFileSync(__dirname + '/20test.txt', 'utf8'));
console.log(test1Res, test1Res === 3);
console.log(solve(fs.readFileSync(__dirname + '/20.txt', 'utf8')));
