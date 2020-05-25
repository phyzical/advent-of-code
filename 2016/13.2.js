const fs = require('fs');
const helpers = require('./helpers')
function solve(input,xFinal,yFinal){
    let grid = []
    for (let y = 0; y < 50;y++) {
        grid[y] = []
        for (let x = 0; x < 50;x++) {
            if (xFinal == x && yFinal == y) {
                grid[y][x] = { value: 'x', visited: false }
            } else {
                grid[y][x] = { value: ((((x*x + 3*x + 2*x*y + y + y*y) + input).toString(2).split('1').length - 1) % 2) === 0 ? '.' : '#', visited: false }
            }
        }
    }
    //helpers.displayBoard(grid)
    let x = 1
    let y = 1
    let count = 1
    return nextStep(grid,x,y,count)
}
function nextStep(grid,x,y,count){
    const yUp = y-1
    const yDown = y+1
    const xLeft = x-1
    const xRight = x+1
    let res = 0
    grid[y][x].visited = true
    let up = {value: null, visited: false}
    if (yUp >= 0) {
        up = grid[yUp][x]
    }
    let down =  {value: null, visited: false}
    if (yDown < grid.length) {
        down = grid[yDown][x]

    }
    let left =  {value: null, visited: false}
    if (xLeft >= 0) {
        left = grid[y][xLeft]

    }
    let right =  {value: null, visited: false}
    if (xRight < grid[0].length) {
        right = grid[y][xRight]

    }
    if (count <= 50) {

        if (!(!up.visited && up.value == '.') && !(!down.visited && down.value == '.') && !(!left.visited && left.value == '.') && !(!right.visited && right.value == '.')) {
            return count
        } else {
            if (!up.visited && up.value == '.') {
                res += nextStep(grid, x, yUp, count + 1)
            }
            if (!down.visited && down.value == '.') {
                res += nextStep(grid, x, yDown, count + 1)

            }
            if (!left.visited && left.value == '.') {
                res += nextStep(grid, xLeft, y, count + 1)

            }
            if (!right.visited && right.value == '.') {
                res += nextStep(grid, xRight, y, count + 1)

            }
        }
    }
    return res
}


// manually solved
console.log(solve(1350,31,39));
