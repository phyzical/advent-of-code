const fs = require('fs');

function solve(input){
    const instructionLines = input.split('\n');
    let count = 0
    let word = ''
    console.log(instructionLines[0].length)
    while (count < instructionLines[0].length) {
        let letters = {}
        instructionLines.map(line => {
            letters[line[count]] = typeof letters[line[count]] === 'undefined' ?  1 : 1 +  letters[line[count]]
        })
        let lowestValue = 99999
        let highestLetter = ''
        for (let letter in letters) {
            if (letters[letter] < lowestValue) {
                lowestValue = letters[letter]
                highestLetter = letter
            }
        }
        word += highestLetter
        count++
    }
    return word
}
const test1Res = solve(fs.readFileSync(__dirname+'/6test.txt', 'utf8'));
console.log(test1Res, test1Res === 'advent');

console.log(solve(fs.readFileSync(__dirname+'/6.txt', 'utf8')));