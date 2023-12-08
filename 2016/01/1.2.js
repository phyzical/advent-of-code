const fs = require('fs');
function solve(input){
    const instructions = input.split(', ');
    let x = 0;
    let y = 0;
    let direction = 'up';
    let positions = [];
    let finalX = null;
    let finalY = -1;
    instructions.map(instruction => {
        const turn = instruction[0];
        const steps = parseInt(instruction.substring(1));
        if (turn === 'L'){
            if (direction === 'up') {
                direction = 'left'
            } else if (direction === 'left') {
                direction = 'down'
            } else if (direction === 'down') {
                direction = 'right'
            } else {
                direction = 'up'
            }
        } else {
            if (direction === 'up') {
                direction = 'right'
            } else if (direction === 'left') {
                direction = 'up'
            } else if (direction === 'down') {
                direction = 'left'
            } else {
                direction = 'down'
            }
        }
        if (direction === 'up') {
            for (i = 0; i < steps;i++) {
                const position = x.toString()+(y+i).toString();
                if (finalY === -1 && positions.find(item => item === position)){
                    finalY = y+i
                    finalX = x
                }
                positions.push(position)
            }
            y += steps
        } else if (direction === 'left') {
            for (i = 0; i < steps;i++) {
                const position = (x-i).toString()+y.toString();
                if (finalY === -1 && positions.find(item => item === position)){

                    finalY = y
                    finalX = x-i
                }
                positions.push(position)
            }
            x -= steps
        } else if (direction === 'down') {
            for (i = 0; i < steps;i++) {
                const position = x.toString()+(y-i).toString();
                if (finalY === -1 && positions.find(item => item === position)){
                    finalY = y-i
                    finalX = x
                }
                positions.push(position)
            }
            y -= steps
        } else {
            for (i = 0; i < steps;i++) {
                const position = (x+i).toString()+y.toString();
                if (finalY === -1 && positions.find(item => item === position)){

                    finalY = y
                    finalX = x+i
                }
                positions.push(position)
            }
            x += steps
        }
    });
    return Math.abs(finalX) + Math.abs(finalY)
}

const test1Res = solve("R8, R4, R4, R8");
console.log(test1Res, test1Res === 4);

console.log(solve(fs.readFileSync(__dirname+'/1.txt', 'utf8')));