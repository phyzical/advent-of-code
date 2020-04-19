const fs = require('fs');
function solve(input){
    const triangles = input.split('\n');
    let count = 0
    triangles.map(triangle => {
        const split = triangle.split(/(\s+)/).filter( function(e) { return e.trim().length > 0; } );
        const a = (parseInt(split[1]) + parseInt(split[0]))  > parseInt(split[2]);
        const b = (parseInt(split[1]) + parseInt(split[2]))  > parseInt(split[0]);
        const c = (parseInt(split[2]) + parseInt(split[0]))  > parseInt(split[1]);

        if (a && b && c) {
            count++;
        }
    });
    return count
}

const test1Res = solve('  5   10   25');
console.log(test1Res, test1Res === 0);

console.log(solve(fs.readFileSync(__dirname+'/3.txt', 'utf8')));