import requests, zipfile, io
import shutil
import os

zip_url = "https://github.com/StickyPiston-development/TypeGreek-Windows-Installer/releases/download/Installer/lib.zip"
repo = "https://github.com/StickyPiston-development/typegreek-windows"
cwd = os.getcwd()

typegreekFolder = os.path.expanduser('~\.typegreek')
typegreekBetaFolder = os.path.expanduser('~\.typegreek_beta')
tempFolder = os.path.join(os.path.expanduser('~\.typegreek'), 'temp')

try:
    os.mkdir(os.path.join(os.path.expanduser('~\.typegreek'), 'temp'))
except OSError:
    print("Please retry")
    shutil.rmtree(tempFolder)
    exit()

r = requests.get(zip_url)
z = zipfile.ZipFile(io.BytesIO(r.content))
z.extractall(tempFolder)

shutil.copy(tempFolder + "\\typegreek_EN.exe", typegreekFolder)
shutil.copy(tempFolder + "\\typegreek_NL.exe", typegreekFolder)

shutil.copy(tempFolder + "\\beta\\AutoHotKeyU32.exe", typegreekBetaFolder)
shutil.copy(tempFolder + "\\beta\\AutoHotKeyU64.exe", typegreekBetaFolder)
shutil.copy(tempFolder + "\\beta\\Launch_Scripts\\TypeGreek_Windows_32_bit.bat", typegreekBetaFolder)
shutil.copy(tempFolder + "\\beta\\Launch_Scripts\\TypeGreek_Windows_64_bit.bat", typegreekBetaFolder)

r = requests.get(repo + "/blob/main/TypeGreek_EN.ahk?raw=True", allow_redirects=True)
open(typegreekBetaFolder + "\\typegreek_EN.ahk", 'w').write(str(r.content).replace('\\n', '\n').replace('\\t', '\t').replace('b\'', '').replace('^+!t::Suspend, Toggle\'', '^+!t::Suspend, Toggle'))
