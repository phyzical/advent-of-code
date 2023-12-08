const fs = require('fs');
function solve(input) {
    let elves = input.split('\n\n');

    elves = elves.map(elf => {
        const calories = elf.split('\n');
        return calories.reduce((acc, elf) => acc + parseInt(elf), 0)
    });
    return elves.sort((a, b) => b - a)
}

console.log(solve(fs.readFileSync(__dirname + '/1test.txt', 'utf8'))[0] == '24000');
const elves = solve(fs.readFileSync(__dirname + '/1.txt', 'utf8'))
console.log(elves[0]);
console.log(elves[0] + elves[1] + elves[2]);
