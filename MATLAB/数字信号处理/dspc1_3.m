% dspc1_3
% ��MATLABģ����� x(n) = 2*sin(0.02*pi*n + pi/4)������

n = [0:100];
x = 2 * sin(0.02 * pi * n + pi/4);
stem(n,x);		%���ƻ��ͷͼƬ
xlabel('n');ylabel('x(n)');title('��������');
grid on;		%���������
