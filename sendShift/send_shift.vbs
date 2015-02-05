Dim objWsh

Wscript.StdOut.WriteLine "Start:" & Time()
Set objWsh = CreateObject("WScript.Shell")

while 1
 Wscript.Sleep(1000 * 500)
 objWsh.Sendkeys("+")
 Wscript.StdOut.WriteLine "Send:" & Time()
wend
