const fs = require('fs');

function solve(input) {
    return parseGames(input).reduce(addGame, 0)
}

function addGame(acc = 0, input) {
    let gameScore = 0;
    gameScore += input[1]
    if (input[0] == input[1]) {
        gameScore += 3
    } else {
        switch (input[0]) {
            case 1:
                gameScore += input[1] == 2 ? 6 : 0
                break;
            case 2:
                gameScore += input[1] == 3 ? 6 : 0
                break;
            default: 3
                gameScore += input[1] == 1 ? 6 : 0
        }
    }


    return acc + gameScore
}


function parseGames(input) {
    return input.split("\n").map(x => x.split(' ').map(parseInput))
}

function parseInput(input) {
    switch (input) {
        case "A":
        case "X":
            return 1
        case "B":
        case "Y":
            return 2
        default: // C, Z
            return 3
    }
}
console.log(solve(fs.readFileSync(__dirname + '/2test.txt', 'utf8')) == 15);
console.log(solve(fs.readFileSync(__dirname + '/2.txt', 'utf8')));
