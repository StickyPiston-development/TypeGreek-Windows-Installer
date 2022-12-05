import requests
import os

typegreekFolder = os.path.expanduser('~\.typegreek')

url_EN = 'https://github.com/StickyPiston-development/TypeGreek-Windows-Installer/blob/installer/Main/typegreek_EN.exe?raw=True'
url_NL = 'https://github.com/StickyPiston-development/TypeGreek-Windows-Installer/blob/installer/Main/typegreek_NL.exe?raw=True'

r_EN = requests.get(url_EN, allow_redirects=True)
r_NL = requests.get(url_NL, allow_redirects=True)

open(typegreekFolder + '\\typegreek_EN.exe', 'wb').write(r_EN.content)
open(typegreekFolder + '\\typegreek_NL.exe', 'wb').write(r_NL.content)