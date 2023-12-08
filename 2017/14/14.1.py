from tenTwo import solve
from helpers import hexToBinary
def solve2(input):
    rows = []
    for num in range(128):
        rows.append(hexToBinary(solve(256, input +'-'+ str(num))))
    count = 0
    for row in rows:
        count += row.count('1')
    return count
testOneResult = solve2("flqrgnkx")
print(testOneResult, testOneResult == 8108)
print(solve2("jzgqcdpd"))


