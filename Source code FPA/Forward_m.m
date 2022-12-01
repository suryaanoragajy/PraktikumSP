clc;close all;clear all
global x select
model=2
if model ==1
    select=1;
P=[-100];D=[0];
h=[15];q=[0.5];thetha=[40];
% X=[P D h thetha];
x=(-100:5:100);
% v=SPanomalies(X);
X=[P D h thetha q];
v1=Spanomalies(X);
v=(ones(length(v1),1)+5/100*randn(length(v1),1)).*v1;
else
    select=[1 1];
    P=[1000 -400];D=[-100 30];
    h=[7 30];q=[1.5 1];thetha=[30 60];
    x=(-150:5:150);
% v=SPanomalies(X);
X=[P D h thetha q];
v1=Spanomalies(X);
v=(ones(1,length(v1))+5/100*randn(1,length(v1))).*v1;
end
figure
plot(x,v1,'o-','linewidth',2)
k=[x' v1' v'];
