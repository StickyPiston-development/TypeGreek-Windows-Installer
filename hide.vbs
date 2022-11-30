Set oWS = CreateObject("WScript.Shell") 
oWS.Run chr(34) &  WScript.Arguments(0) & Chr(34), 0
set oWS = nothing