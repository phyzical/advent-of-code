const fs = require('fs');

function solve(input){
    let index = 0
    while (index < input.length) {
        let char = input[index]
        let startIndex = index
        if (char === '(') {
            let string = ''
            let lastChar = ''
            let endIndex = 0
            while (lastChar != ')'){
                index++
                string += lastChar
                lastChar = input[index]
                endIndex = index
            }
            const stringSplit = string.split('x')
            const length = stringSplit[0]
            const multiplier = stringSplit[1]
           // console.log(length,multiplier)
            input = input.slice(0,startIndex) + input.slice(endIndex+1,input.length)
            const slice = input.slice(startIndex,startIndex + parseInt(length))
            const remaining = input.slice(startIndex + parseInt(length),input.length)
            //console.log(input,slice,remaining)

            let sliceString = slice
            for (let i = 0; i < parseInt(multiplier) - 1; i++) {
                sliceString += slice
            }
            //console.log(input,sliceString)

            input = input.slice(0,startIndex) + sliceString + remaining
            index = (input.slice(0,startIndex) + sliceString).length
        }else {
            index++
        }
    }
    //console.log(input)
    //console.log("  ")

    return input.length

}
const test1Res = solve('ADVENT');
console.log(test1Res, test1Res === 6);
const test2Res = solve('A(1x5)BC');
console.log(test2Res, test2Res === 7);
const test3Res = solve('(3x3)XYZ');
console.log(test3Res, test3Res === 9);
const test4Res = solve('(6x1)(1x3)A');
console.log(test4Res, test4Res === 6);
const test5Res = solve('X(8x2)(3x3)ABCY');
console.log(test5Res, test5Res === 18);
const test6Res = solve('A(2x2)BCD(2x2)EFG');
console.log(test6Res, test6Res === 11);

console.log(solve(fs.readFileSync(__dirname+'/9.txt', 'utf8')));