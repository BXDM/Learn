::�½�һ��Word�ļ�

@echo off
color f0
title �½�Word�ĵ�
echo ==============================================
echo �������ļ����ƣ�
echo ==============================================
set/p name=
echo %name%
echo ==============================================>>%name%.docx
echo %name%>>%name%.docx
echo ==============================================>>%name%.docx
start winword %name%.docx

