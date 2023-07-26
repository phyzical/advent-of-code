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
    return input.split("\n").map(convertInput)
}

function convertInput(input) {
    const inputs = input.split(" ")
    let result = []
    switch (inputs[0]) {
        case "A":
            result[0] = 1
            break;
        case "B":
            result[0] = 2
            break;
        default: // C
            result[0] = 3
            break;
    }


    switch (inputs[1]) {
        case "Z": //WIN
            switch (result[0]) {
                case 1:
                    result[1] = 2
                    break;
                case 2:
                    result[1] = 3
                    break;
                default: 3
                    result[1] = 1
                    break;
            }
            break;
        case "Y": //DRAW
            result[1] = result[0]
            break;
        default: //LOSE
            switch (result[0]) {
                case 1:
                    result[1] = 3
                    break;
                case 2:
                    result[1] = 1
                    break;
                default: 3
                    result[1] = 2
                    break;
            }
    }
    return result
}
console.log(solve(fs.readFileSync(__dirname + '/2test.txt', 'utf8')) == 12);
console.log(solve(fs.readFileSync(__dirname + '/2.txt', 'utf8')));
