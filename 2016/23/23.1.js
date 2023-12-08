const fs = require('fs');

function solve(input,inputs ){
    let currentIndex = 0;
    let instructions = input.split('\n')
    let count= 0
    while (currentIndex >= 0 && currentIndex < instructions.length && count < 10) {
        count++
        let instruction = instructions[currentIndex]
        const splits = instruction.split(' ')
        const first = splits[1]
        const second = splits[2]
        console.log(currentIndex)
        switch(splits[0]) {
            case 'tgl':
                let toggleIndex = currentIndex + inputs[first]
                if (toggleIndex >= 0 || toggleIndex < instructions.length) {
                    let newCommand = instructions[toggleIndex]
                    if (newCommand.indexOf('inc') != -1) {
                        newCommand =  instructions[toggleIndex].replace('inc','dec')
                    } else if (newCommand.indexOf('jnz')  != -1) {
                        newCommand =  instructions[toggleIndex].replace('jnz','cpy')
                    } else if (newCommand.indexOf('cpy')  != -1) {
                        newCommand =  instructions[toggleIndex].replace('cpy','jnz')
                    } else if (newCommand.indexOf('tgl')  != -1) {
                        newCommand =  instructions[toggleIndex].replace('tgl','inc')
                    } else if (newCommand.indexOf('dec')  != -1) {
                        newCommand =  instructions[toggleIndex].replace('dec','inc')
                    }
                    instructions[toggleIndex] = newCommand
                }
                currentIndex++
                break;
            case 'cpy':
                if (isNaN(second)) {
                    if (isNaN(first)) {
                        inputs[second] = inputs[first]
                    } else {
                        inputs[second] = parseInt(first)
                    }
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
        console.log(inputs)

    }
    return inputs.a

}
const test1Res = solve(fs.readFileSync(__dirname+'/23test.txt', 'utf8'),{a: 0,b:0,c:0,d:0});
console.log(test1Res, test1Res === 3);
console.log(solve(fs.readFileSync(__dirname+'/23.txt', 'utf8'),{a: 7,b:0,c:0,d:0}));
