# usr/bin/python3
import urllib.request, os

versionurl = 'https://raw.githubusercontent.com/StickyPiston-development/typegreek-lib/main/version.dat'
url_EN = 'https://github.com/StickyPiston-development/tgw-lib/blob/main/typegreek_EN.exe?raw=true'
url_NL = 'https://github.com/StickyPiston-development/tgw-lib/blob/main/typegreek_NL.exe?raw=true'

try:
	version = open('version.dat', 'r').readline()
except FileNotFoundError:
	version = open('version.dat',"w+").write("unknown")
	version = open('version.dat', 'r').readline()

uf = urllib.request.urlopen(versionurl)
UpdateVersion = str(uf.read().decode("utf-8"))

if version == UpdateVersion:
	print("The program is up to date on version " + version)
	exit()
else:
	print("The program needs to be updated.\n\nCurrent version: " + version + "\nUp to date version: " + UpdateVersion)

	typegreekFolder = os.path.expanduser('~\.typegreek')

	EN = urllib.request.urlopen(url_EN)
	NL = urllib.request.urlopen(url_EN)

	try:
		open(typegreekFolder + '\\typegreek_EN.exe', 'wb').write(EN.read())
		open(typegreekFolder + '\\typegreek_NL.exe', 'wb').write(NL.read())
	except Exception:
		print("Exception ocurred, trying again later.")
	else:
		print("Updated the program.")
		version = open('version.dat',"w+").write(UpdateVersion)