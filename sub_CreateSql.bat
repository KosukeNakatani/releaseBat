@echo off

SETLOCAL enabledelayedexpansion
pushd %~dp0

for /f %%i in (userlist.txt) do (
	type nul > %%i_release.sql
	for /f "delims=" %%a in (release.sql1) do (
		set line=%%a
		rem �e���[�U�������s�X�N���v�g�̃t�H���_����t�@�C�����ɂ��ꂽ�����Ɂw�������x�ŕϊ���������B
		set line1=!line:������=%%i!
		echo !line1! >> %%i_release.sql
	)
)

ENDLOCAL
exit
