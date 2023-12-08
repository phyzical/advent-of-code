from helpers import  rotate90, print_grid
from functools import reduce
import copy
def prepareInputs(filename):
    return map( 
        (lambda x: map( (lambda y:  map( (lambda z:list(z)), y.split("/"))), x.split(" => ") )),
         open(filename, "r").read().splitlines()
    )

def getPossiblePatterns(rule):
    rules = []
    result = rule[1]
    rule = rule[0]
    ruleLength = len(rule)
    rules.append(rule)
    ## right
    rightRule = rotate90(rule)
    rules.append(rightRule)

    ## down
    downRule = rotate90(rightRule)
    rules.append(downRule)
    ## left
    leftRule = rotate90(downRule)
    rules.append(leftRule)
    ## flip
    if ruleLength == 3:
        rules.append([rule[2], rule[1], rule[0]])
    else:
        rules.append([rule[1], rule[0]])
    ## mirror
    if ruleLength == 3:
        rules.append([rule[0][::-1], rule[1][::-1], rule[2][::-1]])
    else:
        rules.append([rule[0][::-1], rule[1][::-1]])
    return {"result":result, "rules": rules}

def findMatchingRules(rules, grid):
    for rule in rules:
         
        stringRules = map(lambda x:  reduce(lambda acc, y:  acc + "".join(y), x, ""), rule["rules"])

        gridString = reduce(lambda acc,x: acc +  str(reduce(lambda acc2,y: acc2 +  str(y),x,"")),grid, "")

        value = next((x for x in stringRules if x == gridString), None)
        if value:
            return rule["result"]
    

def solve(filename, iterations):
    rules = prepareInputs(filename)
    rules = map(getPossiblePatterns, rules)
    grid = [".#.",
            "..#",
            "###"]
    grid = map( (lambda z:list(z)), grid)

    for iteration in range(0,iterations):
        grids = []
        even = (len(grid[0]) %  2) == 0
        print(even)

        if even:
            for y in range(0,len(grid)-1):
                for x in range(0,len(grid[0])-1):
                    matches = findMatchingRules(rules,[
                        [grid[y][x], grid[y][x+1]],
                        [grid[y+1][x], grid[y+1][x+1]]
                    ])
                    print(matches)
                    ## problems now here it find none?
                    grids.append(matches)
        else:
            for y in range(0,len(grid)-2):
                for x in range(0,len(grid[0])-2):
                    grids.append(findMatchingRules(rules,[
                        [grid[y][x], grid[y][x+1], grid[y][x+2]],
                        [grid[y+1][x], grid[y+1][x+1], grid[y+1][x+2]],
                        [grid[y+2][x], grid[y+2][x+1], grid[y+2][x+2]]
                    ]))

        print(grids)
        grid = reduce(lambda acc,x: acc + x, grids, [])   
        print(grid)

        



testOneResult = solve("2017/21test.txt", 2)
print(testOneResult, testOneResult == 12)
# print(solve("2017/21.txt"), 5)

