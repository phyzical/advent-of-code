const helpers = require('./helpers')

const fs = require('fs');

function solve(input,length){
    while(input.length < length) {
        const finalInput = input + '0'
        const secondHalf = helpers.reverse(input).replace(/0/g,'x').replace(/1/g,'0').replace(/x/g,'1')
        input = finalInput + secondHalf

    }
    input = input.slice(0,length)
    let inputs = input
    while ((inputs.length % 2) == 0) {
        inputs = inputs.match(/.{1,2}/g).map(couple => {
            if (couple[0] == couple[1]) {
                return '1'
            } else {
                return '0'
            }
        })

        inputs = inputs.join('')


    }
    return inputs
}
console.log(solve('10001110011110000',35651584));
