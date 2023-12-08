def solve(input):
    found = False
    grid = [[1]]
    currentX = 0
    currentY = 0
    direction = 'right'
    if currentX - 1 < 0 or currentX + 1 >= len(grid[0]):
        currentX += 1
        for row in grid:
            row.append(0)
            row.insert(0,0)
        if currentY - 1 < 0 or currentY + 1 >= len(grid[0]):
            currentY += 1
            grid.append([0] * len(grid[0]))
            grid.insert(0,[0] * len(grid[0]))
    directionCount = 1
    loopCount = 1
    i = 0
    while True:
        i += 1
        if direction == 'right':
            currentX += 1
            if directionCount >= loopCount:
                direction = 'up'
                directionCount = 0
                loopCount += 2
        elif direction == 'left':
            currentX -= 1
            if directionCount >= loopCount - 1:
                direction = 'down'
                directionCount = 0
        elif direction == 'up':
            currentY -= 1
            if directionCount >= loopCount - 2:
                direction = 'left'
                directionCount = 0
        else:
            currentY += 1
            if directionCount >= loopCount - 1:
                direction = 'right'
                directionCount = 0

        directionCount += 1
        if currentX - 1 < 0 or currentX + 1 >= len(grid[0]):
            currentX += 1
            for row in grid:
                row.append(0)
                row.insert(0,0)
        if currentY - 1 < 0 or currentY + 1 >= len(grid[0]):
            currentY += 1
            grid.append([0] * len(grid[0]))
            grid.insert(0,[0] * len(grid[0]))

        leftElement = grid[currentY][currentX-1]
        topLeftElement = grid[currentY-1][currentX-1]
        topElement = grid[currentY-1][currentX]
        topRightElement = grid[currentY-1][currentX+1]
        rightElement = grid[currentY][currentX+1]
        bottomRightElement = grid[currentY+1][currentX+1]
        bottomElement = grid[currentY+1][currentX]
        bottomLeftElement = grid[currentY+1][currentX-1]
        res = leftElement + topLeftElement + topElement + topRightElement + rightElement + bottomLeftElement + bottomRightElement + bottomElement
        grid[currentY][currentX] = res
        if res > input:
            return res



print(solve(289326))


#[89204,  89204, 89204, 89204, 89204, 89204, 89204, 44602]
#[180568,      0,     0,     0,     0,     0,     0, 44602]
#[187112,   2160,  2160,  2160,  2160,  2160,  1080, 43522]
#[198236,   4384,     0,     0,     0,     0,  1080, 41362]
#[212119,   4580,    64,    64,    64,    32,  1048, 38154]
#[226966,   4919,   132,     0,     0,    32,   984, 35042]
#[242878,   5348,   143,     4,     2,    30,   890, 32120]
#[253871, 513696, 11456, 11972, 12407, 13758, 14678, 15568]
