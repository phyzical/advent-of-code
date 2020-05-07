
function solve(input) {
    let elves = []
    let index = 0
    for (let i = 0; i < input; i++) {
        elves[i] = i
    }

    while (elves.length > 1) {
        if (index + 1 > elves.length) {
            index = -1
        }
        elves.splice(index + 1, 1);
        index++
            console.log((elves.length/input) * 100)
    }
    return elves[0] + 1
}
const test1Res = solve(5);
console.log(test1Res, test1Res === 3);
 console.log(solve(3001330));
