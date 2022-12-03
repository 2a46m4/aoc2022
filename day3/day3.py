def day3pt1():
    ans = 0
    for line in open("input.txt").read().split("\n"):
        first = line[:int(len(line)/2)]
        second = line[int(len(line)/2):]
        dict = set()
        for item in first:
            dict.add(item)
        for item in second:
            if item in dict:
                if item.isupper():
                    ans+= ord(item) - 38
                else:
                    ans+= ord(item) - 96
                break
    print(ans)



def day3pt2(lines):
    if(len(lines) == 0):
        return 0
    ans = set(lines[0]).intersection(set(lines[1]).intersection(set(lines[2]))).pop()
    if ans.isupper():
        return ord(ans) - 38 + day3pt2(lines[3:])
    else:
        return ord(ans) - 96 + day3pt2(lines[3:])


day3pt1()
print(day3pt2(list(map(lambda n : n.strip(),open("input.txt").readlines()))))
