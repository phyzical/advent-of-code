const fs = require("fs");
const helpers = require("../2016/helpers");

const solve = (input) => {
    let rockBoard = parseInput(input)
    rockBoard.reverse()
    const { x, y } = findStart(rockBoard)
    const result = findEnd(rockBoard, x, y)
    return result + 1
};
module.exports.solve = solve
const findStart = (rockBoard) => {
    let startX, startY
    rockBoard.forEach((row, y) => {
        row.forEach((rock, x) => {
            if (rock.isStart) {
                startY = y
                startX = x
            }
        })
    });
    return { startY, startX }
}

const findEnd = (rockBoard, x = 0, y = 0) => {
    const { elevation, isFinish } = rockBoard[y][x]


    rockBoard[y][x].visited = true

    if (isFinish) {
        return rockBoard.reduce((acc, row) => {
            return acc + row.reduce((acc, rock) => acc + (rock.visited && 1 || 0), 0)
        }, 0)
    }

    const right = rockBoard[y][x + 1]
    const left = rockBoard[y][x - 1]
    const up = rockBoard[y + 1] && rockBoard[y + 1][x]
    const down = rockBoard[y - 1] && rockBoard[y - 1][x]

    let boardA, boardB, boardC, boardD

    if (right && !right.visited && (Math.abs(elevation - right.elevation) <= 1))
        boardA = findEnd(helpers.clone(rockBoard), x + 1, y)
    if (left && !left.visited && (Math.abs(elevation - left.elevation) <= 1))
        boardB = findEnd(helpers.clone(rockBoard), x - 1, y)
    if (up && !up.visited && (Math.abs(elevation - up.elevation) <= 1))
        boardC = findEnd(helpers.clone(rockBoard), x, y + 1)
    if (down && !down.visited && (Math.abs(elevation - down.elevation) <= 1))
        boardD = findEnd(helpers.clone(rockBoard), x, y - 1)
    const counts = [boardA, boardB, boardC, boardD].filter(x => x > 0)

    return Math.min(...counts)
}

const parseInput = (input) => {
    return input.split("\n").map((row) => {
        return row.split('').map(char => {
            const isStart = char == "S"
            const isFinish = char == "E"
            let elevation = helpers.alphabetToNumber(char)
            elevation = isStart ? helpers.alphabetToNumber('a') : elevation
            elevation = isFinish ? helpers.alphabetToNumber('z') : elevation

            return {
                isStart,
                elevation,
                isFinish,
                visited: false
            }
        })
    })
}
// console.log(solve(fs.readFileSync(__dirname + '/12test.txt', 'utf8')) == 31);
console.log(solve(fs.readFileSync(__dirname + '/12.txt', 'utf8')));


