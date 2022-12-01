clc;close all;clear all
% d=xlsread('data lapangan.xlsx',2);
x=xlsread('PraktikumSP.xlsx',2,'K4:K19');
SP=xlsread('PraktikumSP.xlsx',2,'L4:L19');
modes=ceemdan(SP,0.2,100,1000,1);
[n z]=size(modes);
if mod(n,2)==0;
    bar=fix(n/2);
else
    bar=fix(n/2)+1;
end
figure;counter=1;
while counter <=n;
subplot(bar,2,counter),plot(x,modes(counter,:),'r');
title(['IMF-',num2str(counter)]);
counter=counter+1;
end
m1=input('Nilai IMF minimum');
m2=input('Nilai IMF maksimum');
if m1==m2;
    SPfilt=modes(m1,:);
else
    SPfilt=sum(modes(m1:m2,:));
end
figure
plot(x,SP,'ro-','linewidth',2)
hold on
plot(x,SPfilt,'b-','linewidth',2)
filter=[x SPfilt'];