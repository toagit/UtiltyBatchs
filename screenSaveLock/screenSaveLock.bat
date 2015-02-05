@echo off
rem スクリーンセーバーロックの一時解除バッチ(管理者権限)
rem 実行するとスクリーンセーバーロックを無効にします。
rem 一時停止を解除するとスクリーンセーバーロックをを有効にします。
rem param:1(有効)/0(無効)


set key="HKEY_CURRENT_USER\Software\Policies\Microsoft\Windows\Control Panel\Desktop"
set secure="ScreenSaverIsSecure"

REG QUERY %key% /f %secure%

rem キー設定
REG ADD %key% /v %secure% /t REG_SZ /d 0 /f

REG QUERY %key% /f %secure%
echo スクリーンセーバーロックを無効にしました。

pause

rem キー設定
REG ADD %key% /v %secure% /t REG_SZ /d 1 /f

REG QUERY %key% /f %secure%

echo スクリーンセーバーロックを有効にしました。
pause
