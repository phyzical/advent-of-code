def solve(size,input):
    lengths = input.split(',')
    resultArray = range(size)
    currentIndex = 0
    skipSize = 0
    for length in lengths:
        length = int(length)
        section = []
        for item in range(length):
            index = currentIndex + item
            if index >= size:
                index = index - size
            section.append(resultArray[index])
        section.reverse()
        for item in range(length):
            index = currentIndex + item
            if index >= size:
                index = index - size
            resultArray[index] = section[item]
        currentIndex += length + skipSize
        if currentIndex >= size:
            currentIndex = currentIndex - size
        skipSize += 1
    print(resultArray)
    print(resultArray[0] * resultArray[1] )


solve(5,"3,4,1,5")
solve(256,open("2017/10.txt", "r").read())

