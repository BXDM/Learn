@echo off
echo ʹ�÷�����
echo ��ͼ���ļ���ͼ����Ϣ.txt���޸Ĺ����ܹ�3���ļ�����Ҫ�޸ĵ��ļ����У�˫���޸Ĺ��ߡ�ע�⣺��ico��ʽ���ļ����в����á�
pause
copy ͼ����Ϣ.txt a.txt
ren *.ico icon.ico
ren a.txt desktop.ini
attrib desktop.ini +h +s +r
attrib icon.ico +h
echo ���......
pause