print(max(map(lambda z : sum(map(int, z)), map(lambda s:s.split("\n"),open("input.txt", "r").read().strip('\n').split("\n\n")))))
