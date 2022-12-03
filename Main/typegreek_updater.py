import requests
import os

typegreekFolder = os.path.expanduser('~\.typegreek')

url_EN = 'https://github.com/StickyPiston-development/TypeGreek-Windows-Installer/releases/download/lib/typegreek_EN.exe'
url_NL = 'https://github.com/StickyPiston-development/TypeGreek-Windows-Installer/releases/download/lib/typegreek_NL.exe'

r_EN = requests.get(url_EN, allow_redirects=True)
r_NL = requests.get(url_NL, allow_redirects=True)

open(typegreekFolder + '\\typegreek_EN.exe', 'wb').write(r_EN.content)
open(typegreekFolder + '\\typegreek_NL.exe', 'wb').write(r_NL.content)