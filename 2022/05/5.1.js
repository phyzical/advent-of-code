const fs = require("fs");
const helpers = require("../../../2016/helpers");

const solve = (input, part2 = false) => {
  const res = solveBoard(parseRows(input), part2).reduce((acc, res) => {
    return `${acc}${res[0]}`;
  }, "");
  return res;
};
module.exports.solve = solve;

const solveBoard = (inputs, part2 = false) => {
  while (inputs.moves.length > 0) {
    const [count, from, to] = inputs.moves.shift();
    const chunkToMove = inputs.board[from - 1].splice(0, count);
    inputs.board[to - 1].splice(0, 0, ...(part2 ? chunkToMove : chunkToMove.reverse()));
  }
  return inputs.board;
};

const parseRows = (input) => {
  const [board, moves] = input.split("\n\n");
  let movesProcessed = moves.split("\n").map((x) => x.replaceAll(new RegExp(/move |from |to /g), "").split(" "));
  return {
    board: parseBoard(board),
    moves: movesProcessed,
  };
};

const parseBoard = (boardString) => {
  let boardProcessed = boardString
    .split("\n")
    .map((x) => helpers.chunkString(x, 4).map((y) => y.replaceAll(new RegExp(/\[|\]| /g), "")));
  boardProcessed.pop();
  let finalBoard = [];
  while (boardProcessed[0].length > 0) {
    finalBoard.push(
      boardProcessed.reduce((acc, x) => {
        acc.push(x.shift());
        return acc;
      }, []),
    );
  }
  return finalBoard.map((x) => x.filter((y) => y.length > 0));
};
console.log(solve(fs.readFileSync(__dirname + "/5test.txt", "utf8")) == "CMZ");
console.log(solve(fs.readFileSync(__dirname + "/5.txt", "utf8")));
