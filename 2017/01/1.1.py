def solve(input):
    total = 0
    previousChar = input[len(input)-1]
    lastMatch = None
    for char in input:
        if char == previousChar:
            total += int(char)
        previousChar = char
    print(total)

solve(open("2017/1.txt", "r").read())
