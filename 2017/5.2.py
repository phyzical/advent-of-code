def solve(input):
    count = 0
    instructions = input.splitlines()
    currentIndex = 0
    while currentIndex <= (len(instructions) - 1) and currentIndex >= 0:
        instruction = int(instructions[currentIndex])
        if instruction >= 3:
            instructions[currentIndex] = int(instructions[currentIndex]) - 1
        else:
            instructions[currentIndex] = int(instructions[currentIndex]) + 1
        currentIndex = currentIndex + instruction
        count += 1
    print(count, currentIndex)

solve(open("2017/5.txt", "r").read())
