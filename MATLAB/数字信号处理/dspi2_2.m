%	��ɢ����Ҷ�任
%	DFT(Discrete Fourier Transform)
%	Authou: �ٶ��Ŀ�

%{
N = 8;
n = [0:1:N-1];
xn = 0.5 .^n;

w = [-800:1:800]*4*pi/8;
X = xn*exp(-j*(n'*w));

subplot(311)
stem(n,xn)

w1 = [-4:1:4]*4

%}

N=8; %ԭ��ɢ�ź���8��
n=[0:1:N-1] %ԭ�ź���1��8 �еľ���
xn=0.5.^n; %����ԭʼ�źţ�Ϊָ���ź�
w=[-8:1:8]*4*pi/8; %Ƶ��-800----+800 �ĳ��ȣ���Ӧ�������Ƶ�������٣���ʡȥ��
X=xn*exp(-j*(n'*w)); %��dtft�任������ԭʼ����ķ������Ը�ָ��������Ͷ���
subplot(311)
stem(n,xn);
w1=[-4:1:4]*4*pi/4;
X1=xn*exp(-j*(n'*w1));
title('ԭʼ�ź�(ָ���ź�)');
subplot(312);
stem(w/pi,abs(X));
title('ԭ�źŵ�16 ��DFT �任')
subplot(313)
stem(w1/pi,abs(X1));
title('ԭ�źŵ�8��DFT �任')
