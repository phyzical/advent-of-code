import math
import copy
def decimalToBinary(num):
    return bin(num).replace("0b", "")

def hexToBinary(chars):
    string = ''
    binaryMap = {
        '0': '0000',
        '1': '0001',
        '2': '0010',
        '3': '0011',
        '4': '0100',
        '5': '0101',
        '6': '0110',
        '7': '0111',
        '8': '1000',
        '9': '1001',
        'A': '1010',
        'B': '1011',
        'C': '1100',
        'D': '1101',
        'E': '1110',
        'F': '1111'
    }
    for char in chars:
        string += binaryMap[char]
    return string

def asciiToDecimal(input):
    charMap = {
        ' ': 32,
        'A': 65,
        'B': 66,
        'C': 67,
        'D': 68,
        'E': 69,
        'F': 70,
        'G': 71,
        'H': 72,
        'I': 73,
        'J': 74,
        'K': 75,
        'L': 76,
        'M': 77,
        'N': 78,
        'O': 79,
        'P': 80,
        'Q': 81,
        'R': 82,
        'S': 83,
        'T': 84,
        'U': 85,
        'V': 86,
        'W': 87,
        'X': 88,
        'Y': 89,
        'Z': 90,
        'a': 97,
        'b': 98,
        'c': 99,
        'd': 100,
        'e': 101,
        'f': 102,
        'g': 103,
        'h': 104,
        'i': 105,
        'j': 106,
        'k': 107,
        'l': 108,
        'm': 109,
        'n': 110,
        'o': 111,
        'p': 112,
        'q': 113,
        'r': 114,
        's': 115,
        't': 116,
        'u': 117,
        'v': 118,
        'w': 119,
        'x': 120,
        'y': 121,
        'z': 122,
        '-': 45,
        ',': 44,
        '0': 48,
        '1': 49,
        '2': 50,
        '3': 51,
        '4': 52,
        '5': 53,
        '6': 54,
        '7': 55,
        '8': 56,
        '9': 57,
    }
    lengths = []
    for char in input:
        lengths.append(charMap[char])
    return lengths

def toHex(d):
    r = d % 16
    if (d - r) == 0 :
        return toChar(r)
    return toHex( (d - r)/16 ) + toChar(r)
def toChar(n):
    alpha = "0123456789ABCDEF"
    return alpha[n]

def batchList(array, size):
    return [array[x:x+size] for x in xrange(0, len(array), size)]


def is_number(s):
    try:
        float(s)
        return True
    except ValueError:
        pass

    try:
        import unicodedata
        unicodedata.numeric(s)
        return True
    except (TypeError, ValueError):
        pass

def chunk(l, n):
    n = max(1, n)
    return (l[i:i+n] for i in range(0, len(l), n))

def rotate90(grid):
    rotatedGrid = copy.deepcopy(grid)[:]
    for i in range (0, len(grid)):
        for j in range (0, len(grid)):
            rotatedGrid[i][j] = grid[-(j+1)][i][:]
    return rotatedGrid


def print_grid(grid):
  print('\n'.join(' '.join(str(x) for x in row) for row in grid))
  print("\n")