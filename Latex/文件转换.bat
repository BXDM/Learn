::����pandoc,��tex�ļ�ת��Ϊword�ĵ�
@echo off
echo ��������Ҫת�����ļ���(������׺����
set /p name=���ƣ�
echo %name%.tex
pandoc -s %name%.tex -o %name%.docx
::pandoc -s a.tex -o b.docx