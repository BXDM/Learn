@echo off
set /p name=���ƣ�
set /p address=��ַ��

echo ���ƣ�%name%
echo ���ƣ�%name%>>%name%.txt
echo ��ַ��%address%
echo ��ַ��%address%>>%name%.txt
pause
start %name%.txt
