#!/usr/bin/env python3
import sys
import os

def between(str,start,end):
    return str[str.find(start)+len(start):str.rfind(end)].strip()

primaryColor = ''
newColor = ''
for line in open('scss/base/_colors.scss', 'r'):
    if '$accent-primary:' in line:
        primaryColor = between(line,'$accent-primary:',';')
        break

if primaryColor == '':
    sys.exit()


if sys.argv[1] == '':
    sys.exit()
else:
    newColor = '#'+sys.argv[1]

for root, dirs, files in os.walk('.'):
    for name in files:
        if name.endswith('.scss') or name.endswith('.svg'):
            fileName = os.path.join(root, name)
            tmp = open(fileName+'.tmp','w')
            try:
                for line in open(fileName,'r'):
                    if primaryColor in line:
                        tmp.write(line.replace(primaryColor,newColor))
                    else:
                        tmp.write(line)
            finally:
                tmp.close()
                os.remove(fileName)
                os.rename(fileName+'.tmp',fileName)
            
