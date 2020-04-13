from helpers import is_number
def solve(input):
    lines = input.splitlines()
    letters = 'abcdefgh'
    items = {}
    for num in range(len(letters)):
        items[letters[num]] = 0
    items['a'] = 1
    currentIndex = 0
    i = 1
    count = 0
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
        if command == 'sub':
            items[key] -= value
        if command == 'mul':#-109894
            count += 1
            items[key] *= value
        if command == 'jnz':
             if (is_number(key) and key != 0) or items[key] != 0:
                currentIndex += value
             else:
                currentIndex += 1
        else:
            currentIndex += 1
    return items['h']

print(solve(open("2017/23.txt", "r").read()))

