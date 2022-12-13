# usr/bin/python3
import urllib.request

versionurl = 'https://raw.githubusercontent.com/StickyPiston-development/tgw-lib/beta/version.dat'

url_EN = 'https://raw.githubusercontent.com/StickyPiston-development/typegreek-windows/main/TypeGreek_EN.ahk'
url_NL = 'https://raw.githubusercontent.com/StickyPiston-development/typegreek-windows/main/TypeGreek_NL.ahk'

url_AHK64 = 'https://github.com/StickyPiston-development/tgw-lib/blob/beta/AutoHotkeyU64.exe?raw=true'
url_AHK32 = 'https://github.com/StickyPiston-development/tgw-lib/blob/beta/AutoHotkeyU32.exe?raw=true'
try:
	try:
		version = open('version.dat', 'r').readline()
	except FileNotFoundError:
		version = open('version.dat',"w+").write("unknown")
		version = open('version.dat', 'r').readline()

	uf = urllib.request.urlopen(versionurl)
	UpdateVersion = str(uf.read().decode("utf-8"))

	if version == UpdateVersion:
		print("The program is up to date on version " + version)
	else:
		print("The program needs to be updated.\n\nCurrent version: " + version + "\nUp to date version: " + UpdateVersion)

		EN = urllib.request.urlopen(url_EN)
		NL = urllib.request.urlopen(url_NL)
		AHK64 = urllib.request.urlopen(url_AHK64)
		AHK32 = urllib.request.urlopen(url_AHK32)

		open('typegreek_EN.ahk', 'wb').write(EN.read())
		open('typegreek_NL.ahk', 'wb').write(NL.read())
		open('AutoHotkeyU64.exe', 'wb').write(AHK64.read())
		open('AutoHotkeyU32.exe', 'wb').write(AHK32.read())
		
		print("Updated the program.")
		
except Exception as E:
	print("An error ocurred. trying again later.")
else:
	version = open('version.dat',"w+").write(UpdateVersion)