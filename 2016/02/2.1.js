const fs = require('fs');
function solve(input){
    const instructionLines = input.split('\n');
    let buttonCombo = '';
    const keypad = [
        [1,2,3],
        [4,5,6],
        [7,8,9]
    ];
    let currentX = 1;
    let currentY = 1;
    instructionLines.map(instructionLine => {
        instructionLine.split('').map(instruction => {
            if (instruction === 'U') {
                currentY--;
                if (currentY < 0 ) {
                    currentY = 0;
                }
            } else if (instruction === 'D') {
                currentY++;
                if (currentY > 2 ) {
                    currentY = 2;
                }
            } else if (instruction === 'L') {
                currentX--;
                if (currentX < 0 ) {
                    currentX = 0;
                }
            } else {
                currentX++;
                if (currentX > 2 ) {
                    currentX = 2;
                }
            }
        });
        buttonCombo += keypad[currentY][currentX];
    });

    return buttonCombo
}

const test1Res = solve(fs.readFileSync(__dirname+'/2test.txt', 'utf8'));
console.log(test1Res, test1Res === '1985');

console.log(solve(fs.readFileSync(__dirname+'/2.txt', 'utf8')));