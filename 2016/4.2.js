const fs = require('fs');
function solve(wordToFind, input){
    const instructions = input.split('\n');
    let total = 0;
    let alphabet = 'abcdefghijklmnopqrstuvwxyz';
    instructions.map(instruction => {
        let letterCounts = [];
        let letters = instruction.split('-');
        let idSplit = letters[letters.length - 1].split('[');
        const id = idSplit[0];
        const checksum = idSplit[1].split(']')[0];
        let checksum2 = '';

        letters =  letters.splice(0,letters.length - 1).toString().replace(/,/g,'').split('')
        letters.map(letter => {
            letterCounts[letter] = letters.toString().replace(/,/g,'').split(letter).length - 1
        })
        letterCounts.sort((a, b) => a > b)

        while (checksum2.length < 5) {
            let highestValue = 0
            let sortableLetters = []

            for (let letterCount in letterCounts){
                if (highestValue < letterCounts[letterCount]) {
                    highestValue = letterCounts[letterCount]
                    sortableLetters = []
                }

                if (highestValue === letterCounts[letterCount]){
                    sortableLetters.push(letterCount)
                }
            }
            sortableLetters.sort().map(letter => {
                if (checksum2.length < 5) {
                    checksum2 += letter
                    letterCounts[letter] = null
                }
            })
        }

        if (checksum2 === checksum){
            const word = letters.map(item => {
                return item.split('').map(item2 => {
                    //do rotate
                    let currentLetterIndex = alphabet.indexOf(item2);
                    return alphabet[((parseInt(id) % alphabet.length) + currentLetterIndex) % alphabet.length]
                }).toString().replace(/,/g,'')
            }).toString().replace(/,/g,'')
            if (word == wordToFind) {
                total = id
            }
        }

    });
    return total
}
const test1Res = solve('veryencryptedname',fs.readFileSync(__dirname+'/4test.txt', 'utf8'));
console.log(test1Res, test1Res === 343);

console.log(solve('northpoleobjectstorage',fs.readFileSync(__dirname+'/4.txt', 'utf8')));

