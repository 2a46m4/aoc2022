def part1():
    print(sum(map(lambda a: {"A Y":8, "B Z":9, "C X":7, "A X":4, "B Y":5, "C Z":6, "A Z":3, "B X":1, "C Y":2}[a], open("input.txt").read().strip().split("\n"))))

def part2():
    print(sum(map(lambda a: {"A Z":8, "B Z":9, "C Z":7, "A Y":4, "B Y":5, "C Y":6, "A X":3, "B X":1, "C X":2}[a], open("input.txt").read().strip().split("\n"))))

part1()
part2()
