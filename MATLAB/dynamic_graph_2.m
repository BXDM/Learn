close all;
clear all;
clc;
clf;    %
%��ɫ����
axis([-2,2,-2,2]);
xlabel('X��');
ylabel('Y��');
%���ܵı߿�
box on;

%��ͼ����
t=0:0.02:10;  
Nt=size(t,2);
x=2*cos(t(1:Nt));
y=sin(t(1:Nt));
%ѭ����ͼ
for i=1:Nt;
    cla;        %�������ȥ
    hold on;
    plot(x,y)
    plot(x(i),y(i),'o');
    frame=getframe(gcf);    %�Խ�ͼ�ķ�ʽ�������ƹ���
    imind=frame2im(frame);
    [imind,cm] = rgb2ind(imind,256);
    if i==1
         imwrite(imind,cm,'test.gif','gif', 'Loopcount',inf,'DelayTime',1e-4);
    else
         imwrite(imind,cm,'test.gif','gif','WriteMode','append','DelayTime',1e-4);
    end
end
% --------------------- 
% ���ߣ�Deng���� 
% ��Դ��CSDN 
% ԭ�ģ�https://blog.csdn.net/u010480899/article/details/78234884 
% ��Ȩ����������Ϊ����ԭ�����£�ת���븽�ϲ������ӣ