@echo off

SETLOCAL enabledelayedexpansion
pushd %~dp0

rem ���s�p�o�b�`�̍쐬 �g���q�Ɂw_�x�ō쐬���Ă����e��Ǝ��ɓs�xbat�ɂ���B
set FNAME=release.bat_

type nul > %FNAME%

for /f "usebackq delims== tokens=1,2" %%a in (setting.ini) do (
	rem ���ϐ��Ƃ��ēo�^����B
	set %%a=%%b
)

for /f %%i in (userlist.txt) do (
	echo sqlplus -s %%iUSER/%PASSWORD%@%NET_SERVICE_NAME% @%%i_release ^>^> release.LOG >> %FNAME%
)

ENDLOCAL
exit


