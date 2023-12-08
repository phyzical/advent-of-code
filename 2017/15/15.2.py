from helpers import decimalToBinary
def solve(input):
    inputSplit = input.split(',')
    aStart = int(inputSplit[0])
    bStart = int(inputSplit[1])
    aFactor = 16807
    bFactor = 48271
    divider = 2147483647
    count = 0
    aValues = []
    bValues = []
    i = 0
    while len(aValues) < 5000000 or len(bValues) < 5000000:
        aStart = (aStart * aFactor) % divider
        bStart = (bStart * bFactor) % divider
        if len(aValues) < 5000000 and aStart % 4 == 0:
            aValues.append(aStart)
        if len(bValues) < 5000000 and bStart % 8 == 0:
            bValues.append(bStart)
        if i % 1000000 == 0:
            print(i/1000000)
        i += 1
    for num in range(len(aValues)):
        aString = decimalToBinary(aValues[num])
        bString = decimalToBinary(bValues[num])
        if  aString[-16:] == bString[-16:]:
            count += 1
    return count

testOneResult = solve("65,8921")
print(testOneResult, testOneResult == 309)
print(solve("516,190"))

