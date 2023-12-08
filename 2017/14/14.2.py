from tenTwo import solve
import sys
from helpers import hexToBinary
def solve2(input):
    rows = []
    for num in range(128):
        rows.append(hexToBinary(solve(256, input +'-'+ str(num))))
    count = 0
    squares = {}
    for index,row in enumerate(rows):
        for index2,rowChar in  enumerate(row):
            squares[str(index)+'-'+str(index2)] = {
                "value": rowChar,
                "group": 0
            }
    count = 0
    for row in rows:
        count += row.count('1')
    group = 1
    for y in range(128):
        for x in range(128):
           found = markSquare(squares,x,y,squares[str(x)+'-'+str(y)], group)
           if found == True:
                group += 1
    return group - 1
#    # # . # # # . # # # . # # #
#    . # # # . # # # . # # # . .
## getting stuck in recursion group not making it out
def markSquare(squares,x,y,square,group):
    if square['value'] == '1' and square['group'] == 0:
        ## these are previous
        square['group'] = group
        if x > 0:
            leftSquare = squares[str(x-1)+'-'+str(y)]
            if leftSquare['value'] == '1':
                markSquare(squares,x-1,y,leftSquare,group)
        if y > 0:
            topSquare = squares[str(x)+'-'+str(y-1)]
            if topSquare['value'] == '1':
                markSquare(squares,x,y-1,topSquare,group)
        ## these are future
        if x < 128 - 1:
            rightSquare = squares[str(x+1)+'-'+str(y)]
            if rightSquare['value'] == '1':
                markSquare(squares,x+1,y,rightSquare,group)
        if y < 128 - 1:
            bottomSquare = squares[str(x)+'-'+str(y+1)]
            if bottomSquare['value'] == '1':
                markSquare(squares,x,y+1,bottomSquare,group)
        return True

testOneResult = solve2("flqrgnkx")
print(testOneResult, testOneResult == 1242)
print(solve2("jzgqcdpd"))


