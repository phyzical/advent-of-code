const fs = require('fs');
function solve(input){
    const instructionLines = input.split('\n');
    let buttonCombo = '';
    const keypad = [
        [0, 0,  1,  0, 0],
        [0, 2,  3,  4, 0],
        [5, 6,  7,  8, 9],
        [0,'A','B','C',0],
        [0, 0, 'D', 0, 0],
    ];
    let currentX = 0;
    let currentY = 2;
    let next = null;
    instructionLines.map(instructionLine => {
        instructionLine.split('').map(instruction => {
            if (instruction === 'U') {
                currentY--;
                if ( currentY < 0 || keypad[currentY][currentX] === 0) {
                    currentY++;
                }
            } else if (instruction === 'D') {
                currentY++;
                if (currentY > 4 || keypad[currentY][currentX] === 0) {
                    currentY--;
                }
            } else if (instruction === 'L') {
                currentX--;
                if (currentX < 0 || keypad[currentY][currentX] === 0) {
                    currentX++;
                }
            } else {
                currentX++;
                next = keypad[currentY][currentX];

                if (currentX > 4 || keypad[currentY][currentX] === 0) {
                    currentX--;
                }
            }
        });
        buttonCombo += keypad[currentY][currentX];
    });

    return buttonCombo
}

const test1Res = solve(fs.readFileSync(__dirname+'/2test.txt', 'utf8'));
console.log(test1Res, test1Res === '5DB3');

console.log(solve(fs.readFileSync(__dirname+'/2.txt', 'utf8')));