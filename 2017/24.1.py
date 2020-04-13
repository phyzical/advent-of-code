def solve(input):
    lines = input.splitlines()
    startingIndexes = []
    for index,line in enumerate(lines):
        if line.split('/')[0] == '0' or line.split('/')[1] == '0':
            startingIndexes.append(index)
    for startingIndex in startingIndexes:
        lineCopy = copy(lines)
        currentIndex = startingIndex
        while True:
            nextElement = lineCopy.pop(currentIndex)
            nextKey = startingElement.split('/')[1]
            for line in lineCopy:
                lineSplit = line.split('/')
                if lineSplit[0] == nextKey:
                elif lineSplit[1] == nextKey:



testOneResult = solve(open("2017/24test.txt", "r").read())
print(testOneResult, testOneResult == 31)
print(solve(open("2017/24.txt", "r").read()))

