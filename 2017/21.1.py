from helpers import batchList
def solve(iterations, input):
    rules = input.splitlines()
    cleanedRules = {}
    for rule in rules:
        cleanedRule = rule.split(' => ')
        rule = cleanedRule[0]
        if len(rule.split("/")[0]) == 2:
            #A1,B1/A2,B2
            #B2,A1/B1,A2
            #A2,B2/A1,B1
            #B1,A2/B2,A1
            tempRule = rule.split("/")
            A = tempRule[0]
            B = tempRule[1]
            A1 = A[0]
            A2 = A[1]
            B1 = B[0]
            B2 = B[1]
            cleanedRules[rule] = cleanedRule[1]
            cleanedRules[B2 + A1 + '/' + B1 + A2] = cleanedRule[1]
            cleanedRules[A2 + B2 + '/' + A1 + B1] = cleanedRule[1]
            cleanedRules[B1 + A2 + '/' + B2 + A1] = cleanedRule[1]
            A = A[::-1]
            B = B[::-1]
            A1 = A[0]
            A2 = A[1]
            B1 = B[0]
            B2 = B[1]
            cleanedRules[A + '/' + B] = cleanedRule[1]
            cleanedRules[B2 + A1 + '/' + B1 + A2] = cleanedRule[1]
            cleanedRules[A2 + B2 + '/' + A1 + B1] = cleanedRule[1]
            cleanedRules[B1 + A2 + '/' + B2 + A1] = cleanedRule[1]
            AFlipVert = B[0]+B[1]
            BFlipVert = A[0]+A[1]
            A1 = AFlipVert[0]
            A2 = AFlipVert[1]
            B1 = BFlipVert[0]
            B2 = BFlipVert[1]
            cleanedRules[AFlipVert + '/' + BFlipVert] = cleanedRule[1]
            cleanedRules[B2 + A1 + '/' + B1 + A2] = cleanedRule[1]
            cleanedRules[A2 + B2 + '/' + A1 + B1] = cleanedRule[1]
            cleanedRules[B1 + A2 + '/' + B2 + A1] = cleanedRule[1]
        else:
            # a1 b1 c1
            # a2 b2 c2
            # a3 b3 c3
            #A1,B1,C1/A2,B2,C2/A3,B3,C3
            # a3 a2 a1
            # b3 b2 b1
            # c3 c2 c1
            #A3,A2,A1/B3,B2,B1/C3,C2,C1
            # c3 b3 a3
            # c2 b2 a2
            # c1 b1 a1
            #C3,B3,A3/C2,B2,A2/C1,B1,A1
            # c1 c2 c3
            # b1 b2 b3
            # a1 a2 a3
            #C1,C2,C3/B1,B2,B3/A1,A2,A3
            tempRule = rule.split('/')
            A = tempRule[0]
            B = tempRule[1]
            C = tempRule[2]
            A1 = A[0]
            A2 = A[1]
            A3 = A[2]
            B1 = B[0]
            B2 = B[1]
            B3 = B[2]
            C1 = C[0]
            C2 = C[1]
            C3 = C[2]
            cleanedRules[rule] = cleanedRule[1]
            cleanedRules[A3 + A2 + A1 + '/' + B3 + B2 + B1 + '/' + C3 + C2 + C1] = cleanedRule[1]
            cleanedRules[C3 + B3 + A3 + '/' + C2 + B2 + A2 + '/' + C1 + B1 + A1] = cleanedRule[1]
            cleanedRules[C1 + C2 + C3 + '/' + B1 + B2 + B3 + '/' + A1 + A2 + A3] = cleanedRule[1]
            AFlipHori = A[::-1]
            BFlipHori = B[::-1]
            CFlipHori = C[::-1]
            A1 = AFlipHori[0]
            A2 = AFlipHori[1]
            A3 = AFlipHori[2]
            B1 = BFlipHori[0]
            B2 = BFlipHori[1]
            B3 = BFlipHori[2]
            C1 = CFlipHori[0]
            C2 = CFlipHori[1]
            C3 = CFlipHori[2]
            cleanedRules[AFlipHori + '/' + BFlipHori + '/' + CFlipHori] = cleanedRule[1]
            cleanedRules[A3 + A2 + A1 + '/' + B3 + B2 + B1 + '/' + C3 + C2 + C1] = cleanedRule[1]
            cleanedRules[C3 + B3 + A3 + '/' + C2 + B2 + A2 + '/' + C1 + B1 + A1] = cleanedRule[1]
            cleanedRules[C1 + C2 + C3 + '/' + B1 + B2 + B3 + '/' + A1 + A2 + A3] = cleanedRule[1]
            AFlipVert = C[0]+C[1]+C[2]
            BFlipVert = B[0]+B[1]+B[2]
            CFlipVert = A[0]+A[1]+A[2]
            A1 = AFlipVert[0]
            A2 = AFlipVert[1]
            A3 = AFlipVert[2]
            B1 = BFlipVert[0]
            B2 = BFlipVert[1]
            B3 = BFlipVert[2]
            C1 = CFlipVert[0]
            C2 = CFlipVert[1]
            C3 = CFlipVert[2]
            cleanedRules[AFlipVert + '/' + BFlipVert + '/' + CFlipVert] = cleanedRule[1]
            cleanedRules[A3 + A2 + A1 + '/' + B3 + B2 + B1 + '/' + C3 + C2 + C1] = cleanedRule[1]
            cleanedRules[C3 + B3 + A3 + '/' + C2 + B2 + A2 + '/' + C1 + B1 + A1] = cleanedRule[1]
            cleanedRules[C1 + C2 + C3 + '/' + B1 + B2 + B3 + '/' + A1 + A2 + A3] = cleanedRule[1]
    grid = '.#./..#/###'
    #    #..#/..../..../#..#
    for i in range(iterations):
        print(i, grid)
        splitGrids = grid.split('/')
        gridSplit = 0
        if len(splitGrids[0]) % 2 == 0:
            gridSplit = 2
        else:
            gridSplit = 3
        y = 0
        newGrids = []
        for splitGrid in splitGrids:
            newGrids.append([])
        for splitGrid in splitGrids:
            index = 0
            for num in range(len(splitGrid)/gridSplit):
                newGrids[y].append(splitGrid[index:gridSplit+index])
                index += gridSplit
            y += 1
        print(newGrids)
        tempGrid = []
        for num in range(len(newGrids[0])):
            rule = ''
            currentGrid = ['','','']
            for index, newGrid in enumerate(newGrids):
                index += 1
                rule += newGrid[num] + '/'
                if index % gridSplit == 0:
                    rule = rule[:len(rule)-1]
                    cleanedSplit = cleanedRules[rule].split("/")
                    if len(cleanedSplit) == 4:
                        currentGrid = ['','','','']
                    currentGrid[0] += cleanedSplit[0]
                    currentGrid[1] += cleanedSplit[1]
                    currentGrid[2] += cleanedSplit[2]
                    if len(cleanedSplit) == 4:
                        currentGrid[3] += cleanedSplit[3]
                    rule = ''
            tempGrid += currentGrid
        grid = ''
        for gridItem in tempGrid:
            grid += gridItem + '/'
        grid = grid[:len(rule)-1]
    return grid.count('#')

#     ..#   #..   ###
#     ..#   #.#   ##.
#     ##.   .#.   .#.

#     #..   ###   ###
#     #.#   ...   ##.
#     .#.   #..   .#.

#     ###   ..#   ###
#     ##.   ..#   ##.
#     .#.   ##.   .#.





testOneResult = solve(2,open("2017/21test.txt", "r").read())
print(testOneResult, testOneResult == 12)
print(solve(5,open("2017/21.txt", "r").read()))

