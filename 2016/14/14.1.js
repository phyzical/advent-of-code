const helpers = require("../../helpers");
const md5 = require("blueimp-md5");

function solve(input, finalCount) {
  let index = 0;
  let keyCount = 0;
  while (keyCount < finalCount) {
    const hash = md5(input + index);
    let hashIndex = 0;
    let splitHash = hash.split("");
    let hashChar = splitHash[hashIndex];
    let hashCharCount = 1;
    while (hashIndex < hash.length - 1) {
      if (hashChar === splitHash[hashIndex + 1]) {
        hashCharCount++;
        if (hashCharCount == 3) {
          if (checkForNext(input, index + 1, hashChar)) {
            keyCount++;
            break;
          }
        }
      } else {
        hashCharCount = 1;
        hashChar = splitHash[hashIndex + 1];
      }
      hashIndex++;
    }
    index++;
    console.log(index, keyCount);
  }
  return index - 1;
}

function checkForNext(input, index, foundChar) {
  const finalIndex = index + 1000;
  while (index < finalIndex) {
    const hash = md5(input + index);
    let hashIndex = 0;
    let splitHash = hash.split("");
    let hashChar = splitHash[hashIndex];
    let hashCharCount = 1;
    while (hashIndex < hash.length - 1) {
      if (hashChar === splitHash[hashIndex + 1]) {
        hashCharCount++;
        if (foundChar == hashChar && hashCharCount == 5) {
          return true;
        }
      } else {
        hashCharCount = 1;
        hashChar = splitHash[hashIndex + 1];
      }
      hashIndex++;
    }
    index++;
  }
  return false;
}
// 4 false positives
const test1Res = solve("abc", 68);
console.log(test1Res, test1Res === 22728);
// 3 false positives
console.log(solve("ihaygndm", 67));
