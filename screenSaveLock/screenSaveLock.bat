@echo off
rem �X�N���[���Z�[�o�[���b�N�̈ꎞ�����o�b�`(�Ǘ��Ҍ���)
rem ���s����ƃX�N���[���Z�[�o�[���b�N�𖳌��ɂ��܂��B
rem �ꎞ��~����������ƃX�N���[���Z�[�o�[���b�N����L���ɂ��܂��B
rem param:1(�L��)/0(����)


set key="HKEY_CURRENT_USER\Software\Policies\Microsoft\Windows\Control Panel\Desktop"
set secure="ScreenSaverIsSecure"

REG QUERY %key% /f %secure%

rem �L�[�ݒ�
REG ADD %key% /v %secure% /t REG_SZ /d 0 /f

REG QUERY %key% /f %secure%
echo �X�N���[���Z�[�o�[���b�N�𖳌��ɂ��܂����B

pause

rem �L�[�ݒ�
REG ADD %key% /v %secure% /t REG_SZ /d 1 /f

REG QUERY %key% /f %secure%

echo �X�N���[���Z�[�o�[���b�N��L���ɂ��܂����B
pause
