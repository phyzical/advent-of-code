from helpers import is_number
def solve(input):
    lines = input.splitlines()
    letters = 'abcdefghijklmnopqrstuvwxyz'
    items1 = {}
    items2 = {}
    for num in range(len(letters)):
        items1[letters[num]] = 0
    items1['p'] = 0
    for num in range(len(letters)):
        items2[letters[num]] = 0
    items2['p'] = 1
    items1Queue = []
    items2Queue = []
    currentIndex1 = 0
    currentIndex2 = 0
    deadLocked1 = False
    deadLocked2 = False
    count = 0
    while True:
        if currentIndex1 >= 0 and currentIndex1 < len(lines):
            line = lines[currentIndex1]
            splitLine = line.split(" ")
            command = splitLine[0]
            key = splitLine[1]
            value = 0
            if len(splitLine) == 3:
                if is_number(splitLine[2]):
                    value = int(splitLine[2])
                else:
                    value = items1[splitLine[2]]
            if command == 'set':
                items1[key] = value
            if command == 'add':
                items1[key] += value
            if command == 'mul':
                items1[key] *= value
            if command == 'mod':
                items1[key] = items1[key] % value
            if command == 'snd':
                items2Queue.append(items1[key])
            if command == 'jgz':
                 if (is_number(key) and int(key) > 0) or items1[key] > 0:
                    currentIndex1 += value
                 else:
                    currentIndex1 += 1
            else:
                if command != 'rcv' or (command == 'rcv' and len(items1Queue) > 0 ):
                    currentIndex1 += 1
            if command == 'rcv':
                if len(items1Queue) > 0:
                    items1[key] = items1Queue[0]
                    items1Queue = items1Queue[1:]
                else:
                    deadLocked1 = True

        if currentIndex2 >= 0 and currentIndex2 < len(lines):
            line = lines[currentIndex2]
            splitLine = line.split(" ")
            command = splitLine[0]
            key = splitLine[1]
            value = 0
            if len(splitLine) == 3:
                if is_number(splitLine[2]):
                    value = int(splitLine[2])
                else:
                    value = items2[splitLine[2]]
            if command == 'set':
                items2[key] = value
            if command == 'add':
                items2[key] += value
            if command == 'mul':
                items2[key] *= value
            if command == 'mod':
                items2[key] = items2[key] % value
            if command == 'snd':
                items1Queue.append(items2[key])
                count += 1
            if command == 'jgz':
                 if (is_number(key) and int(key) > 0) or items2[key] > 0:
                    currentIndex2 += value
                 else:
                    currentIndex2 += 1
            else:
                if command != 'rcv' or (command == 'rcv' and len(items2Queue) > 0 ):
                    currentIndex2 += 1
            if command == 'rcv':
                if len(items2Queue) > 0:
                    items2[key] = items2Queue[0]
                    items2Queue = items2Queue[1:]
                else:
                    deadLocked2 = True
        print(deadLocked1, deadLocked2)
        if  deadLocked1 and deadLocked2:
            break
    return count
testOneResult = solve(open("2017/18test.txt", "r").read())
print(testOneResult, testOneResult == 3)
print(solve(open("2017/18.txt", "r").read()))

