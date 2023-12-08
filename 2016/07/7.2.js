const fs = require('fs');

function solve(input){
    const instructionLines = input.split('\n');
    let count = 0
    instructionLines.map(line => {
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
        let found = false

        outsides.map(outsde => {
           let combos = findCombo(outsde)
            if (combos.length) {
                insides.map(inside => {
                    let combos2 = findCombo(inside);
                    if (combos2.length) {
                        combos.map(combo => {
                            combos2.map(combo2 => {
                                if (combo2[0] == combo[1] && combo2[2] == combo[1] && combo2[1] == combo[0]) {
                                    found = true;
                                }
                            })
                        })

                    }
                })
            }
        })
        if (found) {
            count++
        }
    })
    return count
}

function findCombo(string) {
    const splits = string.split('')
    let results = []
    splits.map((item,i) => {
        if (splits[i+1] == splits[i-1] && splits[i-1] != item) {
            results.push(splits[i-1] + item + splits[i+1])
        }
    })
    return results
}
const test1Res = solve(fs.readFileSync(__dirname+'/7test2.txt', 'utf8'));
console.log(test1Res, test1Res === 4);

console.log(solve(fs.readFileSync(__dirname+'/7.txt', 'utf8')));