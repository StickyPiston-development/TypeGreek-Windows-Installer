# usr/bin/python3
import urllib.request

versionurl = 'https://raw.githubusercontent.com/StickyPiston-development/typegreek-lib/main/version.dat'

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
	print("The program needs to be updated.\n\nCurrent version:   " + version + "\nUp to date version:   " + UpdateVersion)
	version = open('version.dat',"w+").write(UpdateVersion)