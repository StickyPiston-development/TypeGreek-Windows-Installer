!define APPNAME "TypeGreek Windows"
!define COMPANYNAME "StickyPiston development"
!define DESCRIPTION "TypeGreek windows is an easy program to type ancient greek on your windows PC."

!define VERSIONMAJOR 1
!define VERSIONMINOR 6
!define VERSIONBUILD 2

!define HELPURL "https://github.com/StickyPiston-development/typegreek-windows/issues/new" # "Support Information" link
!define UPDATEURL "https://stickypiston-development.github.io/typegreek-windows/download.html" # "Product Updates" link
!define ABOUTURL "https://stickypiston-development.github.io/typegreek-windows/index.html" # "Publisher" link

;!define INSTALLSIZE 2182

BrandingText "TypeGreek updater"

RequestExecutionLevel user
 
InstallDir "$PROFILE\.typegreek"
 
LicenseData "license.txt"

Name "${APPNAME}"
Icon "icon.ico"
outFile "TypeGreek-installer.exe"
 
!include LogicLib.nsh
 

page license
page components
page directory
Page instfiles

section test
sectionEnd