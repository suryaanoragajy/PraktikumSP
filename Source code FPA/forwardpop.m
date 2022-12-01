function V=forwardpop(X)
global pop
for ii=1:pop
    V(:,ii)=SPanomalies(X(ii,:));
end