winCond = ["A Y", "B Z", "C X"]
winVal = [2, 3, 1]
drawCond = ["A X", "B Y", "C Z"]
drawVal = [1, 2, 3]
lossCond = ["A Z", "B X", "C Y"]
lossVal = [3, 1, 2]

def part1():
    value = 0
    text = open("input.txt").read().strip().split("\n")
    for test in text:
        if test in winCond:
            value+=6+winVal[winCond.index(test)]
        elif test in drawCond:
            value+=3+drawVal[drawCond.index(test)]
        else: value+=lossVal[lossCond.index(test)]
    print(value)

winCond2 = ["A Z", "B Z", "C Z"]
winVal2 = [2, 3, 1]
drawCond2 = ["A Y", "B Y", "C Y"]
drawVal2 = [1, 2, 3]
lossCond2 = ["A X", "B X", "C X"]
lossVal2 = [3, 1, 2]
    
def part2():
    value = 0
    text = open("input.txt").read().strip().split("\n")
    for test in text:
        if test in winCond2:
            value+=6+winVal2[winCond2.index(test)]
        elif test in drawCond2:
            value+=3+drawVal2[drawCond2.index(test)]
        else: value+=lossVal2[lossCond2.index(test)]
    print(value)

part1()
part2()
