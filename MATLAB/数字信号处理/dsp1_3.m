% P29
%��2�D1-1_1

clear all;clc;close all;
N = 33;		
x = zeros(1,N)
x(7:27) = 1;
X = fft(x);
Y = zeros(1,33);
Y(1:6) = X(1:6);
Y(29:33) = X(29:33);
y = ifft(Y);
n = 1:N;
%��ͼ
subplot 311;
plot(n,real(y),'k');
xlabel('ȡ��');ylabel('��ֵ');
title('x(n)ʵ��')
subplot 212;
plot(n,imag(y),'k');
xlabel('ȡ��');ylabel('��ֵ');
title('x(n)�鲿')