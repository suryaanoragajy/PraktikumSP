function v=SPanomalies(X)
global select
[P,D,h,thetha,q]=pisah(X);
for jj=1:length(P);
     V(:,jj)=Spanomaly(P(jj),D(jj),h(jj),thetha(jj),q(jj),select);
end
[m n]=size(V);
if n==1
    v=V;
else
    v=sum(V');
end