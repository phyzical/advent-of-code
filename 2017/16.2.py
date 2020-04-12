from helpers import decimalToBinary
def solve(size,input):
    inputSplits = input.split(',')
    letters = 'abcdefghijklmnopqrstuvwxyz'
    solveWord = ''
    for num in range(size):
        solveWord += letters[num]
    solveWord = list(solveWord)
    i = 0
    while i < 1000000000:
        for inputSplit in inputSplits:
            move = inputSplit
            if move[0] == 's':
                spinSize = move[1:]
                for num in range(int(spinSize)):
                    solveWord.insert(0,solveWord.pop())
            elif move[0] == 'x':
                swapIndexes = move[1:].split('/')
                swapAIndex = int(swapIndexes[0])
                swapBIndex = int(swapIndexes[1])
                swapA = solveWord[swapAIndex]
                swapB = solveWord[swapBIndex]
                solveWord[swapAIndex] = swapB
                solveWord[swapBIndex] = swapA
            elif move [0] == 'p':
                swapNames = move[1:].split('/')
                swapAIndex = 0
                swapBIndex = 0
                swapA = swapNames[0]
                swapB = swapNames[1]
                for index, char in enumerate(solveWord):
                    if char == swapA:
                        swapAIndex = index
                    if char == swapB:
                        swapBIndex = index
                solveWord[swapBIndex] = swapA
                solveWord[swapAIndex] = swapB
        if i % 1000 == 0:
            print(i)
        i += 1
    result = ''
    for char in solveWord:
        result += char
    return result

print(solve(16,open("2017/16.txt", "r").read()))

