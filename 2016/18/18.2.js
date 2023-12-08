
function solve(input,rows) {
    let grid = [input]
    let index = 0
    while (grid.length < rows) {
        let prevRow = grid[index]
        let newRow = ''
        let newRowIndex = 0
        while (newRow.length < input.length) {
            let left = prevRow[newRowIndex-1]
            let middle = prevRow[newRowIndex]
            let right = prevRow[newRowIndex+1]
            //Its left and center tiles are traps, but its right tile is not.
            if ((left == '^' && middle == '^' && right != '^') ||
                // Its center and right tiles are traps, but its left tile is not.
                (left != '^' && middle == '^' && right == '^') ||
                //Only its left tile is a trap.
                (left == '^' && middle != '^' && right != '^') ||
                //  Only its right tile is a trap.
                (left != '^' && middle != '^' && right == '^')) {
                newRow += '^'
            } else {
                newRow += '.'
            }
            newRowIndex++
        }
        grid.push(newRow)
        index++
    }
    return grid.reduce((acc,row) => {
        return acc + row.replace(/\^/g,'').length
    },0)
}
 console.log(solve(".^^^.^.^^^.^.......^^.^^^^.^^^^..^^^^^.^.^^^..^^.^.^^..^.^..^^...^.^^.^^^...^^.^.^^^..^^^^.....^....",400000));
