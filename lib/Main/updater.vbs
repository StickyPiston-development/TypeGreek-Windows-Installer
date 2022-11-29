Set oWS = CreateObject("WScript.Shell") 
oWS.Run chr(34) &  "%UserProfile%\.typegreek\updater.bat" & Chr(34), 0
set oWS = nothing