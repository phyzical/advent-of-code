def solve(input):
    rows = input.splitlines()
    grid = []
    centerX = 0
    centerY = (len(rows)-1)/2
    for row in rows:
        tempRow = []
        centerX = (len(row)-1)/2
        for char in row:
            tempRow.append(char)
        grid.append(tempRow)
    direction = 'up'
    currentX = centerX
    currentY = centerY
    count = 0
    i = 0
    while i < 10000:
        i += 1
        currentNode = grid[currentY][currentX]
        if currentNode == '.':
            if direction == 'up':
                direction = 'left'
            elif direction == 'left':
                direction = 'down'
            elif direction == 'down':
                direction = 'right'
            else:
                direction = 'up'
            count += 1
            grid[currentY][currentX] = '#'
        else:
            if direction == 'up':
                direction = 'right'
            elif direction == 'right':
                direction = 'down'
            elif direction == 'down':
                direction = 'left'
            else:
                direction = 'up'
            grid[currentY][currentX] = '.'
        if direction == 'up':
            currentY -= 1
        elif direction == 'right':
            currentX += 1
        elif direction == 'down':
            currentY += 1
        else:
            currentX -= 1
        if currentX < 0 or currentX >= len(grid[0]):
            currentX += 1
            for row in grid:
                row.append('.')
                row.insert(0,'.')
        elif currentY < 0 or currentY >= len(grid):
            currentY += 1
            grid.append(['.'] * len(grid[0]))
            grid.insert(0,['.'] * len(grid[0]))
    return count



testOneResult = solve(open("2017/22test.txt", "r").read())
print(testOneResult, testOneResult == 5587)
print(solve(open("2017/22.txt", "r").read()))