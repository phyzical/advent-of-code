from helpers import asciiToDecimal, toHex, batchList

def solve(size,input):
    lengths = asciiToDecimal(input)
    lengthSuffix = [17, 31, 73, 47, 23]
    lengths += lengthSuffix
    resultArray = range(size)
    currentIndex = 0
    skipSize = 0
    roundCount = 0
    while roundCount < 64:
        for length in lengths:
            length = int(length)
            section = []
            for item in range(length):
                index = currentIndex + item
                while index >= size:
                    index = index - size
                section.append(resultArray[index])
            section.reverse()
            for item in range(length):
                index = currentIndex + item
                while index >= size:
                    index = index - size
                resultArray[index] = section[item]
            currentIndex += length + skipSize
            while currentIndex >= size:
                currentIndex = currentIndex - size
            skipSize += 1
        roundCount += 1
    denseHash = []
    for sparseCharList in batchList(resultArray,16):
        denseHashChar = int(sparseCharList[0])
        for index, sparseChar in enumerate(sparseCharList):
            if index > 0:
                denseHashChar = denseHashChar ^ int(sparseChar)
        denseHash.append(denseHashChar)
    hexString = ''
    for denseHashChar in denseHash:
        denseHashChar = toHex(denseHashChar)
        if len(denseHashChar) < 2:
            denseHashChar = '0' + denseHashChar
        hexString += denseHashChar
    return hexString






testOneResult = solve(256,"").lower()
print(testOneResult, testOneResult == "a2582a3a0e66e6e86e3812dcb672a272")
testTwoResult = solve(256,"AoC 2017").lower()
print(testTwoResult,testTwoResult == "33efeb34ea91902bb2f59c9920caa6cd")
testThreeResult = solve(256,"1,2,3").lower()
print(testThreeResult, testThreeResult == "3efbe78a8d82f29979031a4aa0b16a9d")
testFourResult = solve(256,"1,2,4").lower()
print(testFourResult, testFourResult == "63960835bcdc130f0b66d7ff4f6a5a8e")
print(solve(256,open("2017/10.txt", "r").read()).lower())