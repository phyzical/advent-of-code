const fs = require('fs');
function solve(input){
    const instructions = input.split(', ');
    let x = 0;
    let y = 0;
    let direction = 'up';
    instructions.map(instruction => {
        const turn = instruction[0];
        const steps = parseInt(instruction.substring(1));
        if (turn === 'L'){
            if (direction === 'up') {
                direction = 'left'
            } else if (direction === 'left') {
                direction = 'down'
            } else if (direction === 'down') {
                direction = 'right'
            } else {
                direction = 'up'
            }
        } else {
            if (direction === 'up') {
                direction = 'right'
            } else if (direction === 'left') {
                direction = 'up'
            } else if (direction === 'down') {
                direction = 'left'
            } else {
                direction = 'down'
            }
        }

        if (direction === 'up') {
            y -= steps
        } else if (direction === 'left') {
            x -= steps
        } else if (direction === 'down') {
            y += steps
        } else {
            x += steps
        }
    });
    return Math.abs(x) + Math.abs(y)
}

const test1Res = solve("R5, L5, R5, R3");
console.log(test1Res, test1Res === 12);
const test2Res = solve("R2, R2, R2");
console.log(test2Res, test2Res === 2);
const test3Res = solve("R2, L3");
console.log(test3Res, test3Res === 5);

console.log(solve(fs.readFileSync(__dirname+'/1.txt', 'utf8')));