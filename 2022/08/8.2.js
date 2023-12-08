const fs = require("fs");
const helpers = require("../../../2016/helpers");

const solve = (input) => {
  const trees = parseInput(input);
  return calculateTreeRatings(trees).reduce(helpers.arrayMax);
};

const calculateTreeRatings = (trees) => {
  let x = 0,
    y = 0,
    yLength = trees.length,
    ratings = [];

  while (y < yLength - 1) {
    let xLength = trees[y].length;
    x = 0;
    while (x < xLength - 1) {
      ratings.push(calculateTreeRating(trees, y, x));
      x++;
    }
    y++;
  }

  return ratings;
};

const calculateTreeRating = (trees, y, x) => {
  let xLength = trees[0].length,
    yLength = trees.length;

  const topTreesReversed = trees
      .slice(0, y)
      .map((topTreeRows) => topTreeRows[x])
      .reverse(),
    bottomTrees = trees.slice(y + 1, yLength).map((bottomTreeRows) => bottomTreeRows[x]),
    leftTreesReversed = trees[y].slice(0, x).reverse(),
    rightTrees = trees[y].slice(x + 1, xLength),
    treeToCheck = trees[y][x];

  let viewBlocked = false;
  const calculateVisibleTrees = (acc, tree, index) => {
    if (index == 0) {
      viewBlocked = false;
    }

    if (viewBlocked) {
      return acc;
    }

    if (tree >= treeToCheck) {
      viewBlocked = true;
    }
    return acc + 1;
  };

  const topTreesVisible = topTreesReversed.reduce(calculateVisibleTrees, 0),
    bottomTreesVisible = bottomTrees.reduce(calculateVisibleTrees, 0),
    leftTreesVisible = leftTreesReversed.reduce(calculateVisibleTrees, 0),
    rightTreesVisible = rightTrees.reduce(calculateVisibleTrees, 0);
  // console.log(topTreesVisible, bottomTreesVisible, leftTreesVisible, rightTreesVisible)
  return topTreesVisible * bottomTreesVisible * leftTreesVisible * rightTreesVisible;
};

const parseInput = (input) => {
  return input.split("\n").map((x) => x.split("").map((y) => parseInt(y)));
};

console.log(solve(fs.readFileSync(__dirname + "/8test.txt", "utf8")) == 8);
console.log(solve(fs.readFileSync(__dirname + "/8.txt", "utf8")));
