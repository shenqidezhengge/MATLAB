
k = 1;
p = -1:.05:8;
t = 1+sin(k*pi/4*p);
plot(p,t,'-');
title('Ҫ�ƽ��ķ����Ժ���');
xlabel('ʱ��');
ylabel('�����Ժ���');

n = 5;
net = feedforwardnet(n,'trainlm');
y1 = sim(net,p);
figure;
plot(p,t,'-',p,y1,':');
title('δѵ�������������');
xlabel('ʱ��');
ylabel('�������--ԭ����-');
