@echo off

SETLOCAL enabledelayedexpansion
pushd %~dp0

rem 実行用バッチの作成 拡張子に『_』で作成しておき各作業時に都度batにする。
set FNAME=release.bat_

type nul > %FNAME%

for /f "usebackq delims== tokens=1,2" %%a in (setting.ini) do (
	rem 環境変数として登録する。
	set %%a=%%b
)

for /f %%i in (userlist.txt) do (
	echo sqlplus -s %%iUSER/%PASSWORD%@%NET_SERVICE_NAME% @%%i_release ^>^> release.LOG >> %FNAME%
)

ENDLOCAL
exit


