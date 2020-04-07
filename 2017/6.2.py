
def solve(input):
    count = 0
    banks = input.split()
    combos = []
    found = 0
    split = (len(banks)-1)
    while found <= 1:
        currentSplit = 0
        combo = ''
        highestBank = 0
        highestIndex = 0
        for index,bank in enumerate(banks):
            combo += ' ' + str(bank)
            if int(bank) > highestBank:
                highestBank = int(bank)
                highestIndex = index
        banks[highestIndex] = 0
        while highestBank > 0:
            highestIndex += 1
            if highestIndex > (len(banks) - 1):
                highestIndex = 0
            banks[highestIndex] = int(banks[highestIndex]) + 1
            highestBank -= 1
        if combos.count(combo):
            found += 1
            if found < 2:
                combos = []
                count = 0
        combos.append(combo)
        count += 1
    print(count - 1, combo)

solve(open("2017/6.txt", "r").read())