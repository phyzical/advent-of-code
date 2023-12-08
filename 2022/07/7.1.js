const fs = require("fs");

const solve = (input) => {
    const directories = parseInput(input).directories
    const calculatedDirectories = calculateTrueTotalSizes(directories)
    const totalSize = sumTotalDirsBelowLimit(calculatedDirectories, 100000)
    return totalSize
};

const calculateTrueTotalSizes = (directories) => {
    const sortedKeys = Object.keys(directories).sort((x, y) => (y.match(/,/g) || []).length - (x.match(/,/g) || []).length)
    sortedKeys.forEach((keyLookup) => {
        console.log(keyLookup)

        const objLookup = directories[keyLookup]
        if (objLookup.totalSize > 0)
            while (keyLookup.length > 1) {
                keyLookup = cdDotDot(keyLookup)
                directories[keyLookup].totalSize += objLookup.totalSize
            }
    })

    return directories
}

const sumTotalDirsBelowLimit = (input, limit) => {
    Object.entries(input).forEach(([key, value]) => {
        input[key].originalTotal = value.totalSize
    })
    return Object.entries(input).reduce((acc, [key, value]) => {
        if (parseInt(value.originalTotal) <= limit) {
            acc += parseInt(value.totalSize)
        }
        return acc
    }, 0)
}

const cdDotDot = (dir) => {
    dir = dir.split(",")
    dir.pop()
    return dir.join(",")
}

const parseInput = (input) => {
    return input.split("\n").reduce((acc, input) => {
        if (input.includes("$ cd")) {
            const dir = input.replace("$ cd ", "")
            switch (dir) {
                // remove last dir
                case "..":
                    acc.currentDir = cdDotDot(acc.currentDir)
                    break;
                case "/":
                    acc.currentDir = "/"
                    break;
                // append next dir
                default:
                    acc.currentDir = `${acc.currentDir},${dir}`
            }
            if (!acc.directories[acc.currentDir])
                acc.directories[acc.currentDir] = {
                    files: [],
                    dirs: [],
                    totalSize: 0,
                    originalTotal: 0
                }
        } else if (input.includes("dir ")) { //must be part of ls response
            const dir = input.replace("dir ", "")
            acc.directories[acc.currentDir].dirs.push(dir)
        } else if (!input.includes("$ ls")) { //must be part of ls response
            const [size, filename] = input.split(" ")
            acc.directories[acc.currentDir].files.push({
                filename,
                size
            })
            acc.directories[acc.currentDir].totalSize += parseInt(size)
        }

        return acc
    }, { directories: {}, currentDir: "" })
}
console.log(solve(fs.readFileSync(__dirname + '/7test.txt', 'utf8')) == 95437);
console.log(solve(fs.readFileSync(__dirname + '/7.txt', 'utf8')));


