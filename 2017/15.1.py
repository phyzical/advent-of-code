from helpers import decimalToBinary
def solve(input):
    inputSplit = input.split(',')
    aStart = int(inputSplit[0])
    bStart = int(inputSplit[1])
    aFactor = 16807
    bFactor = 48271
    divider = 2147483647
    count = 0
    for num in range(40000000):
        aStart = (aStart * aFactor) % divider
        bStart = (bStart * bFactor) % divider
        aString = decimalToBinary(aStart)
        bString = decimalToBinary(bStart)
        if  aString[-16:] == bString[-16:]:
            count += 1
        if num % 1000000 == 0:
            print(num/1000000)
    return count

testOneResult = solve("65,8921")
print(testOneResult, testOneResult == 588)
print(solve("516,190"))

