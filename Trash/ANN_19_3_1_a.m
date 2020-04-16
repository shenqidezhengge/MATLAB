%%%%%%645ҳ
clear all
clc
k=6;      %Ƶ�ʲ���
p=-1:.05:8;
t=1+sin(k*pi/2*p);
% plot(p,t,'-');
% title('Ҫ�ƽ��ķ����Ժ���');
% xlabel('ʱ��');
% ylabel('�����Ժ���');

n=10;      %��������Ԫ��Ŀ
net = newff(minmax(p),[n,1],{'tansig' 'purelin'},'trainlm');
%���ڳ�ʼ���磬����Ӧ��sim( )�����۲����������
y1=sim(net,p);
% figure;
% plot(p,t,'-',p,y1,':')
% title('δѵ�������������');
% xlabel('ʱ��');
% ylabel('�����������ԭ������');

%%%%%646ҳ
net.trainParam.epochs=200;      %����ѵ��ʱ������Ϊ200
net.trainParam.qoal=0.2;        %����ѵ����������Ϊ0.2
net=train(net,p,t);             %��ʼѵ������

y2=sim(net,p);
figure;
plot(p,t,'-',p,y1,':',p,y2,'--')
title('ѵ���������������');
xlabel('ʱ��');
ylabel('�������');