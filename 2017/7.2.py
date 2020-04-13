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
    def getTotal(firstChild):
        childAmt = int(nodes[firstChild])
        if nodesWhereChild.get(firstChild) != None:
            children = nodesWhereChild[firstChild]
            for child in children:
                if nodesWhereChild.get(child) != None:
                    childAmt += getTotal(child)
                else:
                    childAmt += int(nodes[child])

        return childAmt
    def checkNodes(nodesToCheck, parentNode,last):
        amounts = {}
        for firstChild in nodesToCheck:
            childAmt = getTotal(firstChild)
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
                if nodesWhereChild.get(amount) != None:
                    return checkNodes(nodesWhereChild[amount],amount,int(nodes[amount]) - (amounts[amount] - differingAmount))
        return last

       # for newNode in nodesToCheck:
            #return checkNodes(nodesWhereChild[newNode],newNode)
    return checkNodes(nodesWhereChild[parentNode],parentNode,0)

testOneResult = solve(open("2017/7test.txt", "r").read())
print(testOneResult, testOneResult == 60)
print(solve(open("2017/7.txt", "r").read()))

