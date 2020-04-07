def solve(input):
    total = 0
    for line in input.splitlines():
        duplicate = False
        for word in line.split():
            if line.split().count(word) > 1:
                duplicate = True
        if duplicate == False:
            total += 1
    print(total)

solve(open("2017/4.txt", "r").read())
