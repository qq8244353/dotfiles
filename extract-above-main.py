import sys, re
filename=sys.argv[1]
res = []
with open(filename, 'r') as f:
    lst = f.readlines()
for l in lst:
    if re.match(r'#include.*', l) != None:
        continue
    if re.search(r'main\(\)', l) != None:
        break
    res.append(l)

        
print(''.join(res))
