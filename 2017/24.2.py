from copy import copy
def solve(input):
    lines = input.splitlines()
    results = {}
    for index,line in enumerate(lines):
        if line.split('/')[0] == '0':
            results[index] = line
        elif line.split('/')[1] == '0':
            results[index] = (line.split('/')[1]+'/'+line.split('/')[0])
    bridges = []
    for result in results:
        lineCopy = copy(lines)
        currentIndex = int(result)
        currentString = results[result]
        bridges.append(currentString)
        findNext(lineCopy,currentIndex,bridges,currentString,currentString)

    maxBridgeLength = 0
    maxBridge = 0
    for bridge in bridges:
        bridgeTotal = 0
        bridgeSplits = bridge.split('--')
        for splits in bridgeSplits:
            for split in splits.split('/'):
                bridgeTotal += int(split)
        if len(bridgeSplits) > maxBridgeLength:
            maxBridgeLength = len(bridgeSplits)
            maxBridge = bridgeTotal
        elif len(bridgeSplits) == maxBridgeLength and bridgeTotal > maxBridge:
            bridgeTotal = maxBridge
    return maxBridge

def findNext(lineCopy,currentIndex,bridges,currentString,nextElement):
    lineCopy.pop(currentIndex)
    nextKey = nextElement.split('/')[1]
    applicableIndexes = {}
    for index,line in enumerate(lineCopy):
        lineSplit = line.split('/')
        if lineSplit[0] == nextKey:
            applicableIndexes[index] = line
        elif lineSplit[1] == nextKey:
            applicableIndexes[index] = line.split('/')[1]+'/'+line.split('/')[0]
    for applicableIndex in applicableIndexes:
         bridges.append(currentString +'--'+ applicableIndexes[applicableIndex])
         findNext(copy(lineCopy),applicableIndex,bridges,currentString +'--'+ applicableIndexes[applicableIndex],applicableIndexes[applicableIndex])

testOneResult = solve(open("2017/24test.txt", "r").read())
print(testOneResult, testOneResult == 19)
print(solve(open("2017/24.txt", "r").read()))

