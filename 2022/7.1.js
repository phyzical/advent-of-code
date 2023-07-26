const fs = require("fs");

const solve = (input) => {
    const directories = parseInput(input).directories
    console.log(directories)
    const calculatedDirectories = calculateTrueTotalSizes(directories)
    console.log(calculatedDirectories)
    const totalSize = sumTotalDirsBelowLimit(calculatedDirectories, 100000)
    console.log(totalSize)
    return totalSize
};

const calculateTrueTotalSizes = (directories) => {
    //TODO: sort keys by size
    // then starting with longest workout where other keys are within
    // i.e /ae is part of /a and /
    // so total size of /ae needs to go into /a and /
    // and due to ordering / will end up with /ae + /a + /ae + /

    // given x /abcd , y / will /, /a, /ab, /abc, /abcd 
    // ~ /abcd.totalSize * (x.len - y.len + 1)
    // ~ /abcd.totalSize * 5
    // given x /abcd, y /ab its /ab, /abc, /abcd
    // ~ /abcd.totalSize * (x.len - y.len + 1)
    // ~ /abcd.totalSize * 3
    // given x /abcdefghj, y /abc its /abc, /abcd,/abcde,/abcdef,/abcdefg,/abcdefgh,/abcdefghj,
    // ~ /abcd.totalSize * (10 - 4 + 1)
    // ~ /abcd.totalSize * 7

    return directories
}

const sumTotalDirsBelowLimit = (input, limit) => {
    return Object.entries(input).reduce((acc, [key, value]) => {
        if (parseInt(value.totalSize) <= limit) {
            acc += parseInt(value.totalSize)
        }
        return acc
    }, 0)
}



const parseInput = (input) => {
    return input.split("\n").reduce((acc, input) => {
        if (input.includes("$ cd")) {
            const dir = input.replace("$ cd ", "")
            switch (dir) {
                // remove last dir
                case "..":
                    acc.currentDir = acc.currentDir.substring(0, acc.currentDir.length - 1)
                    break;
                case "/":
                    acc.currentDir = "/"
                    break;
                // append next dir
                default:
                    acc.currentDir = `${acc.currentDir}${dir}`
            }
            if (!acc.directories[acc.currentDir])
                acc.directories[acc.currentDir] = {
                    files: [],
                    totalSize: 0
                }
        } else if (!input.includes("$ ls") && !input.includes("dir ")) { //must be part of ls response
            const [size, filename] = input.split(" ")
            acc.directories[acc.currentDir].files.push({
                filename,
                size
            })
            acc.directories[acc.currentDir].totalSize += parseFloat(size)
        }

        return acc
    }, { directories: {}, currentDir: "" })
}
console.log(solve(fs.readFileSync(__dirname + '/7test.txt', 'utf8')) == 95437);
// console.log(solve(fs.readFileSync(__dirname + '/7.txt', 'utf8')));


