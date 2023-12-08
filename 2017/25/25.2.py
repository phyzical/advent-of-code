def solve(input):
    lines = input.splitlines()
    values = ['0']
    currentIndex = 0
    startingState = lines[0][len(lines[0])-2]
    checksumStepAmount = lines[1].split('after ')[1].split(' steps')[0]
    rules = {}
    for index,line in enumerate(lines):
        if line == '':
            stateKey = lines[index+1][len(lines[index+1])-2]
            zeroWriteValue = lines[index+3].split("value ")[1].split('.')[0]
            zeroDirection = lines[index+4].split("the ")[1].split('.')[0]
            zeroNextKey = lines[index+5][len(lines[index+5])-2]
            oneWriteValue = lines[index+7].split("value ")[1].split('.')[0]
            oneDirection = lines[index+8].split("the ")[1].split('.')[0]
            oneNextKey = lines[index+9][len(lines[index+9])-2]
            rules[stateKey] = {
                'zeroWriteValue': zeroWriteValue,
                'zeroDirection':zeroDirection,
                'zeroNextKey':zeroNextKey,
                'oneWriteValue':oneWriteValue,
                'oneDirection':oneDirection,
                'oneNextKey':oneNextKey,
            }
    i = 0
    currentState = startingState
    while i < int(checksumStepAmount):
        i += 1
        currentRule = rules[currentState]
        currentValue = values[currentIndex]
        if currentValue == '0':
            values[currentIndex] = currentRule['zeroWriteValue']
            if currentRule['zeroDirection'] == 'right':
                currentIndex += 1
            else:
                currentIndex -= 1
            currentState = currentRule['zeroNextKey']
        else:
            values[currentIndex] = currentRule['oneWriteValue']
            if currentRule['oneDirection'] == 'right':
                currentIndex += 1
            else:
                currentIndex -= 1
            currentState = currentRule['oneNextKey']
        if currentIndex < 0 or currentIndex >= len(values):
            values.append('0')
            values.insert(0,'0')
            currentIndex += 1
    return values.count('1')



testOneResult = solve(open("2017/25test.txt", "r").read())
print(testOneResult, testOneResult == 3)
print(solve(open("2017/25.txt", "r").read()))

