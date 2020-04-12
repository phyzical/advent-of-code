def solve(input):
    steps = int(input)
    items = [0]
    currentIndex = 0
    for num in range(2018):
        if num > 0:
            for num2 in range(steps):
                currentIndex += 1
                if currentIndex == len(items):
                    currentIndex = 0
            currentIndex += 1
            items.insert(currentIndex,num)
    return items[currentIndex+1]

testOneResult = solve("3")
print(testOneResult, testOneResult == 638)
print(solve("355"))

