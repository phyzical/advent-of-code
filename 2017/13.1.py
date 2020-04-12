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
    currentIndex = 0
    score = 0
    while currentIndex < len(solveInstructions):
        currentInstruction = solveInstructions[currentIndex]
        if currentInstruction['value'] > 0 and currentInstruction['scannerIndex'] == 0:
            score += (currentInstruction['value'] * currentIndex)
        currentIndex += 1
        ## do tick
        for solveInstruction in solveInstructions:
            tempSolveInstruction = solveInstructions[solveInstruction]
            if tempSolveInstruction['value'] > 0:
                if tempSolveInstruction['forward']:
                    if tempSolveInstruction['scannerIndex'] >= (tempSolveInstruction['value'] - 1):
                        tempSolveInstruction['forward'] = False
                        tempSolveInstruction['scannerIndex'] -= 1
                    else:
                        tempSolveInstruction['scannerIndex'] += 1
                else:
                    if tempSolveInstruction['scannerIndex'] <= 0:
                        tempSolveInstruction['forward'] = True
                        tempSolveInstruction['scannerIndex'] += 1
                    else:
                        tempSolveInstruction['scannerIndex'] -= 1
            solveInstructions[solveInstruction] = tempSolveInstruction
    return score


testOneResult = solve(open("2017/13test.txt", "r").read())
print(testOneResult, testOneResult == 24)
print(solve(open("2017/13.txt", "r").read()))


