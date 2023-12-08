const helpers = require("../../helpers");

const fs = require("fs");

function solve(input) {
  let currentIndex = 0;
  let instructions = input.split("\n");
  let grid = [];
  instructions.map((instruction, i) => {
    if (i > 1) {
      let splits = instruction.split("T  ");
      let secondSplits = splits[0].split(" ")[0].trim().split("-");
      let y = parseInt(secondSplits[2].replace("y", ""));
      let x = parseInt(secondSplits[1].replace("x", ""));
      if (!grid[y]) {
        grid[y] = [];
      }
      let gridItem = {
        size: parseInt(splits[0].split(" ")[splits[0].split(" ").length - 1]),
        used: parseInt(splits[1].trim()),
        avail: parseInt(splits[2].trim()),
        use: parseInt(instruction.split("%")[0].split(" ").pop()),
      };
      console.log(gridItem);
      grid[y][x] = gridItem;
    }
  });
  let pairs = [];
  grid.map((row, y) => {
    row.map((rowItem, x) => {
      grid.map((row2, y2) => {
        row2.map((rowItem2, x2) => {
          if ((y != y2 || x != x2) && rowItem.used > 0 && rowItem2.avail >= rowItem.used) {
            pairs.push([
              { x, y },
              { x: x2, y: y2 },
            ]);
          }
        });
      });
    });
  });
  return pairs.length;
}
console.log(solve(fs.readFileSync(__dirname + "/22.txt", "utf8")));
