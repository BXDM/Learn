%ָ���ź�
% �Ͽ��ļ� ��MATLAB�е�stem�������0.5exp(n)���У�n��0��10��
% dsoc1_0
clc;clear all

n = [0:10];			%�����������
x = (0.5).^n;		%����ֵ����
stem(n,x)
xlabel('n'),ylabel('x(n');title('ʵָ������');
grid on;		%�������
