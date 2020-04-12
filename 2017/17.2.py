def solve(input):
    steps = int(input)
    items = [0]
    currentIndex = 0
    for num in range(50000000):
        if num > 0:
            for num2 in range(steps):
                currentIndex += 1
                if currentIndex == len(items):
                    currentIndex = 0
            currentIndex += 1
            items.insert(currentIndex,num)
        if num % 10000 == 0:
            print(num/10000)
    for index,item in enumerate(items):
        if item == 0:
            return items[index+1]

print(solve("355"))

