from helpers import  rotate90
from functools import reduce
def prepareInputs(filename):
    return map( 
        (lambda x: map( (lambda y:  map( (lambda z:list(z)), y.split("/"))), x.split(" => ") )),
         open(filename, "r").read().splitlines()
    )

def getPossiblePatterns(rule):
    rules = []
    result = rule[0]
    rule = rule[1]
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
        rules.append([rule[0].reverse(), rule[1].reverse(), rule[2].reverse()])
    else:
        rules.append([rule[0].reverse(), rule[1].reverse()])
    return {"result":result, "rules": rules}

def findMatchingRules(rules, grid):
    for rule in rules:
        try:
            toString = lambda acc,x: acc + "".join(x)
            stringRules = map(toString, rule["rules"])
            print(stringRules)
            # problems around here somehwere
            stringRules.index(reduce(toString,grid, ""))
        except:
            a =""
        else:
            return rule["result"]
    

def solve(filename, iterations):
    rules = prepareInputs(filename)
    rules = map(getPossiblePatterns, rules)
    grid = [".#.",
            "..#",
            "###"]
    grid = map( (lambda z:list(z)), grid)

    grids = []
    for iteration in range(0,iterations - 1):
        even = (len(grid[0]) %  2) == 0
        if even:
            for y in range(0,len(grid)-1):
                for x in range(0,len(grid[0])-1):
                  
                    grids.append(findMatchingRules(rules,[
                        [grid[y][x], grid[y][x+1]],
                        [grid[y+1][x], grid[y+1][x+1]]
                    ]))
        else:
            for y in range(0,len(grid)-2):
                for x in range(0,len(grid[0])-2):
                    print([
                       [grid[y][x], grid[y][x+1], grid[y][x+2]],
                        [grid[y+1][x], grid[y+1][x+1], grid[y+1][x+2]],
                        [grid[y+2][x], grid[y+2][x+1], grid[y+2][x+2]]
                    ])
                    print(rules)

                    grids.append(findMatchingRules(rules,[
                        [grid[y][x], grid[y][x+1], grid[y][x+2]],
                        [grid[y+1][x], grid[y+1][x+1], grid[y+1][x+2]],
                        [grid[y+2][x], grid[y+2][x+1], grid[y+2][x+2]]
                    ]))
        
        print(grids)
        



testOneResult = solve("2017/22test.txt", 2)
print(testOneResult, testOneResult == 12)
# print(solve("2017/22.txt"), 5)

