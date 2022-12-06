def part1():
    text = open("input.txt").read().replace('\n','')
    for i in range(len(text)):
        dict = set([text[i], text[i+1], text[i+2], text[i+3]])
        print (dict)
        if len(dict) == 4:
            return i + 4
def part2():
    text = open("input.txt").read().replace('\n','')
    for i in range(len(text)):
        dict = set(text[i:i+14])
        print(dict)
        if len(dict) == 14:
            return i + 14


print(part1())
print(part2())
