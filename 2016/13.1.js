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
    helpers.displayBoard(grid)
    let x = 1
    let y = 1
    let count = 0
    nextStep(grid,x,y,count)
}
function nextStep(grid,x,y,count){
    count++
    const yUp = y-1
    const yDown = y+1
    const xLeft = x-1
    const xRight = x+1

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
    if (up.value == 'x' || down.value =='x' || left.value == 'x' || right.value == 'x') {
        count++
        console.log(count)
    } else {
        if (!up.visited && up.value == '.') {
            nextStep(grid,x,yUp,count)
        }
        if (!down.visited && down.value == '.') {
            nextStep(grid,x,yDown,count)
        }
        if (!left.visited && left.value == '.') {
            nextStep(grid,xLeft,y,count)
        }
        if (!right.visited && right.value == '.') {
            nextStep(grid,xRight,y,count)
        }
    }
}

const test1Res = solve(10,7,4);
console.log(test1Res, test1Res === 11);
console.log(solve(1350,31,39));
