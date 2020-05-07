const helpers =  require("./helpers");

const fs = require('fs');

function solve(input) {
    let inputs = input.split('\n')
    let index = 0
    let count = 0
    let nextValue = 0
    let result = 0
    while (inputs.length > 0) {
        let low = (parseInt(inputs[index].split('-')[0]))
        let high = (parseInt(inputs[index].split('-')[1]))
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
        if (count > inputs.length && inputs.length > 0) {
            count = 0
            let nextLow = inputs.reduce((acc,inputx) => {
                let val = parseInt(inputx.split('-')[0])
                return val < acc ? val : acc
            },9999999999999999999999999999999999999999)
            result += (nextLow - 1 - nextValue)
            nextValue = nextLow
        }
    }
    result += nextValue - 4294967295
    return result
}
console.log(solve(fs.readFileSync(__dirname + '/20.txt', 'utf8')));
