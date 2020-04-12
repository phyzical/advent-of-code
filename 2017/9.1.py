def solve(input):
    result = ''
    instructionLines = input.split('<')
    #{<a>,<a>,<a>,<a>}
    #{
    #a>,
    #a>,
    #a>,
    #a>}
    #{{<!!>},{<!!>},{<!!>},{<!!>}}
    #{{
    #!!>},{
    #!!>},{
    #!!>},{
    #!!>}}
    #{{<<<<>}}
    #{{
    #
    #
    #
    #>}}

    result += instructionLines[0]
    for instructionLine in instructionLines:
        cleanedLine = ''
        instructions = instructionLine.split('>')
        keep = False
        for instruction in instructions:
            if keep == True:
                cleanedLine += instruction
                keep = False
            if(len(instruction) > 0):
                keepCount = 0
                for index in range(instruction.count('!')):
                    if index > 0:
                        if instruction[len(instruction) - index] == '!':
                            keepCount += 1
                        else:
                            break
                if keepCount % 2 == 0 :
                    keep = True
            else:
                keep = True
        result += cleanedLine
    return result.replace('"', '')

def groups(inputs):
    currentScore = 0
    total = 0
    lastChar = ''
    secondLastChar = ''
    for char in inputs:
        if char == '{':
            currentScore += 1
        elif char == '}' and lastChar != '!':
            total += currentScore
            currentScore -= 1
        lastChar = char
    return total

oneInputs = solve("{sdf}")
oneResults = groups(oneInputs)
print('test 1 ', oneInputs, oneInputs == '{sdf}',oneResults, oneResults == 1)
twoInputs = solve("{dfg{{dfg}}}")
twoResults = groups(twoInputs)
print('test 2 ', twoInputs, twoInputs == '{dfg{{dfg}}}',twoResults, twoResults == 6)
threeInputs = solve("{{{as},{sa},{{}}}}")
threeResults = groups(threeInputs)
print('test 3 ', threeInputs, threeInputs == '{{{as},{sa},{{}}}}',threeResults, threeResults == 16)
fourInputs = solve("{<a>,as<a>,<a>,<a>}")
fourResults = groups(fourInputs)
print('test 4 ', fourInputs, fourInputs == '{,as,,}',fourResults, fourResults == 1)
fiveInputs = solve("{{<ab>},{<saab>},{<ab>},d{<ab>}}")
fiveResults = groups(fiveInputs)
print('test 5 ', fiveInputs, fiveInputs == '{{},{},{},d{}}',fiveResults, fiveResults == 9)
sixInputs = solve("{{<!!>},{<!!>},d{<sa!!>},{<!!>}}")
sixResults = groups(sixInputs)
print('test 6 ', sixInputs, sixInputs == '{{},{},d{},{}}',sixResults, sixResults == 9)
sevenInputs = solve("{{<a!>},d{<a!>},{<aas!>},{<ab>}}")
sevenResults = groups(sevenInputs)
print('test 7 ', sevenInputs, sevenInputs == '{{}}',sevenResults, sevenResults == 3)
eightInputs = solve("{{<!!!>><!!!>>}}")
eightResults = groups(eightInputs)
print('test 8 ', eightInputs, eightInputs == '{{}}',eightResults, eightResults == 3)
nineInputs = solve("{{<{oi!a,<{i<a>}}")
nineResults = groups(nineInputs)
print('test 9 ', nineInputs, nineInputs == '{{}}',nineResults, nineResults == 3)
tenInputs = solve("{{<<<<>}}")
tenResults = groups(tenInputs)
print('test 10 ', tenInputs, tenInputs == '{{}}',tenResults, tenResults == 3)
inputs = solve(open("2017/9.txt", "r").read())
print(inputs, groups(inputs))
