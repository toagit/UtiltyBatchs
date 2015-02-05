rem #############################

rem 圧縮ファイル解答バッチ

rem #############################

set HOME_DIR=D:\
set archive=arch.zip
set lhaz="C:\Program Files\lhaz\lhaz.exe"

rem ------[Lhaz用コマンド]------
rem [オプション]/e:解凍
rem [オプション]/q:ポップアップ省略
rem [注意      ]Lhazの解凍設定で「このフォルダに解凍」を設定すること
rem ----------------------------

%lhaz /e /q %HOME_DIR%%archive%

pause
exit