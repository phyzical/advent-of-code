def solve(input):
    results = {}
    instructionLines = input.splitlines()
    for instructionLine in instructionLines:
        instructions = instructionLine.split()
        updateKey = instructions[0]
        inc = instructions[1]
        incAmount = instructions[2]
        conditionKey = instructions[4]
        condition = instructions[5]
        conditionAmount = int(instructions[6])
        conditionMet = False
        if results.get(conditionKey) == None:
            results[conditionKey] = 0
        if results.get(updateKey) == None:
            results[updateKey] = 0
        if condition == '!=' and results[conditionKey]  != conditionAmount:
            conditionMet = True
        elif condition == '==' and results[conditionKey]  == conditionAmount:
            conditionMet = True
        elif condition == '<' and results[conditionKey]  < conditionAmount:
            conditionMet = True
        elif condition == '<=' and results[conditionKey]  <= conditionAmount:
            conditionMet = True
        elif condition == '>' and results[conditionKey]  > conditionAmount:
            conditionMet = True
        elif condition == '>=' and results[conditionKey] >= conditionAmount:
            conditionMet = True
        if conditionMet == True:
            if inc == 'inc':
                results[updateKey] += int(incAmount)
            else:
                results[updateKey] -= int(incAmount)
    answer = 0
    for result in results:
        if results[result] > answer:
            answer = results[result]
    print(answer)

solve(open("2017/8.txt", "r").read())
