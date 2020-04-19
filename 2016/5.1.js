const fs = require('fs');
const md5 = require('blueimp-md5');

function solve(input){
    let index = 0
    let result = ''
    while (result.length < 8) {
        const hash = md5(input+index)
        if (hash.substring(0,5) === '00000') {
            result += hash[5]
        }
        index++
    }
    return result
}
const test1Res = solve('abc');
console.log(test1Res, test1Res === '18f47a30');

console.log(solve("reyedfim"));