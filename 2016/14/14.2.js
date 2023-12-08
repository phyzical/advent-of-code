const helpers = require("../../helpers");
const md5 = require("blueimp-md5");

function solve(input, finalCount) {
  let index = 0;
  let keyCount = 0;
  let hashes = [];
  let tempIndex = 0;
  while (hashes.length < 30000) {
    let hash = md5(input + tempIndex);
    let md5Count = 0;
    while (md5Count < 2016) {
      hash = md5(hash);
      md5Count++;
    }
    hashes.push(hash);
    tempIndex++;
  }
  while (keyCount < finalCount) {
    const hash = hashes[index];
    let hashIndex = 0;
    let splitHash = hash.split("");
    let hashChar = splitHash[hashIndex];
    let hashCharCount = 1;
    while (hashIndex < hash.length - 1) {
      if (hashChar === splitHash[hashIndex + 1]) {
        hashCharCount++;
        if (hashCharCount == 3) {
          if (checkForNext(hashes, index + 1, hashChar)) {
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

function checkForNext(hashes, index, foundChar) {
  const finalIndex = index + 1000;
  while (index < finalIndex) {
    const hash = hashes[index];
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
// 2 false positives
//const test1Res = solve('abc',66);
//console.log(test1Res, test1Res === 22551);
// 3 false positives
console.log(solve("ihaygndm", 67));
