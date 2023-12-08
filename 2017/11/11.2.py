def solve(input):
    instructions = input.split(',')
    counts = {
        'n': 0,
        'ne': 0,
        'nw': 0,
        's': 0,
        'se': 0,
        'sw': 0,
    }
    x=0
    y=0
    highest = 0
    for instruction in instructions:
        if instruction == 'n':
            y += 1
        elif instruction == 'ne':
            y += 0.5
            x += 0.5
        elif instruction == 'nw':
            y += 0.5
            x -= 0.5
        elif instruction == 's':
            y -= 1
        elif instruction == 'se':
            x += 0.5
            y -= 0.5
        elif instruction == 'sw':
            y -= 0.5
            x -= 0.5
        distance = abs(y) + abs(x)
        if distance > highest:
            highest = distance
    return highest

testOneResult = int(solve("ne,ne,ne"))
print(testOneResult, testOneResult == 3)
testTwoResult = int(solve("ne,ne,sw,sw"))
print(testTwoResult, testTwoResult == 2)
testThreeResult = int(solve("ne,ne,s,s"))
print(testThreeResult, testThreeResult == 2)
testFourResult = int(solve("se,sw,se,sw,sw"))
print(testFourResult, testFourResult == 3)
print(solve(open("2017/11.txt", "r").read()))

