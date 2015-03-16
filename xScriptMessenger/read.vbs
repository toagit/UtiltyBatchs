dir =""
name = "IDxxxx"
filePath = dir & "MSG_" & name & ".txt"
interval = 10000

Set objFSO = WScript.CreateObject("Scripting.FileSystemObject")
Set objShell = WScript.CreateObject("WScript.Shell")

Set objFile = objFSO.GetFile(filePath)
lastModified = objFile.DateLastModified

WScript.Echo "Program Start"

Do
  WScript.Sleep(interval)
  tmpLastModified = objFile.DateLastModified
  If lastModified <> tmpLastModified Then
    lastModified = tmpLastModified

    Set objReadFile = objFSO.OpenTextFile(filePath, 1, True)
    Do Until objReadFile.AtEndOfStream
      WScript.Echo name & " : " & objReadFile.ReadLine
    Loop
    objReadFile.Close
  End If
Loop

objReadFile.Close