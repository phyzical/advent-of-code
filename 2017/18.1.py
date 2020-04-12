from helpers import is_number
def solve(input):
    lines = input.splitlines()
    letters = 'abcdefghijklmnopqrstuvwxyz'
    items = {}
    for num in range(len(letters)):
        items[letters[num]] = 0
    lastPlayedSound = 0
    recoveredSound = 0
    currentIndex = 0
    i = 1
    while currentIndex < len(lines) and currentIndex >= 0:
        i += 1
        line = lines[currentIndex]
        splitLine = line.split(" ")
        command = splitLine[0]
        key = splitLine[1]
        value = 0
        if len(splitLine) == 3:
            if is_number(splitLine[2]):
                value = int(splitLine[2])
            else:
                value = items[splitLine[2]]
        if command == 'set':
            items[key] = value
        if command == 'add':
            items[key] += value
        if command == 'mul':
            items[key] *= value
        if command == 'mod':
            items[key] = items[key] % value
        if command == 'snd':
            lastPlayedSound = items[key]
        if command == 'jgz':
             if items[key] > 0:
                currentIndex += value
             else:
                currentIndex += 1
        else:
            currentIndex += 1
        if command == 'rcv':
            if items[key] > 0:
                recoveredSound = lastPlayedSound
                break
    return recoveredSound

testOneResult = solve(open("2017/18test.txt", "r").read())
print(testOneResult, testOneResult == 4)
#print(solve(open("2017/18.txt", "r").read()))

