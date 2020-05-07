const fs = require('fs');

function solve(input){
    let instructions = input.split('\n')
    instructions.push('Disc #7 has 11 positions; at time=0, it is at position 0.')
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
        discs.map((disc,i) => {
            let newIndex =(i+1 + time + disc.index)

            if (newIndex >= disc.size) {
                newIndex =  newIndex % disc.size
            }
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
console.log(solve(fs.readFileSync(__dirname+'/15.txt', 'utf8')));
