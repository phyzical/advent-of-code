const fs = require('fs');

function solve(input,y,x){
    const instructionLines = input.split('\n');
    let tempY = y
    let grid = []
    while(tempY--) {
        let newGrid = []
        let tempX = x
        while(tempX--) newGrid[tempX] = '.';
        grid[tempY] = newGrid;
    }

    instructionLines.map(line => {
        const lineSplits = line.split(' ')
        if (line.search("rect") !== -1) {
            const rectSplits = lineSplits[1].split('x')
            const rectX = parseInt(rectSplits[0])
            const rectY = parseInt(rectSplits[1])
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
            const newRow = []
             grid[parseInt(row)].map((item,i) => {
                let index = i + parseInt(shiftAmount)
                if (index >= grid[parseInt(row)].length) {
                    index = index - grid[parseInt(row)].length
                }
                newRow[index] = item
            })

            grid[parseInt(row)] = newRow
        } else if (line.search("rotate column") !== -1) {
            const column = lineSplits[2].split('=')[1]
            const shiftAmount = lineSplits[4]
            let tempLength = grid.length
            let newColumn = []
            while(tempLength--) newColumn[tempLength] = '.';

            grid.map((row,i) => {

                let index = i + parseInt(shiftAmount)
                if (index >= grid.length) {
                    index = index - grid.length
                }
                newColumn[index] = row[parseInt(column)]
            })
            newColumn.map((item,i) => {
                grid[i][parseInt(column)] = item
            })
        }

    })
    grid.map(y => {
        console.log(y.reduce((acc,x) => {
            return acc + x
        },''))
    })

}

console.log(solve(fs.readFileSync(__dirname+'/8.txt', 'utf8'),6,50));