clc;clear all;close all
global Xmax Xmin x v_exp select pop nvar crossover

Rnoise=xlsread('LF_Filter.xlsx',1);
%data=xlsread('data.xls');

x=Rnoise(:,1);v_exp=Rnoise(:,2);
MaxGen=1100;
select=1;
Pmin=[-220 -10 -10];Pmax=[10 120 150];
Dmin=[2 13 22];Dmax=[14 23 32];
hmin=[0 0 0];hmax=[7 4 4];
thetamin=[-100 50 50];thethamax=[50 240 250];
qmin=[0 0 0];qmax=[2 2 2];
Xmin=[Pmin Dmin hmin thetamin qmin];
Xmax=[Pmax Dmax hmax thethamax qmax];

% figure
% plot(x,v_exp)
% hold on
pop=45;
% Initial values of an array
nvar=length(Xmax);
crossover=0.8;gam=0.1;
% ------------------------------------------------
% generating the initial locations of n fireflies
Xnew=init_Pfa(pop,nvar);
% xpos=[Xnew Lightn];
V=forwardpop(Xnew);
fnew=objfunc(V);
[fmin,I]=min(fnew);
best=Xnew(I,:);
X=Xnew;
xpos=[];
% Iterations or pseudo time marching
for k=1:MaxGen    %%%%% start iterations
    % This line of reducing alpha is optional
    X=fpa_move(X,Xnew,best,gam);
    X=limit(Xmin,Xmax,X);
    V=forwardpop(X);
    f=objfunc(V);
    [Xnew,fnew]=current(X,f,Xnew,fnew);
    [fmin,I]=min(fnew);
    best=Xnew(I,:);
    xpos=[xpos;Xnew fnew];
    fbest(k,:)=fmin;
     fmean(k,:)=mean(f);
     fiqr(k,:)=iqr(f);
    fprintf('Iterasion=%i Best RMSE=%.4f \n',k,fmin)
    % Move all fireflies to the better locations
end   %%%%% end of iterations
Vbest=SPanomalies(best);
mf=misfit(Vbest)
figure
subplot(1,2,1)
plot(x,v_exp,'o','linewidth',2,'MarkerFaceColor','b')
hold on
plot(x,Vbest,'k-','linewidth',2)
ylabel('SP anomaly(mV)','fontsize',12,'fontweight','bold','fontname','Times')
xlabel('Distances(m)','fontsize',12,'fontweight','bold','fontname','Times')
legend('Observed','Calculated')
title('a)','fontsize',12,'fontweight','bold','fontname','Times')

subplot(1,2,2)
plot(1:MaxGen,fbest,'gx','linewidth',2)
hold on
plot(1:MaxGen,fmean,'r-','linewidth',2)
plot(1:MaxGen,fiqr,'b-','linewidth',2)
xlabel 'Iteration'
ylabel 'RMSE'
title('b)','fontsize',12,'fontweight','bold','fontname','Times')
ylabel('Objective function','fontsize',12,'fontweight','bold','fontname','Times')
xlabel('Iterations','fontsize',12,'fontweight','bold','fontname','Times')
legend('Best','iqr')

% figure
% for ii=1:nvar
%     subplot(5,1,ii)
%     hist(xpos(:,ii));
%     k(ii)=median(xpos(:,ii));
%     l(ii)=iqr(xpos(:,ii));
% end
figure
subplot(2,1,1)
plot(x,v_exp,'o','linewidth',2,'MarkerFaceColor','b')
hold on
plot(x,Vbest,'k-','linewidth',2)
ylabel('SP anomaly(mV)','fontsize',12,'fontweight','bold','fontname','Times')
xlabel('Distances(m)','fontsize',12,'fontweight','bold','fontname','Times')
legend('Observed','Calculated')
title('a)','fontsize',12,'fontweight','bold','fontname','Times')
subplot(2,1,2)
hold on
plot([best(4),best(5),best(6)],[best(7),best(8),best(9)],'ro','linewidth',5,'MarkerFaceColor','r')
ylabel('Depth(m)','fontsize',12,'fontweight','bold','fontname','Times')
xlabel('Distances(m)','fontsize',12,'fontweight','bold','fontname','Times')
axis([0 35 0 10]);
title('b)','fontsize',12,'fontweight','bold','fontname','Times')
