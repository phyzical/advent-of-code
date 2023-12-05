const fs = require("fs");
const helpers = require("../2016/helpers");

const solve = (input) => {
    const moves = parseInput(input)
    // make a 100x100 board
    const board = helpers.generateBoard(10, 10)
    let x = 0,
        y = 0

    board[y][x] = true

    moves.forEach(({ direction, count }) => {
        let tailX = x,
            tailY = y
        console.log(direction, count)

        for (let i = 0; i < count; i++) {
            console.log(x, y)

            switch (direction) {
                case "R":
                    x += 1
                    break
                case "L":
                    x -= 1
                    break
                case "U":
                    y += 1
                    break
                case "D":
                    y -= 1
                    break
            }
            const yTooFar = (Math.abs(tailY - y) > 1),
                xTooFar = (Math.abs(tailX - x) > 1)

            if (x > tailX && y > tailY && (yTooFar || xTooFar)) {
                tailX++
                tailY++
            } else if (x < tailX && y < tailY && (yTooFar || xTooFar)) {
                tailX--
                tailY--
            } else if (x < tailX && xTooFar) {
                tailX--
            } else if (y < tailY && yTooFar) {
                tailY--
            } else if (x > tailX && xTooFar) {
                tailX++

            } else if (y > tailY && yTooFar) {
                tailY++
            }

            board[tailY][tailX] = true
        }
    });
    console.log(board)
    return board.reduce((acc, yRow) => {
        return acc + yRow.reduce((acc2, piece) => {
            if (piece)
                acc2++
            return acc2
        }, 0)
    }, 0)
};

const parseInput = (input) => {
    return input.split("\n").map(x => {
        let [direction, count] = x.split(" ")
        return { direction, count }
    })
}
console.log(solve(fs.readFileSync(__dirname + '/9test.txt', 'utf8')) == 13);
// console.log(solve(fs.readFileSync(__dirname + '/9.txt', 'utf8')));