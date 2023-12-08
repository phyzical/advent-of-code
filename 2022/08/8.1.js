const fs = require("fs");

const solve = (input) => {
    const trees = parseInput(input)
    return countVisibleTrees(trees)
};

const countVisibleTrees = (trees) => {
    let x = 1,
        y = 1,
        xLength = trees[0].length,
        yLength = trees.length

    let count = (yLength * 2) + (xLength * 2) - 4

    while (y < (yLength - 1)) {
        x = 1
        xLength = trees[y].length

        while (x < (xLength - 1)) {


            if (isTreeVisible(trees, y, x))
                count++;
            x++;
        }
        y++;
    }

    return count
}

const isTreeVisible = (trees, y, x) => {
    let xLength = trees[0].length,
        yLength = trees.length
    const topTreesReversed = trees.slice(0, y).map(topTreeRows => topTreeRows[x]).reverse(),
        bottomTrees = trees.slice(y + 1, yLength).map(bottomTreeRows => bottomTreeRows[x]),
        leftTreesReversed = trees[y].slice(0, x).reverse(),
        rightTrees = trees[y].slice(x + 1, xLength),
        treeToCheck = trees[y][x]

    const topTreesBlockingView = topTreesReversed.filter(tree => treeToCheck <= tree),
        bottomTreesBlockingView = bottomTrees.filter(tree => treeToCheck <= tree),
        leftTreesBlockingView = leftTreesReversed.filter(tree => treeToCheck <= tree),
        rightTreesBlockingView = rightTrees.filter(tree => treeToCheck <= tree)

    if (topTreesBlockingView.length == 0 ||
        bottomTreesBlockingView.length == 0 ||
        leftTreesBlockingView.length == 0 ||
        rightTreesBlockingView.length == 0
    ) {

        return true
    }


    return false
}


const parseInput = (input) => {
    return input.split("\n").map(x => x.split("").map(y => parseInt(y)))
}
console.log(solve(fs.readFileSync(__dirname + '/8test.txt', 'utf8')) == 21);
console.log(solve(fs.readFileSync(__dirname + '/8.txt', 'utf8')));