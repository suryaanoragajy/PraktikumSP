function X=fpa_move(X,Xnew,best,gam)
global pop crossover beta sigma
beta=3/2;
tmpdiv=gamma((1+beta)/2)*beta*2^((beta-1)/2);
sigma=(gamma(1+beta)*sin(pi*beta/2)/tmpdiv)^(1/beta);
L=levy(gam);
% size(L)
for ii=1:pop
        if rand<crossover
%             L=levy(gam);
            dX=L(ii,:).*(Xnew(ii,:)-best);
            X(ii,:)=Xnew(ii,:)+dX;
        else
            epsilon=rand;JK=randperm(pop);
            X(ii,:)=Xnew(JK(1),:)+epsilon*(Xnew(JK(2),:)-Xnew(JK(3),:));
%              X(ii,:)=Xnew(ii,:)+epsilon*(Xnew(JK(2),:)-Xnew(JK(3),:));
        end
end 