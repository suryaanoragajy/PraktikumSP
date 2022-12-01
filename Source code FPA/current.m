function [Xnew,fnew]=current(X,f,Xnew,fnew)
% global pop
pacc=f<=fnew;
Xnew(pacc,:)=X(pacc,:);
fnew(pacc,:)=f(pacc,:);
% for ii=1:pop
%         if pacc(ii);
%             %if f(ii)==n || f(ii)>=fnew(ii);
%             Xnew(ii,:)=X(ii,:);
%             fnew(ii)=f(ii);
%         else
%             Xnew(ii,:)=Xnew(ii,:);
%             fnew(ii)=fnew(ii);
%         end
% end 