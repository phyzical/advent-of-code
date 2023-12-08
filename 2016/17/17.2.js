const helpers = require("../../helpers");
const md5 = require("blueimp-md5");
const fs = require("fs");

function solve(input) {
  const mazeRows = fs.readFileSync(__dirname + "/17.txt", "utf8").split("\n");
  const maze = mazeRows.map((mazeRow) => {
    return mazeRow.split("");
  });
  let currentX = 1;
  let currentY = 1;
  let path = "";
  return nextRoom(maze, currentX, currentY, path, input);
}
function nextRoom(maze, currentX, currentY, path, input) {
  let hashChunk = md5(input + path).slice(0, 4);
  let upOpen =
    hashChunk[0] == "b" || hashChunk[0] == "c" || hashChunk[0] == "d" || hashChunk[0] == "e" || hashChunk[0] == "f";
  let downOpen =
    hashChunk[1] == "b" || hashChunk[1] == "c" || hashChunk[1] == "d" || hashChunk[1] == "e" || hashChunk[1] == "f";
  let leftOpen =
    hashChunk[2] == "b" || hashChunk[2] == "c" || hashChunk[2] == "d" || hashChunk[2] == "e" || hashChunk[2] == "f";
  let rightOpen =
    hashChunk[3] == "b" || hashChunk[3] == "c" || hashChunk[3] == "d" || hashChunk[3] == "e" || hashChunk[3] == "f";
  let shortest = "";
  let top = maze[currentY - 1][currentX];
  let bottom = maze[currentY + 1][currentX];
  let left = maze[currentY][currentX - 1];
  let right = maze[currentY][currentX + 1];
  if (path.length < 1000) {
    if (bottom == "V") {
      return path;
    }
    if (top == "-" && upOpen) {
      let newPath = nextRoom(maze, currentX, currentY - 2, path + "U", input);
      if (newPath && newPath.length > shortest.length) {
        shortest = newPath;
      }
    }
    if (bottom == "-" && downOpen) {
      let newPath = nextRoom(maze, currentX, currentY + 2, path + "D", input);
      if (newPath && newPath.length > shortest.length) {
        shortest = newPath;
      }
    }
    if (left == "|" && leftOpen) {
      let newPath = nextRoom(maze, currentX - 2, currentY, path + "L", input);
      if (newPath && newPath.length > shortest.length) {
        shortest = newPath;
      }
    }
    if (right == "|" && rightOpen) {
      let newPath = nextRoom(maze, currentX + 2, currentY, path + "R", input);
      if (newPath && newPath.length > shortest.length) {
        shortest = newPath;
      }
    }
    return shortest;
  }
}
const test1Res = solve("ihgpwlah");
console.log(test1Res, test1Res.length === 370);
const test2Res = solve("kglvqrro");
console.log(test2Res, test2Res.length === 492);
const test3Res = solve("ulqzkmiv");
console.log(test3Res, test3Res.length === 830);
console.log(solve("ioramepc").length);
