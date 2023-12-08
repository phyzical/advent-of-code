
function solve(input) {
    let elves = []
    let index = 0
    for (let i = 0; i < input; i++) {
        elves[i] = i+1
    }
    while (elves.length > 1) {
        const isEven = (elves.length % 2) == 0
        let removeIndex = 0
        if (isEven) {
            removeIndex = elves.length/2
        } else {
            // halve and round down
            removeIndex = parseInt(elves.length/2)
        }

        if ((removeIndex + index) >= elves.length){
            removeIndex = elves.length - (removeIndex + index)
        } else {
            removeIndex = removeIndex + index
        }
        elves.splice(removeIndex,1)
        index++
        if (index > elves.length){
            index = 0
        }
    }
    return elves[0]
}
const test1Res = solve(5);
console.log(test1Res, test1Res === 2);
const test2Res = solve(25);
console.log(test2Res, test2Res === 2);
console.log(solve(3001330));

//      1
// 25 6     2
// 24   5 3          7
// 23                 8
// 22                  9
// 21                  10
// 20                  11
// 19                  12
//   18 17 16  14
