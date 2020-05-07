const fs = require('fs');

function solve(input,chip1,chip2){
    const instructions = input.split('\n')
    const botInstructions = instructions.filter(instruction => {
        return instruction[0] === 'b'
    })
    const valueInstructions = instructions.filter(instruction => {
        return instruction[0] !== 'b'
    })

    let maxIndex = 0
    valueInstructions.map(instruction => {
        const splits = instruction.split('value ')[1].split(' goes')
        const value = parseInt(splits[0])
        const index = parseInt(splits[1].split('bot ')[1])
        if (index > maxIndex) {
            maxIndex = index
        }

    })
    let bots = []
    let outputs = [[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[]]
    let i = 0
    while(bots.length <= maxIndex + 10) {
        bots[i] = {instruction: null, values: [], index: i}
        i++
    }
    valueInstructions.map(instruction => {
        const splits = instruction.split('value ')[1].split(' goes')
        const value = parseInt(splits[0])
        const index = parseInt(splits[1].split('bot ')[1])
        bots[index].values.push(value)

    })
    let resultIndex = 0
    botInstructions.map(instruction => {
        const splits = instruction.split(' gives ')
        const givingIndex = parseInt(splits[0].split('bot ')[1])
        bots[givingIndex].instruction = splits[1]
    })
    while (resultIndex == 0) {
        bots.filter(bot => bot.values.length == 2).map(bot => {
            const currentInstruction = bot.instruction
            const lowSplit = currentInstruction.split(' and ')
            const lowIndex = lowSplit[0].split('low to ')[1]
            const highIndex = lowSplit[1].split('high to ')[1]
            let lowValue = bot.values[0]
            let highValue = bot.values[1]
            if (bot.values[0] > bot.values[1]) {
                lowValue = bot.values[1]
                highValue = bot.values[0]
            }
            if ((lowValue == chip1 && highValue == chip2) || (highValue == chip1 && lowValue == chip2)) {
                resultIndex = bot.index
            }
            bots[bot.index].values = [];
            if (lowIndex.indexOf("bot") !== -1) {
                bots[parseInt(lowIndex.replace("bot ", ""))].values.push(lowValue)
            } else {
                outputs[parseInt(lowIndex.replace("output ", ""))].push(lowValue)
            }
            if (highIndex.indexOf("bot") !== -1) {
                bots[parseInt(highIndex.replace("bot ", ""))].values.push(highValue)

            } else {
                outputs[parseInt(highIndex.replace("output ", ""))].push(highValue)
            }
        })
    }
    return resultIndex

}
const test1Res = solve(fs.readFileSync(__dirname+'/10test.txt', 'utf8'),5,2);
console.log(test1Res, test1Res === 2);
console.log(solve(fs.readFileSync(__dirname+'/10.txt', 'utf8'),61,17));