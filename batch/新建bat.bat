::�½�һ�������Ƶ�bat�ļ�

@echo off
color f0
echo ������bat���ƣ�
set/p name=
echo %name%
rem echo %name%>>%name%.bat
echo @echo off>>%name%.bat
start notepad %name%.bat