function X=init_Pfa(pop,nvar)
global Xmax Xmin 
X=zeros(pop,nvar);
for i=1:nvar 
    X(:,i)=Xmin(i)+(Xmax(i)-Xmin(i))*rand(pop,1); 
end
% Lightn=ones(nvar,1)*10^100;