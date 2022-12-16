!define APPNAME "TypeGreek Windows"
!define COMPANYNAME "StickyPiston development"
!define DESCRIPTION "TypeGreek windows is an easy program to type ancient greek on your windows PC."

!define VERSIONMAJOR 1
!define VERSIONMINOR 7
!define VERSIONBUILD 2

!define HELPURL "https://github.com/StickyPiston-development/typegreek-windows/issues/new" # "Support Information" link
!define UPDATEURL "https://stickypiston-development.github.io/typegreek-windows/download.html" # "Product Updates" link
!define ABOUTURL "https://stickypiston-development.github.io/typegreek-windows/index.html" # "Publisher" link

!define INSTALLSIZE 0000
!define INSTALLSIZE_MAIN 8402700
!define INSTALLSIZE_BETA 8202700

BrandingText "TypeGreek installer"

RequestExecutionLevel user

InstallDir "$PROFILE\.typegreek"

LicenseData "license.txt"

Name "${APPNAME}"
Icon "icon.ico"
outFile "TypeGreek-installer.exe"

!include LogicLib.nsh


page license
Page components
page directory
Page instfiles

section "TypeGreek Windows"
	
	setOutPath $INSTDIR
	# Files added here should be removed by the uninstaller (see section "uninstall")
	file "TypeGreek_EN.exe"
    file "TypeGreek_NL.exe"

	file "AutoHotKeyU32.exe"
	CreateDirectory "$INSTDIR\addons"

	file "icon.ico"
	file "disabled_icon.ico"

	writeUninstaller "$INSTDIR\uninstall.exe"

	# Start Menu
	createDirectory "$SMPROGRAMS\${COMPANYNAME}"
	createShortCut "$SMPROGRAMS\${COMPANYNAME}\TypeGreek Windows (EN).lnk" "$INSTDIR\TypeGreek_EN.exe" "" "$INSTDIR\icon.ico"
    createShortCut "$SMPROGRAMS\${COMPANYNAME}\TypeGreek Windows (NL).lnk" "$INSTDIR\TypeGreek_NL.exe" "" "$INSTDIR\icon.ico"
	createShortCut "$DESKTOP\TypeGreek Windows (EN).lnk" "$INSTDIR\TypeGreek_EN.exe" "" "$INSTDIR\icon.ico"
    createShortCut "$DESKTOP\TypeGreek Windows (NL).lnk" "$INSTDIR\TypeGreek_NL.exe" "" "$INSTDIR\icon.ico"

	# Registry information for add/remove programs
	WriteRegStr HKCU "Software\Microsoft\Windows\CurrentVersion\Uninstall\${COMPANYNAME} ${APPNAME}" "DisplayName" "${APPNAME} ${VERSIONMAJOR}.${VERSIONMINOR}.${VERSIONBUILD}"
	WriteRegStr HKCU "Software\Microsoft\Windows\CurrentVersion\Uninstall\${COMPANYNAME} ${APPNAME}" "UninstallString" "$\"$INSTDIR\uninstall.exe$\""
	WriteRegStr HKCU "Software\Microsoft\Windows\CurrentVersion\Uninstall\${COMPANYNAME} ${APPNAME}" "QuietUninstallString" "$\"$INSTDIR\uninstall.exe$\" /S"
	WriteRegStr HKCU "Software\Microsoft\Windows\CurrentVersion\Uninstall\${COMPANYNAME} ${APPNAME}" "InstallLocation" "$\"$INSTDIR$\""
	WriteRegStr HKCU "Software\Microsoft\Windows\CurrentVersion\Uninstall\${COMPANYNAME} ${APPNAME}" "DisplayIcon" "$\"$INSTDIR\icon.ico$\""
	WriteRegStr HKCU "Software\Microsoft\Windows\CurrentVersion\Uninstall\${COMPANYNAME} ${APPNAME}" "Publisher" "${COMPANYNAME}"
	WriteRegStr HKCU "Software\Microsoft\Windows\CurrentVersion\Uninstall\${COMPANYNAME} ${APPNAME}" "HelpLink" "$\"${HELPURL}$\""
	WriteRegStr HKCU "Software\Microsoft\Windows\CurrentVersion\Uninstall\${COMPANYNAME} ${APPNAME}" "URLUpdateInfo" "$\"${UPDATEURL}$\""
	WriteRegStr HKCU "Software\Microsoft\Windows\CurrentVersion\Uninstall\${COMPANYNAME} ${APPNAME}" "URLInfoAbout" "$\"${ABOUTURL}$\""
	WriteRegStr HKCU "Software\Microsoft\Windows\CurrentVersion\Uninstall\${COMPANYNAME} ${APPNAME}" "DisplayVersion" "${VERSIONMAJOR}.${VERSIONMINOR}.${VERSIONBUILD}"
	WriteRegDWORD HKCU "Software\Microsoft\Windows\CurrentVersion\Uninstall\${COMPANYNAME} ${APPNAME}" "VersionMajor" ${VERSIONMAJOR}
	WriteRegDWORD HKCU "Software\Microsoft\Windows\CurrentVersion\Uninstall\${COMPANYNAME} ${APPNAME}" "VersionMinor" ${VERSIONMINOR}
	# There is no option for modifying or repairing the install
	WriteRegDWORD HKCU "Software\Microsoft\Windows\CurrentVersion\Uninstall\${COMPANYNAME} ${APPNAME}" "NoModify" 1
	WriteRegDWORD HKCU "Software\Microsoft\Windows\CurrentVersion\Uninstall\${COMPANYNAME} ${APPNAME}" "NoRepair" 1
	# Set the INSTALLSIZE constant (!defined at the top of this script) so Add/Remove Programs can accurately report the size
	WriteRegDWORD HKCU "Software\Microsoft\Windows\CurrentVersion\Uninstall\${COMPANYNAME} ${APPNAME}" "EstimatedSize" ${INSTALLSIZE_MAIN}

