const fs = require('fs');

function solve(input){
    const instructionLines = input.split('\n');
    let count = 0
    instructionLines.map(line => {
        const splits = line.split('[')
        const splits2 = splits[1].split(']')
        if ((findCombo(splits[0]) || findCombo(splits2[1])) && !findCombo(splits2[0])) {
            count++
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