def solve(input,targetID):
    lines = input.splitlines()
    maxPrograms = len(lines)
    nodes = []
    nodesWhereChild = {}
    for line in lines:
        lineParts = line.split(' <-> ')
        nodeInfo = lineParts[0]
        if (len(lineParts) > 1):
            childInfo = lineParts[1].split(', ')
            nodesWhereChild[nodeInfo] = childInfo
        nodes.append(nodeInfo)
    def recursePrograms(programs,count,seenList):
        count += 1
        if count > maxPrograms:
            print('error hit max')
            return {'count': count,'seenList': seenList}
        for program in programs:
            if seenList.count(program) == 0:
                seenList.append(program)
                recursiveResult = recursePrograms(nodesWhereChild[program], 0, seenList)
                count += recursiveResult['count']
                for result in recursiveResult['seenList']:
                    if seenList.count(result) == 0:
                        seenList.append(result)
        return {'count': count,'seenList': seenList}
    recursiveResult = recursePrograms(nodesWhereChild[str(targetID)],0,[str(targetID)])
    groupCount = 1
    seenList = recursiveResult['seenList']
    remainingNodes = []
    for node in nodes:
        if seenList.count(node) == 0:
            remainingNodes.append(node)
    while len(seenList) < maxPrograms:
        index = 0
        for node in remainingNodes:
            if seenList.count(node) == 0:
                index = node
                break
        print(groupCount, index,len(seenList) )
        recursiveResult = recursePrograms(nodesWhereChild[index],0,recursiveResult['seenList'])
        seenList = recursiveResult['seenList']
        groupCount += 1
    return groupCount

testOneResult = solve(open("2017/12test.txt", "r").read(),0)
print(testOneResult, testOneResult == 2)
print(solve(open("2017/12.txt", "r").read(),0))


