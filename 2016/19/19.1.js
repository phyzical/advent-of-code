
function solve(input) {
    let elves = []
    let index = 0
    for (let i = 1; i <= input; i++) {
        elves[i] = i
    }
    let remove = true
    while (elves.length > 1) {
        elves = elves.filter((item,i) => {
            let res = remove;
            remove = !remove
            return res
        })
    }
    return elves[0]
}
const test1Res = solve(5);
console.log(test1Res, test1Res === 3);
const test2Res = solve(25);
console.log(test2Res, test2Res === 19);
console.log(solve(3001330));

//  1  3  5  7  9  11  13  15  17  19  21  23  25
//
