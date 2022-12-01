from functools import reduce
print(reduce(max, map(lambda z : reduce(lambda a, b : a + b, map(int, z)), map(lambda s:s.split("\n"),open("input.txt", "r").read().strip('\n').split("\n\n")))))
