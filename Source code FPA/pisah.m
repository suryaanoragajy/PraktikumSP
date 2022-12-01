function [P,D,h,thetha,q]=pisah(X);
[m n]=size(X);
nm=fix(n/5);
for ii=1:nm;
    P(ii)=X(ii);D(ii)=X(ii+nm);
    h(ii)=X(ii+2*nm);thetha(ii)=X(ii+3*nm);
    q(ii)=X(ii+4*nm);
end