const fs = require('fs');

function solve(input ){
    let currentIndex = 0;
    let instructions = input.split('\n')
    let currentX = 0;
    let currentY = 0;
    let grid = []
    let highestNumber = 0
    instructions.map((instruction,y) => {
        grid[y] = instruction.split('')
        grid[y].map(item => {
            if (!isNaN(item) && parseInt(item) > highestNumber) {
                highestNumber = parseInt(item)
            }
        })
        let x = instruction.indexOf('0')
        if (x != -1) {
            currentY = y
            currentX = x
        }
    })
    return findNextPath(grid,currentX,currentY,['0'],highestNumber+1,0)

}
function findNextPath(grid,currentX,currentY,currentFound,length,count) {
    let res = 9999999
    if (currentFound.length >= length) {
        return count
    } else if (count < 1000){
        count++
        const up = grid[currentY - 1][currentX]
        const down = grid[currentY + 1][currentX]
        const left = grid[currentY][currentX - 1]
        const right = grid[currentY][currentX + 1]

        if (up && up != '#') {
            let newFound = currentFound
            if (!isNaN(up) && !newFound.find(found => found == up)) {
                newFound = currentFound.concat([up])
            }
            let tempRes = findNextPath(grid, currentX, currentY - 1, newFound, length, count)
            if (tempRes < res) {
                res = tempRes
            }
        }
        if (down && down != '#') {

            let newFound = currentFound

            if (!isNaN(down) && !newFound.find(found => found == down)) {
                newFound =currentFound.concat([down])

            }
            let tempRes = findNextPath(grid, currentX, currentY + 1, newFound, length, count)
            if (tempRes < res) {
                res = tempRes
            }
        }

        if (left && left != '#') {
            let newFound = currentFound

            if (!isNaN(left) && !newFound.find(found => found == left)) {
                newFound = currentFound.concat([left])

            }
            let tempRes = findNextPath(grid, currentX - 1, currentY, newFound, length, count)
            if (tempRes < res) {
                res = tempRes
            }
        }

        if (right && right != '#') {
            let newFound = currentFound

            if (!isNaN(right) && !newFound.find(found => found == right)) {
                newFound = currentFound.concat([right])

            }
            let tempRes = findNextPath(grid, currentX + 1, currentY, newFound, length, count)
            if (tempRes < res) {
                res = tempRes
            }
        }
        return res
    }
}

//const test1Res = solve(fs.readFileSync(__dirname+'/24test.txt', 'utf8'));
//console.log(test1Res, test1Res === 14);
console.log(solve(fs.readFileSync(__dirname+'/24.txt', 'utf8')));
