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
    for instruction in instructions:
        if instruction == 'n':
            counts['n'] += 0.5
        elif instruction == 'ne':
            counts['ne'] +=  0.5
        elif instruction == 'nw':
            counts['nw'] +=  0.5
        elif instruction == 's':
            counts['s'] +=  0.5
        elif instruction == 'se':
            counts['se'] +=  0.5
        elif instruction == 'sw':
            counts['sw'] +=  0.5
    x=0
    y=0
    y += counts['n']- counts['s']
    y += counts['nw']- counts['se']
    x -= counts['nw']- counts['se']
    x += counts['ne']- counts['sw']
    y += counts['ne']- counts['sw']
    print(counts,x,y)
    return(abs(y + x))

testOneResult = int(solve("ne,ne,ne"))
print(testOneResult, testOneResult == 3)
testTwoResult = int(solve("ne,ne,sw,sw"))
print(testTwoResult, testTwoResult == 0)
testThreeResult = int(solve("ne,ne,s,s"))
print(testThreeResult, testThreeResult == 2)
testFourResult = int(solve("se,sw,se,sw,sw"))
print(testFourResult, testFourResult == 3)
# print(solve(open("2017/11.txt", "r").read()))

