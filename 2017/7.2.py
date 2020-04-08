def solve(input):
    count = 0
    lines = input.splitlines()
    nodes = {}
    nodesWhereChild = {}
    parentNode = None
    ## break up input
    for line in lines:
        lineParts = line.split(' -> ')
        nodeInfo = lineParts[0].replace('(','').replace(')','').split()
        if (len(lineParts) > 1):
            childInfo = lineParts[1].split(', ')
            nodesWhereChild[nodeInfo[0]] = childInfo
        nodes[nodeInfo[0]] = nodeInfo[1]
    ## find top/ parentNode
    for node in nodes:
        found = False
        for childNodes in nodesWhereChild:
            if nodesWhereChild[childNodes].count(node):
                found = True
        if found == False:
            parentNode = node

    def checkNodes(nodesToCheck):
        amounts = {}
        for firstChild in nodesToCheck:
            childAmt = int(nodes[firstChild])
            children = nodesWhereChild[firstChild]
            for child in children:
                childAmt += int(nodes[child])
            amounts[firstChild] = childAmt
        for amount in amounts:
            count = 0
            differingAmount = 0
            for amount2 in amounts:
                if amounts[amount2] == amounts[amount]:
                    count += 1
                else:
                    differingAmount = amounts[amount2]
            if count == 1:
                print(nodesToCheck,amounts)
                print(int(nodes[amount]) - (amounts[amount] - differingAmount))
                exit()
        for newNode in nodesToCheck:
            print(nodesWhereChild[newNode], newNode)
            checkNodes(nodesWhereChild[newNode])
    print(parentNode)
    checkNodes(nodesWhereChild[parentNode])
solve(open("2017/7.txt", "r").read())
##idk...

