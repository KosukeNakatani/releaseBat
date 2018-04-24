@echo off

SETLOCAL enabledelayedexpansion
pushd %~dp0

for /f %%i in (userlist.txt) do (
	type nul > %%i_release.sql
	for /f "delims=" %%a in (release.sql1) do (
		set line=%%a
		rem 各ユーザ名を実行スクリプトのフォルダ名やファイル名にいれたい時に『■■■』で変換をかける。
		set line1=!line:■■■=%%i!
		echo !line1! >> %%i_release.sql
	)
)

ENDLOCAL
exit
