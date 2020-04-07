def solve(input):
    total = 0
    for line in input.splitlines():
        maxNum = 0
        minNum = 99999999
        for num in line.split():
            if int(num) > maxNum:
                maxNum = int(num)
            if int(num) < minNum:
                minNum = int(num)
        total += maxNum - minNum
    print(total)

solve(open("2017/2.txt", "r").read())
