clear all
clc%ѡȡ�������xȡֵ��Χ
x = -4:0.001:4;
%����Ŀ�꺯��
y1 = sin((1/2)*pi*x)+sin(pi*x);
%���������Ԫ��Ŀ��Χ
s = 9:16;
%ŷ�Ͼ���
res = 1:8;
%ѡȡ��ͬ����������Ԫ��Ŀ�������������
for i=1:8
    %����ǰ����BP�����磬�����������㼤������Ϊtansig�������Ϊpurelin
    %ѵ������Ϊtrainlm��Ҳ����Ĭ�Ϻ���
    net=newff(minmax(x),[1,s(i),1],{'tansig','tansig','purelin'},'trainlm');
    %ѵ���������Ϊ2000
    net.trainparam.epochs=2000;
    %�趨Ŀ�����Ϊ0.00001
    net.trainparam.goal=0.00001;
    %���к���ѵ��
    net=train(net,x,y1);
    %��ѵ�������������з���
    y2=sim(net,x);
    %��ŷ�Ͼ��룬�ж�������Ԫ��������������
    err=y2-y1;
    res(i)=norm(err);
end