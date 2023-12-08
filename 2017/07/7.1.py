def solve(input):
    count = 0
    lines = input.splitlines()
    nodes = []
    nodesWhereChild = []
    for line in lines:
        lineParts = line.split(' -> ')
        nodeInfo = lineParts[0].replace('()','').split()
        if (len(lineParts) > 1):
            childInfo = lineParts[1].split(', ')
            nodesWhereChild += childInfo
        nodes.append(nodeInfo[0])
    for node in nodes:
        if nodesWhereChild.count(node) < 1:
            print(node)
solve(open("2017/7.txt", "r").read())


