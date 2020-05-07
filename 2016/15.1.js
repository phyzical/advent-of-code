const fs = require('fs');

function solve(input){
    let instructions = input.split('\n')
    let discs = []
    instructions.map(instruction => {
        const splits = instruction.split(' positions')
        const postitions = parseInt(splits[0].split('has ')[1])
        const position = parseInt(splits[1].split('position ')[1].replace('.',''))
        discs.push({size:postitions,index:position})
    })
    let time = 0
    let found = false
    while (!found ) {
        let indexCheck = null
        let invalid = false
        console.log('time',time)
        discs.map((disc,i) => {
            let newIndex =(i+1 + time + disc.index)

            if (newIndex >= disc.size) {
                newIndex =  newIndex % disc.size
            }
            console.log(newIndex)
            if (indexCheck == null){
                indexCheck = newIndex
            }
            if (newIndex != indexCheck) {
                invalid = true
            }
        })
        if (!invalid) {
            found = true
        }
        time++
    }
    return time - 1
}
const test1Res = solve(fs.readFileSync(__dirname+'/15test.txt', 'utf8'));
console.log(test1Res, test1Res === 5);
console.log(solve(fs.readFileSync(__dirname+'/15.txt', 'utf8')));
