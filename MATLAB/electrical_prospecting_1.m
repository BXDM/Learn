%	electrical_prospecting
%	P-17	��̽��ȵĸ���

t = 0:0.01:10;

temp1 = 1+t.^2;
temp2 = temp1.^(-3/2); 
y = temp2;
	
plot(t,y)
xlabel('h/L')
ylabel('jh/jo')
title('�����ʷ���̽���')
