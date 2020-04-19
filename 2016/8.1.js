const fs = require('fs');

function solve(input,y,x){
    const instructionLines = input.split('\n');
    let grid = new Array(y)
    grid = grid.map(y => {
        let newGrid = new Array(x)
        return newGrid.map(x => {
            return '.'
        })
    })
    instructionLines.map(line => {
        const lineSplits = line.split(' ')
        if (line.search("rect") !== -1) {
            const rectSplits = lineSplits[1].split('x')
            const rectX = rectSplits[0]
            const rectY = rectSplits[1]
            for (let z = 0; z < rectY; z++) {
                for (let i = 0; i < rectX; i++) {
                    if (grid[z][i] === '.') {
                        grid[z][i] = '#'
                    } else {
                        grid[z][i] = '.'
                    }
                }
            }
        } else if (line.search("rotate row") !== -1) {
            const row = lineSplits[2].split('=')[1]
            const shiftAmount = lineSplits[4]
        } else if (line.search("rotate column") !== -1) {
            const column = lineSplits[2].split('=')[1]
            const shiftAmount = lineSplits[4]
        }
    })

}
const test1Res = solve(fs.readFileSync(__dirname+'/8test.txt', 'utf8'),7,3);
console.log(test1Res, test1Res === 6);

console.log(solve(fs.readFileSync(__dirname+'/8.txt', 'utf8'),50,6));