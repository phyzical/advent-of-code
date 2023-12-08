#!/bin/bash

export AOC_SESSION=$1

curl https://adventofcode.com/2023/day/5 > 
AOC_SESSION=${AOC_SESSION} aocd >input.txt
AOC_SESSION=${AOC_SESSION} aocd --example >example.txt
