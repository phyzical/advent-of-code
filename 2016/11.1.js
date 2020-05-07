const fs = require('fs');

function solve(input){
    const instructions = input.split('\n')
    let floors = [
        {generators: [],chips: [],elevator: true},
        {generators: [],chips: [],elevator: false},
        {generators: [],chips: [],elevator: false},
        {generators: [],chips: [],elevator: false},
    ]
    instructions.map((item,i) => {
        item.split('floor contains')[1].split(' a ').map(split => {
            if (split.indexOf("generator") != -1) {
                floors[i].generators.push(split.split(' ')[0])
            } else if (split.indexOf("microchip") != -1) {
                floors[i].chips.push(split.split(' ')[0].split('-')[0])
            }
        })
    })
    console.log(floors)
}
const test1Res = solve(fs.readFileSync(__dirname+'/11test.txt', 'utf8'));
console.log(test1Res, test1Res === 2);
console.log(solve(fs.readFileSync(__dirname+'/11.txt', 'utf8')));
