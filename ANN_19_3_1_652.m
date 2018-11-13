
k = 1;
p = -1:.05:8;
t = 1+sin(k*pi/4*p);
plot(p,t,'-');
title('要逼近的非线性函数');
xlabel('时间');
ylabel('非线性函数');

n = 5;
net = feedforwardnet(n,'trainlm');
y1 = sim(net,p);
figure;
plot(p,t,'-',p,y1,':');
title('未训练网络的输出结果');
xlabel('时间');
ylabel('仿真输出--原函数-');
