@echo off
title TypeGreek Beta installer

rem Check folder exists
if not exist "%UserProfile%\.typegreek_beta" mkdir %UserProfile%\.typegreek_beta

rem Delete files to replace with new ones

cd %UserProfile%\.typegreek_beta
del -f typegreek_EN.ahk
del -f typegreek_NL.ahk

del -f AutoHotkeyU32.exe
del -f AutoHotKeyU64.exe

del -f "TypeGreek Windows Beta 32 bit.bat"
del -f "TypeGreek Windows Beta 64 bit.bat"

del -f create_shortcut.vbs
del -f hide.vbs
del -f icon.ico

rem Download fresh files

curl -A "Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; WOW64)" -L "https://github.com/StickyPiston-development/typegreek-windows/blob/main/TypeGreek_EN.ahk?raw=true" -o typegreek_EN.ahk
curl -A "Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; WOW64)" -L "https://github.com/StickyPiston-development/typegreek-windows/blob/main/TypeGrieks_NL.ahk?raw=true" -o typegreek_NL.ahk

curl -A "Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; WOW64)" -L "https://github.com/StickyPiston-development/TypeGreek-Windows-Installer/blob/installer/lib/Beta/AutoHotkeyU32.exe?raw=True" -o AutoHotkeyU32.exe
curl -A "Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; WOW64)" -L "https://github.com/StickyPiston-development/TypeGreek-Windows-Installer/blob/installer/lib/Beta/AutoHotkeyU64.exe?raw=True" -o AutoHotKeyU64.exe

curl -A "Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; WOW64)" -L "https://github.com/StickyPiston-development/TypeGreek-Windows-Installer/blob/installer/lib/Beta/Launch_Scripts/TypeGreek_Windows_32_bit.bat?raw=True" -o "TypeGreek Windows Beta 32 bit.bat"
curl -A "Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; WOW64)" -L "https://github.com/StickyPiston-development/TypeGreek-Windows-Installer/blob/installer/lib/Beta/Launch_Scripts/TypeGreek_Windows_64_bit.bat?raw=True" -o "TypeGreek Windows Beta 64 bit.bat"

curl -A "Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; WOW64)" -L "https://github.com/StickyPiston-development/TypeGreek-Windows-Installer/blob/installer/lib/create_shortcut.vbs?raw=True" -o create_shortcut.vbs
curl -A "Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; WOW64)" -L "https://github.com/StickyPiston-development/TypeGreek-Windows-Installer/blob/installer/lib/hide.vbs?raw=True" -o hide.vbs
curl -A "Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; WOW64)" -L "https://github.com/StickyPiston-development/TypeGreek-Windows-Installer/blob/installer/lib/icon.ico?raw=True" -o icon.ico

rem Register auto updater

del beta_updater.bat
curl -A "Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; WOW64)" -L "https://github.com/StickyPiston-development/TypeGreek-Windows-Installer/blob/installer/lib/Beta/beta_updater.bat?raw=True" -o beta_updater.bat

cd %appdata%\Microsoft\Windows\Start Menu\Programs\Startup
del TypeGreek_windows_beta_updater.vbs
curl -A "Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; WOW64)" -L "https://github.com/StickyPiston-development/TypeGreek-Windows-Installer/blob/installer/lib/Beta/beta_updater.vbs?raw=True" -o TypeGreek_windows_beta_updater.bat

rem Remove and readd start menu shortcuts

cd %AppData%\Microsoft\Windows\Start Menu\Programs
del "TypeGreek Windows Beta 32 Bit.lnk"
del "TypeGreek Windows Beta 64 Bit.lnk"

start %UserProfile%\.typegreek_beta\create_shortcut.vbs "%AppData%\Microsoft\Windows\Start Menu\Programs\TypeGreek Windows Beta 32 Bit.lnk" "%UserProfile%\.typegreek_beta\TypeGreek Windows Beta 32 bit.bat" "%UserProfile%\.typegreek_beta\icon.ico"
start %UserProfile%\.typegreek_beta\create_shortcut.vbs "%AppData%\Microsoft\Windows\Start Menu\Programs\TypeGreek Windows Beta 64 Bit.lnk" "%UserProfile%\.typegreek_beta\TypeGreek Windows Beta 64 bit.bat" "%UserProfile%\.typegreek_beta\icon.ico"

rem Remove and readd Desktop shortcuts

cd %UserProfile%\Desktop
del "TypeGreek Windows Beta 32 Bit.lnk"
del "TypeGreek Windows Beta 64 Bit.lnk"

start %UserProfile%\.typegreek_beta\create_shortcut.vbs "%UserProfile%\Desktop\TypeGreek Windows Beta 32 Bit.lnk" "%UserProfile%\.typegreek_beta\TypeGreek Windows Beta 32 bit.bat" "%UserProfile%\.typegreek_beta\icon.ico"
start %UserProfile%\.typegreek_beta\create_shortcut.vbs "%UserProfile%\Desktop\TypeGreek Windows Beta 64 Bit.lnk" "%UserProfile%\.typegreek_beta\TypeGreek Windows Beta 64 bit.bat" "%UserProfile%\.typegreek_beta\icon.ico"

rem Notify the user

echo set WshShell = WScript.CreateObject("WScript.Shell") > %tmp%\tmp.vbs
echo WScript.Quit (WshShell.Popup( "TypeGreek windows and AutoHotKey have been installed!" ,10 ,"TypeGreek windows installer", 0)) >> %tmp%\tmp.vbs
cscript /nologo %tmp%\tmp.vbs
del %tmp%\tmp.vbs