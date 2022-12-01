function objV1=objfunc(vr_theo);
global v_exp
[l p]=size(vr_theo);
objV1=zeros(p,1);
epsilon=0.2*v_exp;
for j = 1:p
%        objV1(j)=norm((vr_theo(:,j) - v_exp)./v_exp)*100/p;
%        r=sum(((vr_theo(:,j)- v_exp)./v_exp).^2);
%        objV1(j)=sqrt(r)*100/length(v_exp);
%        objV1(j)=norm((vr_theo(:,j) - v_exp),2)/sqrt(l-4);
       objV1(j)=2*norm((vr_theo(:,j) - v_exp))/(norm(vr_theo(:,j) - v_exp)+norm(vr_theo(:,j)+v_exp));
%        objV1(j)=sum(abs(vr_theo(:,j) - v_exp)<=epsilon);
%         
end  