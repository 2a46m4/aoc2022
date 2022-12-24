import sys
import copy

updateHeadLocation = {"U": lambda h: (h[0], h[1]+1), "D": lambda h: (h[0], h[1]-1), "R": lambda h: (h[0]+1, h[1]), "L": lambda h: (h[0]-1, h[1])}

def updateVal(headPos, tailPos, i):
    val = headPos[i]
    if headPos[i] - tailPos[i] < -1:
        val += 1
    if headPos[i] - tailPos[i] > 1:
        val -= 1
    return val

def updateTailPos(headPos, tailPos):
    X = updateVal(headPos, tailPos, 0)
    Y = updateVal(headPos, tailPos, 1)
    if X != headPos[0] or Y != headPos[1]:
        return (X, Y)
    else: return tailPos
    
def part1(input, curHeadPos, curTailPos):
    if(len(input) == 0):
        return {}
    elif(input[0][1] == 0):
        return part1(input[1:], curHeadPos, curTailPos)
    else:
        curHeadPos = updateHeadLocation[input[0][0]](curHeadPos)
        curTailPos = updateTailPos(curHeadPos, curTailPos)
        input[0][1]-=1
        return {curTailPos}.union(part1(input, curHeadPos, curTailPos))

def part2(input, curRopePos):
    if(len(input) == 0):
        return {}
    elif(input[0][1] == 0):
        return part2(input[1:], curRopePos)
    else:
        curRopePos[0] = updateHeadLocation[input[0][0]](curRopePos[0])
        for i in range(9):
            curRopePos[i+1] = updateTailPos(curRopePos[i], curRopePos[i+1])
        input[0][1] -= 1
        return {curRopePos[9]}.union(part2(input, curRopePos))

sys.setrecursionlimit(100000)
newlist = []
for line in open("input.txt").readlines():
    newlist.append([line[0], int(line[2:])])
print(len(part1(copy.deepcopy(newlist), (0, 0), (0, 0))))
print(len(part2(newlist, [(0,0) for e in range(10)])))
