const fs = require('fs');

function solve(input ){
    let currentIndex = 0;
    let instructions = input.split('\n')
    let currentX = 0;
    let currentY = 0;
    let grid = []
    instructions.map((instruction,y) => {
        grid[y] = instruction.split('')
        let x = instruction.indexOf('0')
        if (x != -1) {
            currentY = y
            currentX = x
        }
    })

    console.log(grid,currentX,currentY)

}
const test1Res = solve(fs.readFileSync(__dirname+'/24test.txt', 'utf8'));
console.log(test1Res, test1Res === 14);
//console.log(solve(fs.readFileSync(__dirname+'/24.txt', 'utf8')));
