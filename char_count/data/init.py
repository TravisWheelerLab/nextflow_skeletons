from sys import argv

for i in range(int(argv[1])):
    f = open(f'input-{i}.txt', 'w')
    f.write('a' * 1000)
    f.close()
