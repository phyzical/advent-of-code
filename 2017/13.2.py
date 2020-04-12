from copy import copy
def solve(input):
    lines = input.splitlines()
    lineInstructions = {}
    maxKey = 0
    for line in lines:
        lineSplits = line.split(': ')
        key = lineSplits[0]
        if key > maxKey:
            maxKey = key
        lineInstructions[key] = lineSplits[1]
    solveInstructionsRange = range(int(key) + 1)
    solveInstructions = {}
    for solveInstruction in solveInstructionsRange:
        value = 0
        if lineInstructions.get(str(solveInstruction)) > 0:
            value = int(lineInstructions[str(solveInstruction)])
        solveInstructions[solveInstruction] = {'value': value, 'scannerIndex': 0, 'forward': True}
    score = 1
    count = -1
    while score > 0:
        score = getScore(copy(solveInstructions))
        print(solveInstructions[98])
        solveInstructions = doTick(copy(solveInstructions))
        count += 1
    return count

def getScore(scoreInstructions):
    currentIndex = 0
    score = 0
    while currentIndex < len(scoreInstructions):
        currentInstruction = scoreInstructions[currentIndex]
        if currentInstruction['value'] > 0 and currentInstruction['scannerIndex'] == 0:
            score += 1
        currentIndex += 1
        scoreInstructions = doTick(scoreInstructions)
    return score

def doTick(tickInstructions):
    for tickInstruction in tickInstructions:
        tempSolveInstruction = tickInstructions[tickInstruction]
        tempValue = tempSolveInstruction['value']
        tempForward = tempSolveInstruction['forward']
        tempIndex = tempSolveInstruction['scannerIndex']

        if tempValue > 0:
            if tempForward:
                if tempIndex >= (tempValue - 1):
                    tempForward = False
                    tempIndex -= 1
                else:
                    tempIndex += 1
            else:
                if tempIndex <= 0:
                    tempForward = True
                    tempIndex += 1
                else:
                    tempIndex -= 1
        tickInstructions[tickInstruction] = {
            'value': tempValue,
            'scannerIndex': tempIndex,
            'forward': tempForward
        }
    return tickInstructions

#testOneResult = solve(open("2017/13test.txt", "r").read())
#print(testOneResult, testOneResult == 10)
print(solve(open("2017/13.txt", "r").read()))


