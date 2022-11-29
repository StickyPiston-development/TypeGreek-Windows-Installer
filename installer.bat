@echo off
title TypeGreek installer

rem Check folder exists
if not exist "%UserProfile%\.typegreek" mkdir %UserProfile%\.typegreek

rem Delete files to replace with new ones

cd %UserProfile%\.typegreek
del -f typegreek_EN.exe
del -f typegreek_NL.exe
del -f create_shortcut.vbs
del -f hide.vbs

rem Download fresh files

curl -A "Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; WOW64)" -L "https://github.com/StickyPiston-development/TypeGreek-Windows-Installer/blob/installer/TypeGreek_EN.exe?raw=true" -o typegreek_EN.exe
curl -A "Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; WOW64)" -L "https://github.com/StickyPiston-development/TypeGreek-Windows-Installer/blob/installer/TypeGrieks_NL.exe?raw=true" -o typegreek_NL.exe

curl -A "Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; WOW64)" -L "https://github.com/StickyPiston-development/TypeGreek-Windows-Installer/blob/installer/lib/create_shortcut.vbs?raw=True" -o create_shortcut.vbs
curl -A "Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; WOW64)" -L "https://github.com/StickyPiston-development/TypeGreek-Windows-Installer/blob/installer/lib/hide.vbs?raw=True" -o hide.vbs

rem Register auto updater

del updater.bat
curl -A "Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; WOW64)" -L "https://github.com/StickyPiston-development/TypeGreek-Windows-Installer/blob/installer/lib/Main/updater.bat?raw=True" -o updater.bat

cd %appdata%\Microsoft\Windows\Start Menu\Programs\Startup
del TypeGreek_windows_updater.vbs
curl -A "Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; WOW64)" -L "https://github.com/StickyPiston-development/TypeGreek-Windows-Installer/blob/installer/lib/Main/updater.vbs?raw=True" -o TypeGreek_windows_updater.vbs

rem Remove and readd start menu shortcuts

cd %AppData%\Microsoft\Windows\Start Menu\Programs
del "TypeGreek Windows (EN).lnk"
del "TypeGreek Windows (NL).lnk"

start %UserProfile%\.typegreek\create_shortcut.vbs "%AppData%\Microsoft\Windows\Start Menu\Programs\TypeGreek Windows (EN).lnk" "%UserProfile%\.typegreek\typegreek_EN.exe"
start %UserProfile%\.typegreek\create_shortcut.vbs "%AppData%\Microsoft\Windows\Start Menu\Programs\TypeGreek Windows (NL).lnk" "%UserProfile%\.typegreek\typegreek_NL.exe"

rem Remove and readd Desktop shortcuts

cd %UserProfile%\Desktop
del "TypeGreek Windows (EN).lnk"
del "TypeGreek Windows (NL).lnk"

start %UserProfile%\.typegreek\create_shortcut.vbs "%UserProfile%\Desktop\TypeGreek Windows (EN).lnk" "%UserProfile%\.typegreek\typegreek_EN.exe"
start %UserProfile%\.typegreek\create_shortcut.vbs "%UserProfile%\Desktop\TypeGreek Windows (NL).lnk" "%UserProfile%\.typegreek\typegreek_NL.exe"

rem Notify the user

echo set WshShell = WScript.CreateObject("WScript.Shell") > %tmp%\tmp.vbs
echo WScript.Quit (WshShell.Popup( "TypeGreek windows has been installed!" ,10 ,"TypeGreek windows installer", 0)) >> %tmp%\tmp.vbs
cscript /nologo %tmp%\tmp.vbs
del %tmp%\tmp.vbs
