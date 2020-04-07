def solve(input):
    def findSiblingIndex(input, index):
        count = len(input)
        halfCount = count/2
        res = index + halfCount
        if res > count:
            res = abs(count - res)
        return input[res-1]

    total = 0
    for i, char in enumerate(input):
        if char == findSiblingIndex(input,i+1):
            total += int(char)
    print(total)

solve(open("2017/1.txt", "r").read())
