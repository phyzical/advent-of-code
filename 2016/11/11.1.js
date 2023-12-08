const fs = require('fs');

function solve(input){
    const instructions = input.split('\n')
    let floors = [
        {generators: [],chips: []},
        {generators: [],chips: []},
        {generators: [],chips: []},
        {generators: [],chips: []},
    ]
    instructions.map((item,i) => {
        item.split('floor contains')[1].split(' a ').map(split => {
            if (split.indexOf("generator") != -1) {
                floors[i].generators.push(split.split(' ')[0])
            } else if (split.indexOf("microchip") != -1) {
                floors[i].chips.push(split.split(' ')[0].split('-')[0])
            }
        })
    })
    console.log(floors)
    //
    // const currentIndex = 0;
    // const finalIndex = 3;
    // while (floors[0].generators.length || floors[0].chips.length || floors[1].generators.length || floors[1].chips.length || floors[2].generators.length || floors[2].chips.length){
    //     let currentFloor = floors[currentIndex]
    //     let pairs = []
    //     currentFloor.generators.map(generator => {
    //         currentFloor.chips.map(chip => {
    //             if (generator == chip) {
    //                 pairs.push(chip)
    //             }
    //         })
    //     })
    //     if (pairs.length) {
    //         //try to get to top
    //     } else {
    //         currentFloor.chips.map(chip => {
    //             floors.map(floor => {
    //                 if (floor.chips.find(chip2 => chip == chip2)) {
    //                     // move chip to floor
    //                 }
    //             })
    //         })
    //     }
    //     console.log(currentFloor,pairs)
    //     let newIndex = 0
    // }
}

function move(input){

}

//NOTE ENDED UP SOLVING BY HAND IN ABOUT 30 SECONDS


//const test1Res = solve(fs.readFileSync(__dirname+'/11test.txt', 'utf8'));
//console.log(test1Res, test1Res === 2);
console.log(solve(fs.readFileSync(__dirname+'/11.txt', 'utf8')));
