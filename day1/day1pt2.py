print(sum(sorted(map(lambda z : sum(map(int, z)), map(lambda s:s.split("\n"),open("input.txt").read().strip('\n').split("\n\n"))), reverse=True)[0:3]))
