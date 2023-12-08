def solve(input):
    lines = input.splitlines()
    maxLength = 0
    for line in lines:
        if len(line) > maxLength:
            maxLength = len(line)
    for index, line in enumerate(lines):
        for num in range(maxLength - len(line)):
            lines[index] += ' '
    currentX = lines[0].index('|')
    currentY = 0
    atExit = False
    string = ''
    lastDirection = 'down'
    previousX = 0
    previousY = 0
    previousPreviousX = 0
    previousPreviousY = 0
    i = 0
    while atExit == False:
        i += 1
        previousChar = lines[previousY][previousX]
        inputChar = lines[currentY][currentX]
        previousPreviousChar = lines[previousPreviousY][previousPreviousX]
        previousPreviousX = previousX
        previousPreviousY = previousY
        previousX = currentX
        previousY = currentY
        if inputChar == '|':
            if previousChar.isalpha() == True and previousPreviousChar == '-' and (lastDirection == 'left' or lastDirection == 'right'):
                if lastDirection == 'right':
                    currentX += 1
                else:
                    currentX -= 1
            elif previousChar == '-' and (lastDirection == 'left' or lastDirection == 'right'):
                if lastDirection == 'right':
                    currentX += 1
                else:
                    currentX -= 1
            else:
                if lastDirection == 'down':
                    currentY += 1
                else:
                    currentY -= 1
        elif inputChar == '+':
            res = findNextSquareIndex(lines,lastDirection,currentX,currentY)
            currentX = res['x']
            currentY = res['y']
            lastDirection = res['direction']
        elif inputChar == '-':
            if previousChar.isalpha() == True and previousPreviousChar == '|' and (lastDirection == 'up' or lastDirection == 'down'):
                if lastDirection == 'down':
                    currentY += 1
                else:
                    currentY -= 1
            elif previousChar == '|' and (lastDirection == 'up' or lastDirection == 'down'):
                if lastDirection == 'down':
                    currentY += 1
                else:
                    currentY -= 1
            else:
                if lastDirection == 'right':
                    currentX += 1
                else:
                    currentX -= 1
        elif inputChar.isalpha() == True:
            string += inputChar
            res = findNextSquareIndex(lines,lastDirection,currentX,currentY)
            currentX = res['x']
            currentY = res['y']
            lastDirection = res['direction']
            if lastDirection == 'Exit':
                atExit = True
    return i
def findNextSquareIndex(squares,lastDirection,x,y):
    #dont check other side
    downX = x
    downY = y + 1
    upX = x
    upY = y - 1
    leftX = x - 1
    leftY = y
    rightX = x + 1
    rightY = y
    up = ' '
    if upY >= 0:
        up  = squares[upY][upX]
    down = ' '
    if downY < len(squares):
        down  = squares[downY][downX]
    left = ' '
    if leftX >= 0:
        left = squares[leftY][leftX]
    right = ' '
    if rightX < len(squares[rightY]):
        right  = squares[rightY][rightX]
    newX = 0
    newY = 0
    direction = 'Exit'
    if lastDirection == 'down':
        if down != ' ':
            newX = downX
            newY = downY
            direction = 'down'
        if left != ' ':
            newX = leftX
            newY = leftY
            direction = 'left'
        if right != ' ':
            newX = rightX
            newY = rightY
            direction = 'right'

    elif lastDirection == 'left':
        if down != ' ':
            newX = downX
            newY = downY
            direction = 'down'
        if left != ' ':
            newX = leftX
            newY = leftY
            direction = 'left'
        if up != ' ':
            newX = upX
            newY = upY
            direction = 'up'
    elif lastDirection == 'right':
        if down != ' ':
            newX = downX
            newY = downY
            direction = 'down'
        if right != ' ':
            newX = rightX
            newY = rightY
            direction = 'right'
        if up != ' ':
            newX = upX
            newY = upY
            direction = 'up'
    else:
        if left != ' ':
            newX = leftX
            newY = leftY
            direction = 'left'
        if right != ' ':
            newX = rightX
            newY = rightY
            direction = 'right'
        if up != ' ':
            newX = upX
            newY = upY
            direction = 'up'
    return {'x': newX, 'y': newY, 'direction': direction}
#testOneResult = solve(open("2017/19test.txt", "r").read())
#print(testOneResult, testOneResult == 38)
print(solve(open("2017/19.txt", "r").read()))

