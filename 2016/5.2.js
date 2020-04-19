const fs = require('fs');
const md5 = require('blueimp-md5');

function solve(input){
    let index = 0
    let result = '________'
    while (result.replace('_','').length != 8) {
        const hash = md5(input+index)
        if (hash.substring(0,5) === '00000' && !isNaN(hash[5]) && parseInt(hash[5]) < 8 && parseInt(hash[5]) >= 0) {
            if (result[hash[5]] === '_') {
                result = replaceAt(result,hash[5], hash[6])
            }
        }
        index++
    }
    return result
}

const replaceAt = function (str, index, ch) {
    return str.replace(/./g, (c, i) => i == index ? ch : c)
}



const test1Res = solve('abc');
console.log(test1Res, test1Res === '05ace8e3');

console.log(solve("reyedfim"));