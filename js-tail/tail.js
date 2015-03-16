var INTERVAL = 1000;
var RELOAD_INTERVAL = 5000;

var objParam=WScript.Arguments;
var filePath;
if (objParam.length > 0) {
  filePath = objParam(0);
} else {
  WScript.Echo("�t�@�C�����w�肵�Ă��������B");
  filePath = WScript.StdIn.ReadLine();
}

var objFSO = WScript.CreateObject("Scripting.FileSystemObject");
var objFile = objFSO.GetFile(filePath);
var lastModified = objFile.DateLastModified;
var lastSize = objFile.Size;

WScript.Echo("Program Start...");

var tmpLastModified;
var tmpLastSize;
var objReadFile;
var lastLine;

//����ǂݍ���
objReadFile = objFSO.OpenTextFile(filePath,1,true);
WScript.Echo(objReadFile.ReadAll());
lastLine = objReadFile.Line;
objReadFile.Close();
objReadFile = null;

//�t�@�C���Ď����o��
while (true) {
  WScript.Sleep(INTERVAL);
  tmpLastModified = objFile.DateLastModified;
  tmpLastSize = objFile.Size;
  if ((tmpLastModified - lastModified > RELOAD_INTERVAL) || (tmpLastSize != lastSize)) {
    lastModified = tmpLastModified;
    lastSize = tmpLastSize;

    objReadFile = objFSO.OpenTextFile(filePath,1,true);
    while (!objReadFile.AtEndOfStream) {
      if (objReadFile.Line > lastLine) {
        WScript.Echo(objReadFile.ReadLine());
      } else {
        objReadFile.SkipLine();
      }
    }
    lastLine = objReadFile.Line;
    objReadFile.Close();
  }
}

objReadFile=null;
objFile=null;
objFSO=null;
WScript.Echo("Program End");
