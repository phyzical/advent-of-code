const fs = require('fs');

function solve(input,inputs){
    let currentIndex = 0;
    inputs = inputs.split('')
    let instructions = input.split('\n')
    while (currentIndex >= 0 && currentIndex < instructions.length) {
        let instruction = instructions[currentIndex]
        const splits = instruction.split(' ')
        switch(splits[0]+splits[1]) {
            case 'swapposition':
                if (isNaN(first)) {
                    inputs[second] = inputs[first]
                } else {
                    inputs[second] = parseInt(first)
                }
                currentIndex++
            case 'swapletter':
                break;
            case 'reverse':
                inputs[first]++
                currentIndex++
                break;
            case 'rotateleft':
            case 'rotateright':
                break;
            case 'rotatebased':
                inputs[first]--
                currentIndex++
                break;
            case 'move':
                let x = 0
                if (isNaN(first)) {
                    x = inputs[first]
                } else {
                    x = parseInt(first)
                }
                if (x != 0) {
                    currentIndex += parseInt(second)
                } else {
                    currentIndex++
                }
                break;
        }
    }
    return inputs.join('')

}
const test1Res = solve(fs.readFileSync(__dirname+'/12test.txt', 'utf8'),'abcde');
console.log(test1Res, test1Res === 'decab');
//console.log(solve(fs.readFileSync(__dirname+'/12.txt', 'utf8'),'abcdefgh'));
