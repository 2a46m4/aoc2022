def day3pt1():
    ans = 0
    for line in open("input.txt").read().split("\n"):
        first = line[:int(len(line)/2)]
        second = line[int(len(line)/2):]
        val = (set(first) & set(second)).pop()
        if val.isupper():
            ans+= ord(val) - 38
        else:
            ans+= ord(val) - 96
            break
    print(ans)

    
def day3pt2(lines):
    if(len(lines) == 0):
        return 0
    ans = (set(lines[0]) & set(lines[1]) & set(lines[2])).pop()
    if ans.isupper():
        return ord(ans) - 38 + day3pt2(lines[3:])
    else:
        return ord(ans) - 96 + day3pt2(lines[3:])


day3pt1()
print(day3pt2(list(map(lambda n : n.strip(),open("input.txt").readlines()))))
