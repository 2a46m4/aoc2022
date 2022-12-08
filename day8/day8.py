def visible(row, col, lines):
    val = lines[row][col]
    if(row == len(lines)-1 or col == len(lines[row])-1 or row == 0 or col == 0):
        return True
    top = []
    for i in range(row):
        top.append(lines[i][col])
    bottom=[]
    for i in range(row+1, len(lines)):
        bottom.append(lines[i][col])
    if(max(lines[row][:col]) >= val and max(lines[row][col+1:]) >= val and  max(top) >= val and max(bottom) >= val):
        return False
    else: return True

def scenicscore(row, col, lines):
    val = lines[row][col]
    print(row)
    ans = 0
    top = []
    for i in range(row):
        top.append(lines[i][col])
    top.reverse()
    bottom=[]
    for i in range(row+1, len(lines)):
        bottom.append(lines[i][col])
    for i in top:
        ans+=1
        if i >= val:
            break
    b = 0
    for i in bottom:
        b+=1
        if i >= val:
            break

    ans *= b
    c = 0
    for i in lines[row][col+1:]:
        c+=1
        if i >= val:
            break

    ans *=c
    d = 0
    a = lines[row][:col]
    a.reverse()
    for i in a:
        d+=1
        if i >= val:
            break

    ans *=d
    return ans

def part1(lines):
    ans = 0
    for row in range(len(lines)):
        for col in range(len(lines[row])):
            if(visible(row, col, lines)):
                ans+=1
    return ans

def part2(lines):
    vals = []
    for row in range(len(lines)):
        for col in range(len(lines[row])):
            vals.append(scenicscore(row, col, lines))
    return max(vals)

print(part1(list(map(lambda line: list(map(int,line)) ,open("input.txt").read().strip().split("\n")))))
print(part2(list(map(lambda line: list(map(int,line)) ,open("input.txt").read().strip().split("\n")))))
