% dspc1_4
% ��Ծ�ź�

n0 = 0;
n1 = -10;
n2  = 10
n = [n1:n2];
x = [(n - n0) > 0];
% ��ֻ�е�n - n0 >= 0ʱֵ��Ϊ1������Ϊ0
stem(n,x)
xlabel('n');ylabel('x(n)');title('��Ծ����');
grid on;