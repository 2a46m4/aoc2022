def part1():
    text = open("input2.txt").read().replace('\n','')
    i = 0
    while(i < len(text)):
        dict = set(text[i:i+4])
        if len(dict) == 4:
            return i + 4
        i+=1
        
def part2():
    text = open("input2.txt").read().replace('\n','')
    i = 0
    while(i < len(text)):
        dict = set(text[i:i+14])
        if len(dict) == 14:
            return i + 14
        i+=1

print(part1())
print(part2())
