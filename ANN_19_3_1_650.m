clear all
clc
x=-4:0.01:4;
y1=sin((1/2)*pi*x)+sin(pi*x);
%train函数可以选择替换
% net=newff(minmax(x),[1,15,1],{'tansig','tansig','purelin'},'traincgf');
net = feedforwardnet(15,'trainlm');
net.trainparam.epochs=2000;
net.trainparam.goal=0.00001;
net=train(net,x,y1);
y2=sim(net,x);
err=y2-y1;
res=norm(err);
%绘图，原图（蓝色光滑线）和仿真效果图（红色+号点线）
plot(x,y1,'b*');
hold on
plot(x,y2,'r+');
hold off