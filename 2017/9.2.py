def solve(input):
    result = ''
    instructionLine = input
    removing = False
    index = 0
    cancel = False
    count = 0
    while index < len(instructionLine):
        currentChar = instructionLine[index]
        if removing == True:
            instructionLine = instructionLine[:index] + instructionLine[index+1:]
            if cancel == False and currentChar == '>':
                removing = False
            elif cancel == False and currentChar != '!':
                count += 1
        else:
            if cancel == False and currentChar == '<':
                removing = True
                instructionLine = instructionLine[:index] + instructionLine[index+1:]
            else:
                index += 1
        if currentChar == '!':
            cancel = cancel == False
        else:
            cancel = False
    return count


oneInputs = solve("{sdf}")
print('test 1 ', oneInputs, oneInputs == 0)
twoInputs = solve("{dfg{{dfg}}}")
print('test 2 ', twoInputs, twoInputs == 0)
threeInputs = solve("{{{as},{sa},{{}}}}")
print('test 3 ', threeInputs, threeInputs == 0)
fourInputs = solve("{<a>,as<a>,<a>,<a>}")
print('test 4 ', fourInputs,  fourInputs == 4)
fiveInputs = solve("{{<ab>},{<saab>},{<ab>},d{<ab>}}")
print('test 5 ', fiveInputs,  fiveInputs == 10)
sixInputs = solve("{{<!!>},{<!!>},d{<sa!!>},{<!!>}}")
print('test 6 ', sixInputs, sixInputs == 2)
sevenInputs = solve("{{<a!>},d{<a!>},{<aas!>},{<ab>}}")
print('test 7 ', sevenInputs, sevenInputs == 20)
eightInputs = solve("{{<!!!>><!!!>>}}")
print('test 8 ', eightInputs,  eightInputs == 0)
nineInputs = solve("{{<{oi!a,<{i<a>}}")
print('test 9 ', nineInputs, nineInputs == 9)
tenInputs = solve("{{<<<<>}}")
print('test 10 ', tenInputs,  tenInputs == 3)
print(solve(open("2017/9.txt", "r").read()))

