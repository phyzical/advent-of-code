const fs = require('fs');

function solve(input){
    const instructionLines = input.split('\n');
    let count = 0
    instructionLines.map(line => {
        let result = false
        let outsides = []
        let insides = []
        line.split('[').map(split => {
            let splits = split.split(']')
            if (splits.length == 2) {
                insides.push(splits[0])
                if ( splits[1].length) {
                    outsides.push(splits[1])
                }
            } else {
                outsides.push(splits[0])
            }
        })
        outsides.map(outsde => {
            result = result || findCombo(outsde)
        })
        insides.map(inside => {
            result = result && !findCombo(inside)
        })
        if (result) {
            count++
            console.log(line)
        }
    })
    return count
}

function findCombo(string) {
    const splits = string.split('')
    let found = false;
    splits.map((item,i) => {
        const a  = item == splits[i+1] && splits[i+2] == splits[i-1] && splits[i-1] != item
        const b  = item == splits[i-1] && splits[i+1] == splits[i-2] && splits[i-2] != item

        if (a || b) {
                found = true
            }
    })
    return found
}
const test1Res = solve(fs.readFileSync(__dirname+'/7test.txt', 'utf8'));
console.log(test1Res, test1Res === 2);


console.log(solve(fs.readFileSync(__dirname+'/7.txt', 'utf8')));