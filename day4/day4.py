import re
import sys
def pt1(inputs):
    if len(inputs) == 0:
        return 0
    input = list(map(int, re.split('-|,', inputs[0])))
    first = input[0] - input[2]
    second = input[1] - input[3]
    if (max(first, second) >= 0 and min(first, second) <= 0):
        return 1 + pt1(inputs[1:])
    else:
        return pt1(inputs[1:])

def pt2(inputs):
    if len(inputs)==0:
        return 0
    input = list(map(int, re.split('-|,', inputs[0])))
    if (min(input[1], input[3]) < max(input[0], input[2])):
        return pt2(inputs[1:])
    else:
        return 1 + pt2(inputs[1:])

print(pt1(open("input.txt").read().strip().split("\n")))
print(pt2(open("input.txt").read().strip().split("\n")))
