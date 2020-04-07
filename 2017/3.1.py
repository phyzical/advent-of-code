def solve(input):
    found = False
    rowSize = 1
    while found == False:
        if input <= (rowSize * rowSize):
            found = True
        else:
            rowSize += 2
    total = rowSize * rowSize
    rowSizeTrimmed = rowSize - 1
    rowSizeTrimmedTrimmed = rowSizeTrimmed - 1
    bottomStart = total #25
    bottomEnd = total - rowSizeTrimmedTrimmed #22
    leftStart = total - rowSizeTrimmed #21
    leftEnd = total - rowSizeTrimmed - rowSizeTrimmedTrimmed #18
    topStart = total - rowSizeTrimmed - rowSizeTrimmed #17
    topEnd = total - rowSizeTrimmed - rowSizeTrimmed - rowSizeTrimmedTrimmed #14
    rightStart = total - rowSizeTrimmed - rowSizeTrimmed - rowSizeTrimmed #13
    rightEnd = total - rowSizeTrimmed - rowSizeTrimmed - rowSizeTrimmed - rowSizeTrimmedTrimmed #10

    if input <= bottomStart and input > bottomEnd:
        x = rowSize  - (bottomStart - input)
        y = rowSize
    elif input <= leftStart and input > leftEnd:
        y = rowSize - (leftStart - input)
        x = 1
    elif input <= topStart and input > topEnd:
        x = topStart - input + 1
        y = 1
    elif input <= rightStart and input > rightEnd:
        x = rowSize
        y = rightStart - input + 1

    centerX = ((rowSize-1)/2)+1
    centerY = ((rowSize-1)/2)+1

    print(x,y, centerX, centerY)

    print(abs(x-centerX) + abs(y-centerY))

solve(289326)

# 37 36  35  34  33  32  31
# 38 17  16  15  14  13  30
# 39 18   5   4   3  12  29
# 40 19   6   1   2  11  28
# 41 20   7   8   9  10  27
# 42 21  22  23  24  25  26
# 43 44  45  46  47  48  49