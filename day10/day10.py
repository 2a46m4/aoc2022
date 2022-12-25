def parseInput(input):
    parsed = []
    for line in input:
        parsed.append(0)
        if line != "noop\n":
            parsed.append(int(line[5:]))
    return parsed

def part1(input, reg, cycle):
    if len(input) == 0:
        return 0
    if cycle in [20, 60, 100, 140, 180, 220]:
        return cycle * reg + part1(input[1:], reg + input[0], cycle + 1)
    else: return part1(input[1:], reg + input[0], cycle + 1)

def part2(input, reg, cycle):
    res = ""
    if len(input) == 0:
        return res
    if cycle == 0:
        res += "\n"
    if abs(reg - cycle) <= 1:
        res += "#"
    else: res += "."
    return res + part2(input[1:], reg + input[0], (cycle + 1)%40)

print(part1(parseInput(open("input.txt").readlines()), 1, 1))
print(part2(parseInput(open("input.txt").readlines()), 1, 0))
