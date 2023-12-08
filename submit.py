import argparse
from aocd import submit

parser = argparse.ArgumentParser(description='')
parser.add_argument("answer")
parser.add_argument("--year", type=int)
parser.add_argument("--day", type=int)
parser.add_argument("--part", choices=["a", "b"])

args = parser.parse_args()
print(args)
# submit(my_answer, part="a", day=25, year=2017)