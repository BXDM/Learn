@echo off
color f0
title �½�txt
echo ==============================================
echo �������ļ����ƣ�
echo ==============================================
set/p name=
echo %name%
echo ==============================================>>%name%.txt
echo %name%>>%name%.txt
echo ==============================================>>%name%.txt
echo.>>%name%.txt
start notepad %name%.txt

