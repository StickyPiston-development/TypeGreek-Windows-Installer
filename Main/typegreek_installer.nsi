!define APPNAME "TypeGreek Windows"
!define COMPANYNAME "StickyPiston development"
!define DESCRIPTION "TypeGreek windows is an easy program to type ancient greek on your windows PC."

!define VERSIONMAJOR 1
!define VERSIONMINOR 6
!define VERSIONBUILD 3

!define HELPURL "https://github.com/StickyPiston-development/typegreek-windows/issues/new" # "Support Information" link
!define UPDATEURL "https://stickypiston-development.github.io/typegreek-windows/download.html" # "Product Updates" link
!define ABOUTURL "https://stickypiston-development.github.io/typegreek-windows/index.html" # "Publisher" link

!define INSTALLSIZE 2182

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
	file "icon.ico"

	writeUninstaller "$INSTDIR\uninstall.exe"

	# Start Menu
	createDirectory "$SMPROGRAMS\${COMPANYNAME}"
	createShortCut "$SMPROGRAMS\${COMPANYNAME}\TypeGreek Windows (EN).lnk" "$INSTDIR\TypeGreek_EN.exe" "" "$INSTDIR\icon.ico"
    createShortCut "$SMPROGRAMS\${COMPANYNAME}\TypeGreek Windows (NL).lnk" "$INSTDIR\TypeGreek_NL.exe" "" "$INSTDIR\icon.ico"
	createShortCut "$DESKTOP\TypeGreek Windows (EN).lnk" "$INSTDIR\TypeGreek_EN.exe" "" "$INSTDIR\icon.ico"
    createShortCut "$DESKTOP\TypeGreek Windows (NL).lnk" "$INSTDIR\TypeGreek_NL.exe" "" "$INSTDIR\icon.ico"

	# Registry information for add/remove programs
	WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${COMPANYNAME} ${APPNAME}" "DisplayName" "${COMPANYNAME} - ${APPNAME} - ${DESCRIPTION}"
	WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${COMPANYNAME} ${APPNAME}" "UninstallString" "$\"$INSTDIR\uninstall.exe$\""
	WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${COMPANYNAME} ${APPNAME}" "QuietUninstallString" "$\"$INSTDIR\uninstall.exe$\" /S"
	WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${COMPANYNAME} ${APPNAME}" "InstallLocation" "$\"$INSTDIR$\""
	WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${COMPANYNAME} ${APPNAME}" "DisplayIcon" "$\"$INSTDIR\icon.ico$\""
	WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${COMPANYNAME} ${APPNAME}" "Publisher" "$\"${COMPANYNAME}$\""
	WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${COMPANYNAME} ${APPNAME}" "HelpLink" "$\"${HELPURL}$\""
	WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${COMPANYNAME} ${APPNAME}" "URLUpdateInfo" "$\"${UPDATEURL}$\""
	WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${COMPANYNAME} ${APPNAME}" "URLInfoAbout" "$\"${ABOUTURL}$\""
	WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${COMPANYNAME} ${APPNAME}" "DisplayVersion" "$\"${VERSIONMAJOR}.${VERSIONMINOR}.${VERSIONBUILD}$\""
	WriteRegDWORD HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${COMPANYNAME} ${APPNAME}" "VersionMajor" ${VERSIONMAJOR}
	WriteRegDWORD HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${COMPANYNAME} ${APPNAME}" "VersionMinor" ${VERSIONMINOR}
	# There is no option for modifying or repairing the install
	WriteRegDWORD HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${COMPANYNAME} ${APPNAME}" "NoModify" 1
	WriteRegDWORD HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${COMPANYNAME} ${APPNAME}" "NoRepair" 1
	# Set the INSTALLSIZE constant (!defined at the top of this script) so Add/Remove Programs can accurately report the size
	WriteRegDWORD HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${COMPANYNAME} ${APPNAME}" "EstimatedSize" ${INSTALLSIZE}

sectionEnd

section "TypeGreek Windows Updater"
	${IfNot} ${FileExists} `$INSTDIR\*.*`
		MessageBox MB_OK "Sorry, but you can't install the updater without the main program"
		Abort "Can not install updater without the program"
	${EndIf}
	file "typegreek_updater.exe"
	CreateShortCut "$SMPROGRAMS\Startup\TypeGreek updater.lnk" "$INSTDIR\typegreek_updater.exe" "" "$INSTDIR\icon.ico"
sectionEnd
# Uninstaller

section "uninstall"

	# Remove Start Menu launcher
	delete "$SMPROGRAMS\${COMPANYNAME}\TypeGreek Windows (EN).lnk"
    delete "$SMPROGRAMS\${COMPANYNAME}\TypeGreek Windows (NL).lnk"
	delete "$DESKTOP\TypeGreek Windows (EN).lnk"
    delete "$DESKTOP\TypeGreek Windows (NL).lnk"

	delete "$SMPROGRAMS\Startup\TypeGreek updater.lnk"
	
	# Try to remove the Start Menu folder - this will only happen if it is empty
	rmDir "$SMPROGRAMS\${COMPANYNAME}"

	# Remove files
	delete $INSTDIR\TypeGreek_EN.exe
    delete $INSTDIR\TypeGreek_NL.exe
	delete $INSTDIR\typegreek_updater.exe
	delete $INSTDIR\icon.ico

	delete $INSTDIR\diacritics.dat
	delete $INSTDIR\version.dat

	# Always delete uninstaller as the last action
	delete $INSTDIR\uninstall.exe

	# Try to remove the install directory - this will only happen if it is empty
	rmDir $INSTDIR

	# Remove uninstaller information from the registry
	DeleteRegKey HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${COMPANYNAME} ${APPNAME}"
sectionEnd