sectionEnd

section "TypeGreek Windows Updater"
	setOutPath "$INSTDIR"
	${IfNot} ${FileExists} `$INSTDIR\*.*`
		MessageBox MB_OK "Sorry, but you can't install the updater without the main program"
		Abort "Can not install updater without the program"
	${EndIf}
	file "typegreek_updater.exe"
	CreateShortCut "$SMPROGRAMS\Startup\TypeGreek updater.lnk" "$INSTDIR\typegreek_updater.exe" "" "$INSTDIR\icon.ico"
sectionEnd

section /o "TypeGreek Windows Beta"
	setOutPath "$INSTDIR\beta"
	file "AutoHotKeyU32.exe"
	file "AutoHotKeyU64.exe"
	file "typegreek_EN.ahk"
	file "typegreek_NL.ahk"

	CreateDirectory "$INSTDIR\beta\addons"

	file "icon.ico"
	file "disabled_icon.ico"

	writeUninstaller "$INSTDIR\uninstall_beta.exe"

	createShortCut "$SMPROGRAMS\${COMPANYNAME}\TypeGreek Windows Beta (64 Bit).lnk" "$INSTDIR\beta\AutoHotKeyU64.exe" "typegreek_EN.ahk" "$INSTDIR\beta\icon.ico"
    createShortCut "$SMPROGRAMS\${COMPANYNAME}\TypeGreek Windows Beta (32 Bit).lnk" "$INSTDIR\beta\AutoHotKeyU32.exe" "typegreek_EN.ahk" "$INSTDIR\beta\icon.ico"
	createShortCut "$DESKTOP\TypeGreek Windows Beta (64 Bit).lnk" "$INSTDIR\beta\AutoHotKeyU64.exe" "typegreek_EN.ahk" "$INSTDIR\beta\icon.ico"
    createShortCut "$DESKTOP\TypeGreek Windows Beta (32 Bit).lnk" "$INSTDIR\beta\AutoHotKeyU64.exe" "typegreek_EN.ahk" "$INSTDIR\beta\icon.ico"

	WriteRegStr HKCU "Software\Microsoft\Windows\CurrentVersion\Uninstall\${COMPANYNAME} ${APPNAME} Beta" "DisplayName" "${APPNAME} Beta ${VERSIONMAJOR}.${VERSIONMINOR}.${VERSIONBUILD}"
	WriteRegStr HKCU "Software\Microsoft\Windows\CurrentVersion\Uninstall\${COMPANYNAME} ${APPNAME} Beta" "UninstallString" "$\"$INSTDIR\uninstall_beta.exe$\""
	WriteRegStr HKCU "Software\Microsoft\Windows\CurrentVersion\Uninstall\${COMPANYNAME} ${APPNAME} Beta" "QuietUninstallString" "$\"$INSTDIR\uninstall_beta.exe$\" /S"
	WriteRegStr HKCU "Software\Microsoft\Windows\CurrentVersion\Uninstall\${COMPANYNAME} ${APPNAME} Beta" "InstallLocation" "$\"$INSTDIR\beta$\""
	WriteRegStr HKCU "Software\Microsoft\Windows\CurrentVersion\Uninstall\${COMPANYNAME} ${APPNAME} Beta" "DisplayIcon" "$\"$INSTDIR\beta\icon.ico$\""
	WriteRegStr HKCU "Software\Microsoft\Windows\CurrentVersion\Uninstall\${COMPANYNAME} ${APPNAME} Beta" "Publisher" "${COMPANYNAME}"
	WriteRegStr HKCU "Software\Microsoft\Windows\CurrentVersion\Uninstall\${COMPANYNAME} ${APPNAME} Beta" "HelpLink" "$\"${HELPURL}$\""
	WriteRegStr HKCU "Software\Microsoft\Windows\CurrentVersion\Uninstall\${COMPANYNAME} ${APPNAME} Beta" "URLUpdateInfo" "$\"${UPDATEURL}$\""
	WriteRegStr HKCU "Software\Microsoft\Windows\CurrentVersion\Uninstall\${COMPANYNAME} ${APPNAME} Beta" "URLInfoAbout" "$\"${ABOUTURL}$\""
	WriteRegStr HKCU "Software\Microsoft\Windows\CurrentVersion\Uninstall\${COMPANYNAME} ${APPNAME} Beta" "DisplayVersion" "${VERSIONMAJOR}.${VERSIONMINOR}.${VERSIONBUILD}"
	WriteRegDWORD HKCU "Software\Microsoft\Windows\CurrentVersion\Uninstall\${COMPANYNAME} ${APPNAME} Beta" "VersionMajor" ${VERSIONMAJOR}
	WriteRegDWORD HKCU "Software\Microsoft\Windows\CurrentVersion\Uninstall\${COMPANYNAME} ${APPNAME} Beta" "VersionMinor" ${VERSIONMINOR}
	# There is no option for modifying or repairing the install
	WriteRegDWORD HKCU "Software\Microsoft\Windows\CurrentVersion\Uninstall\${COMPANYNAME} ${APPNAME} Beta" "NoModify" 1
	WriteRegDWORD HKCU "Software\Microsoft\Windows\CurrentVersion\Uninstall\${COMPANYNAME} ${APPNAME} Beta" "NoRepair" 1
	# Set the INSTALLSIZE constant (!defined at the top of this script) so Add/Remove Programs can accurately report the size
	WriteRegDWORD HKCU "Software\Microsoft\Windows\CurrentVersion\Uninstall\${COMPANYNAME} ${APPNAME} Beta" "EstimatedSize" ${INSTALLSIZE_BETA}
sectionEnd

section /o "TypeGreek Windows Beta Updater"
	${IfNot} ${FileExists} `$INSTDIR\Beta\*.*`
		MessageBox MB_OK "Sorry, but you can't install the beta updater without the beta program"
		Abort "Can not install beta updater without beta program"
	${EndIf}
	setOutPath "$INSTDIR\beta"
	file "typegreek_beta_updater.exe"
	CreateShortCut "$SMPROGRAMS\Startup\TypeGreek Beta updater.lnk" "$INSTDIR\beta\typegreek_beta_updater.exe" "" "$INSTDIR\icon.ico"
sectionEnd
# Uninstaller

UninstPage components
UninstPage uninstConfirm
UninstPage instfiles

section /o "un.TypeGreek windows"
	delete "$SMPROGRAMS\${COMPANYNAME}\TypeGreek Windows (EN).lnk"
    delete "$SMPROGRAMS\${COMPANYNAME}\TypeGreek Windows (NL).lnk"
	delete "$DESKTOP\TypeGreek Windows (EN).lnk"
    delete "$DESKTOP\TypeGreek Windows (NL).lnk"

	delete "$SMPROGRAMS\Startup\TypeGreek updater.lnk"
	
	rmDir "$SMPROGRAMS\${COMPANYNAME}"

	delete $INSTDIR\TypeGreek_EN.exe
    delete $INSTDIR\TypeGreek_NL.exe
	delete $INSTDIR\typegreek_updater.exe

	delete $INSTDIR\icon.ico
	delete $INSTDIR\disabled_icon.ico

	delete $INSTDIR\AutoHotKeyU32.exe
	RMDir /r $INSTDIR\addons

	delete $INSTDIR\diacritics.dat
	delete $INSTDIR\version.dat

	delete $INSTDIR\uninstall.exe

	rmDir $INSTDIR

	DeleteRegKey HKCU "Software\Microsoft\Windows\CurrentVersion\Uninstall\${COMPANYNAME} ${APPNAME}"
sectionEnd

section /o "un.TypeGreek Windows Beta"
	delete "$SMPROGRAMS\${COMPANYNAME}\TypeGreek Windows Beta (64 Bit).lnk"
    delete "$SMPROGRAMS\${COMPANYNAME}\TypeGreek Windows Beta (32 Bit).lnk"
	delete "$DESKTOP\TypeGreek Windows Beta (64 Bit).lnk"
    delete "$DESKTOP\TypeGreek Windows Beta (32 Bit).lnk"

	delete "$SMPROGRAMS\Startup\TypeGreek Beta updater.lnk"

	rmDir "$SMPROGRAMS\${COMPANYNAME}"

	delete $INSTDIR\beta\AutoHotKeyU64.exe
	delete $INSTDIR\beta\AutoHotKeyU32.exe
	delete $INSTDIR\beta\typegreek_EN.ahk
	delete $INSTDIR\beta\typegreek_NL.ahk

	delete $INSTDIR\beta\typegreek_beta_updater.exe

	delete $INSTDIR\beta\icon.ico
	delete $INSTDIR\beta\disabled_icon.ico

	RMDir /r $INSTDIR\beta\addons

	delete $INSTDIR\beta\diacritics.dat
	delete $INSTDIR\beta\version.dat

	delete $INSTDIR\uninstall_beta.exe

	rmDir $INSTDIR\beta
	rmDir $INSTDIR

	DeleteRegKey HKCU "Software\Microsoft\Windows\CurrentVersion\Uninstall\${COMPANYNAME} ${APPNAME} Beta"
sectionEnd