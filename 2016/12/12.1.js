const fs = require('fs');

function solve(input){
    let inputs = {a: 0,b:0,c:0,d:0}
    let currentIndex = 0;
    let instructions = input.split('\n')
    while (currentIndex >= 0 && currentIndex < instructions.length) {
        let instruction = instructions[currentIndex]
        const splits = instruction.split(' ')
        const first = splits[1]
        const second = splits[2]
        switch(splits[0]) {
            case 'cpy':
                if (isNaN(first)) {
                    inputs[second] = inputs[first]
                } else {
                    inputs[second] = parseInt(first)
                }
                currentIndex++
                break;
            case 'inc':
                inputs[first]++
                currentIndex++
                break;
            case 'dec':
                inputs[first]--
                currentIndex++
                break;
            case 'jnz':
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
    return inputs.a

}
const test1Res = solve(fs.readFileSync(__dirname+'/12test.txt', 'utf8'));
console.log(test1Res, test1Res === 42);
console.log(solve(fs.readFileSync(__dirname+'/12.txt', 'utf8')));
