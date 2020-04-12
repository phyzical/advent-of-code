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
        print(seenList)
        for program in programs:
            if seenList.count(program) == 0:
                seenList.append(program)
                recursiveResult = recursePrograms(nodesWhereChild[program], 0, seenList)
                count += recursiveResult['count']
                for result in recursiveResult['seenList']:
                    if seenList.count(result) == 0:
                        seenList.append(result)
        return {'count': count,'seenList': seenList}
    return recursePrograms(nodesWhereChild[str(targetID)],0,[str(targetID)])

testOneResult = solve(open("2017/12test.txt", "r").read(),0)['count']
print(testOneResult, testOneResult == 6)
print(solve(open("2017/12.txt", "r").read(),0)['count'])


