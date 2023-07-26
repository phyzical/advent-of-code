const helpers = require("./helpers");

const fs = require('fs');

function solve(input, inputs) {
    inputs = inputs.split('')
    let instructions = input.split('\n')
    let currentIndex = instructions.length - 1;
    while (currentIndex >= 0) {
        let instruction = instructions[currentIndex]
        const splits = instruction.split(' ')
        let x = null;
        let y = null;
        let newString = []
        console.log(inputs, splits[0] + splits[1], instruction)
        switch (splits[0] + splits[1]) {
            case 'swapposition':
                x = parseInt(splits[2]);
                y = parseInt(splits[5]);
                let temp = inputs[x];
                inputs[x] = inputs[y];
                inputs[y] = temp;
                break;
            case 'swapletter':
                x = splits[2];
                y = splits[5];
                inputs = inputs.join('').replace(x, '#').replace(y, x).replace('#', y).split('');
                break;
            case 'reversepositions':
                x = parseInt(splits[2]);
                y = parseInt(splits[4]);
                let end = inputs.slice(y + 1, inputs.length).join('')
                let start = ''
                if (x > 0) {
                    start = inputs.slice(0, x).join('')
                }
                inputs = (start + helpers.stringReverse(inputs.slice(x, y + 1).join('')) + end).split('')
                break;
            case 'rotateleft':
            case 'rotateright':
                x = parseInt(splits[2]);
                inputs.map((item, i) => {
                    let newIndex;
                    if (splits[1] == 'left') {
                        newIndex = i + x
                        if (newIndex >= inputs.length) {
                            newIndex = (newIndex % inputs.length)
                        }
                    } else {
                        newIndex = i - x
                        if (newIndex < 0) {
                            newIndex = inputs.length - Math.abs(newIndex % inputs.length)
                        }
                    }
                    newString[newIndex] = item
                })
                inputs = newString;
                break;
            // how can you know its previous index??
            case 'rotatebased':
                x = splits[6];
                let inc = 1;
                const index = inputs.indexOf(x);
                if (index != -1) {
                    inc += index
                }
                if (index >= 4) {
                    inc += 1
                }
                console.log(inc)
                inputs.map((item, i) => {
                    let newIndex = i - inc
                    if (newIndex < 0) {
                        newIndex = inputs.length - Math.abs(newIndex % inputs.length)
                    }
                    newString[newIndex] = item
                });
                inputs = newString;
                break;
            // how can you know its previous index??
            case 'moveposition':
                x = parseInt(splits[2]);
                y = parseInt(splits[5]);
                // may only replace first occurance
                newString = inputs.splice(x, 1)
                inputs.splice(y, 0, newString[0])
                break;
        }
        currentIndex--
        console.log(inputs, splits[0] + splits[1], instruction)
    }
    return inputs.join('')

}
const test1Res = solve(fs.readFileSync(__dirname + '/21test.txt', 'utf8'), 'decab');
console.log(test1Res, test1Res === 'abcde');
//console.log(solve(fs.readFileSync(__dirname+'/21.txt', 'utf8'),'fbgdceah'));
