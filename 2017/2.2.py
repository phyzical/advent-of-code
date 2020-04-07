def solve(input):
    total = 0
    for line in input.splitlines():
        for num in line.split():
            for num2 in line.split():
                if int(num) % int(num2) == 0 and int(num)/int(num2) > 1:
                   total += int(num)/int(num2)
    print(total)

solve(open("2017/2.txt", "r").read())
