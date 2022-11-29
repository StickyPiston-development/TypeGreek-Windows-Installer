@echo off
title TypeGreek Beta updater

rem Delete and redownload files

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

curl -A "Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; WOW64)" -L "https://github.com/StickyPiston-development/typegreek-windows/blob/main/TypeGreek_EN.ahk?raw=true" -o typegreek_EN.ahk
curl -A "Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; WOW64)" -L "https://github.com/StickyPiston-development/typegreek-windows/blob/main/TypeGrieks_NL.ahk?raw=true" -o typegreek_NL.ahk

curl -A "Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; WOW64)" -L "https://github.com/StickyPiston-development/TypeGreek-Windows-Installer/blob/installer/lib/Beta/AutoHotkeyU32.exe?raw=True" -o AutoHotkeyU32.exe
curl -A "Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; WOW64)" -L "https://github.com/StickyPiston-development/TypeGreek-Windows-Installer/blob/installer/lib/Beta/AutoHotkeyU64.exe?raw=True" -o AutoHotKeyU64.exe

curl -A "Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; WOW64)" -L "https://github.com/StickyPiston-development/TypeGreek-Windows-Installer/blob/installer/lib/Beta/Launch_Scripts/TypeGreek_Windows_32_bit.bat?raw=True" -o "TypeGreek Windows Beta 32 bit.bat"
curl -A "Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; WOW64)" -L "https://github.com/StickyPiston-development/TypeGreek-Windows-Installer/blob/installer/lib/Beta/Launch_Scripts/TypeGreek_Windows_64_bit.bat?raw=True" -o "TypeGreek Windows Beta 64 bit.bat"

curl -A "Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; WOW64)" -L "https://github.com/StickyPiston-development/TypeGreek-Windows-Installer/blob/installer/lib/create_shortcut.vbs?raw=True" -o create_shortcut.vbs
curl -A "Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; WOW64)" -L "https://github.com/StickyPiston-development/TypeGreek-Windows-Installer/blob/installer/lib/hide.vbs?raw=True" -o hide.vbs
curl -A "Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; WOW64)" -L "https://github.com/StickyPiston-development/TypeGreek-Windows-Installer/blob/installer/lib/icon.ico?raw=True" -o icon.ico

rem Replenish self

curl -A "Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; WOW64)" -L "https://raw.githubusercontent.com/MrStickyPiston/typegreek-windows/installer/beta_updater.bat" > TypeGreek_windows_beta_updater.bat

exit
