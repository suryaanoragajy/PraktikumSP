function [z]=limit(mini,maxi,x)
[row,col]=size(x);
X=repmat(mini,row,1)+rand(row,col).*(repmat(maxi,row,1)-repmat(mini,row,1));
for i=1:col 
    x(x(:,i)<mini(i),i)=X(x(:,i)<mini(i),i); 
    x(x(:,i)>maxi(i),i)=X(x(:,i)>maxi(i),i); 
end 
z=x; 
end 