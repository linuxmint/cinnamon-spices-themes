#!/usr/bin/env python3
import sys
import os
import json
import subprocess

def between(searchString,startString,endString):
    return searchString[searchString.find(startString)+len(startString):searchString.rfind(endString)].strip()

primaryColor = ''
newColor = ''
newAccent = ''
settings = None

with open('settings.json', encoding='utf-8-sig') as settings_file:
    settings = json.load(settings_file)

if settings == None:
    print('No settings.json found')
    sys.exit()


for line in open('scss/base/_colors.scss', 'r'):
    if '$accent-primary:' in line:
        primaryColor = between(line,'$accent-primary:',';')
        break

if primaryColor == '':
    print('Can\'t load the primaryColor')
    sys.exit()


if sys.argv[1] == '':
    try:
        accents = ', '.join(settings['accents'].keys())
        print('No Accent supplied')
        print('Valid Accents are: ' + accents)
        sys.exit()
    except KeyError:
        print('Settings don\'t have Accents!!!')
        sys.exit()
else:
    newAccent = sys.argv[1]

try:
    newColor = settings['accents'][newAccent]
except KeyError:
    try:
        accents = ', '.join(settings['accents'].keys())
        print('Accent supplied:'+newAccent+' isn\'t valid.')
        print('Valid Accents are: ' + accents)
        sys.exit()
    except KeyError:
        print('Settings don\'t have Accents!!!')
        sys.exit()

settings['currentAccent'] = newAccent

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

with open('settings.json', 'w', encoding='utf-8-sig') as outfile:
    json.dump(settings, outfile, indent=4)

subprocess.call(['zsh', './compile'])
