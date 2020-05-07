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
            const slice = solve(input.slice(startIndex,startIndex + parseInt(length)))

            const remaining = input.slice(startIndex + parseInt(length),input.length)
            //console.log(input,slice,remaining)

            let sliceString = slice
            for (let i = 0; i < parseInt(multiplier) - 1; i++) {
                console.log(i,parseInt(multiplier),sliceString.length, slice.length)

                sliceString = sliceString + slice
            }
            //console.log(input,sliceString)

            input = input.slice(0,startIndex) + sliceString + remaining
            index = (input.slice(0,startIndex) + sliceString).length
        }else {
            index++
        }
    }
   // console.log(input)
   // console.log("  ")

    return input

}
const test1Res = solve('ADVENT').length;
console.log(test1Res, test1Res === 6);
const test2Res = solve('(25x3)(3x3)ABC(2x3)XY(5x2)PQRSTX(18x9)(3x2)TWO(5x7)SEVEN').length;
console.log(test2Res, test2Res === 445);
const test3Res = solve('(3x3)XYZ').length;
console.log(test3Res, test3Res === 9);
const test4Res = solve('(27x12)(20x12)(13x14)(7x10)(1x12)A').length;
console.log(test4Res, test4Res === 241920);
const test5Res = solve('X(8x2)(3x3)ABCY').length;
console.log(test5Res, test5Res === 20);

console.log(solve(fs.readFileSync(__dirname+'/9.txt', 'utf8')).length);