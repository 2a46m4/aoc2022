from functools import reduce
print(reduce(lambda k, l: k+l, sorted(map(lambda z : reduce(lambda a, b : a + b, map(int, z)), map(lambda s:s.split("\n"),open("input.txt", "r").read().strip('\n').split("\n\n"))), reverse=True)[0:3]))
