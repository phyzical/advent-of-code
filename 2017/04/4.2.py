def solve(input):
    total = 0
    for line in input.splitlines():
        duplicate = False
        duplicateCount = 0
        words = line.split()
        for word in words:
            for word2 in words:
                wordDuplicate = True
                for letter in word:
                    if word.count(letter) != word2.count(letter):
                        wordDuplicate = False
                if wordDuplicate:
                    duplicateCount += 1
        if (duplicateCount - len(words)) < 2:
            total += 1
    print(total)

solve(open("2017/4.txt", "r").read())
