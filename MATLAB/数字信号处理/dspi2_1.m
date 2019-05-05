%	��ɢ���еĸ���Ҷ�任
%	DTTF(Discrete Time Fourier Transform)
%	Author: �ٶ��Ŀ�

N = 8;				%ԭʼ��ɢ�ź���8����
n = [0:1:N-1];		%ԭʼ�ź��� 1 �� 8 �еĵ�
xn = 0.5 .^n;		%����ԭʼ�ź�Ϊָ������

w = [-800:1:800]*4*pi/800;		%����Ƶ���� -800 �� 800 ȡ������

X = xn*exp(-j*(n'*w));			%����ԭʼ�������㸵��Ҷ�任

subplot(211)
stem(n,xn);
title('ԭʼ�ź�');
subplot(212)
plot(w/pi,abs(X));
title('DTFT�任')

