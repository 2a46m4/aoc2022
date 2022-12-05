lines = open("input.txt").readlines()

inputs = list(map(lambda n: n.strip().split(), lines[10:]))
def part1():
    locations = [[], [], [], [], [], [], [], [], []]
    for i in range(7, -1, -1):
        for j in range(1, 37, 4):
            if lines[i][j] != ' ':
                locations[int((j-1)/4)].append(lines[i][j])
    for i in inputs:
        a=locations[int(i[3])-1][-int(i[1]):]
        a.reverse()
        locations[int(i[5])-1].extend(a)
        del locations[int(i[3]) - 1][-int(i[1]):]
    ans = ''
    for i in locations:
        ans += i.pop()
    return ans

def part2():
    locations = [[], [], [], [], [], [], [], [], []]
    for i in range(7, -1, -1):
        for j in range(1, 37, 4):
            if lines[i][j] != ' ':
                locations[int((j-1)/4)].append(lines[i][j])
    for i in inputs:
        locations[int(i[5])-1].extend(locations[int(i[3])-1][-int(i[1]):])
        del locations[int(i[3]) - 1][-int(i[1]):]
    ans = ''
    for i in locations:
        ans += i.pop()
    return ans
  
print(part1())
print(part2())    

