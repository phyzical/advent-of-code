const fs = require('fs');
function solve(input){
    const triangles = input.split('\n');
    let count = 0
    triangles.map((triangle,index) => {
        if ((index%3) == 0 && index < triangles.length - 2) {
            const split1 = triangle.split(/(\s+)/).filter( function(e) { return e.trim().length > 0; } );
            const a1 = split1[0];
            const b1 = split1[1];
            const c1 = split1[2];
            const triangle2 = triangles[index+1];
            const split2 = triangle2.split(/(\s+)/).filter( function(e) { return e.trim().length > 0; } );
            const a2 = split2[0];
            const b2 = split2[1];
            const c2 = split2[2];
            const triangle3 = triangles[index+2];
            const split3 = triangle3.split(/(\s+)/).filter( function(e) { return e.trim().length > 0; } );
            const a3 = split3[0];
            const b3 = split3[1];
            const c3 = split3[2];

            const aValidA = (parseInt(a1) + parseInt(a2))  > parseInt(a3);
            const aValidB = (parseInt(a1) + parseInt(a3))  > parseInt(a2);
            const aValidC = (parseInt(a3) + parseInt(a2)) > parseInt(a1);

            const bValidA = (parseInt(b1) + parseInt(b2))  > parseInt(b3);
            const bValidB = (parseInt(b1) + parseInt(b3))  > parseInt(b2);
            const bValidC = (parseInt(b3) + parseInt(b2))  > parseInt(b1);

            const cValidA = (parseInt(c1) + parseInt(c2))  > parseInt(c3);
            const cValidB = (parseInt(c1) + parseInt(c3))  > parseInt(c2);
            const cValidC = (parseInt(c3) + parseInt(c2))  > parseInt(c1);

            if (aValidA && aValidB && aValidC ) {
                count++;
            }
            if (bValidA && bValidB && bValidC ) {
                count++;
            }
            if (cValidA && cValidB && cValidC ) {
                count++;
            }
        }

    });
    return count
}

const test1Res = solve('101 301 501\n' +
    '102 302 502\n' +
    '103 303 503\n' +
    '201 401 601\n' +
    '202 402 602\n' +
    '203 403 603');
console.log(test1Res, test1Res === 6);

console.log(solve(fs.readFileSync(__dirname+'/3.txt', 'utf8')));