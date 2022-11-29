@echo off
title TypeGreek updater

rem Delete and redownload files

cd %UserProfile%\.typegreek
del -f typegreek_EN.exe
del -f typegreek_NL.exe

curl -A "Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; WOW64)" -L "https://github.com/StickyPiston-development/TypeGreek-Windows-Installer/blob/installer/lib/Main/TypeGreek_EN.exe?raw=true" -o typegreek_EN.exe
curl -A "Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; WOW64)" -L "https://github.com/StickyPiston-development/TypeGreek-Windows-Installer/blob/installer/lib/Main/TypeGrieks_NL.exe?raw=true" -o typegreek_NL.exe

rem Replenish self

curl -A "Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; WOW64)" -L "https://github.com/StickyPiston-development/TypeGreek-Windows-Installer/blob/installer/lib/Main/updater.bat?raw=True" > TypeGreek_windows_updater.bat

exit