function mf=misfit(vr_theo)
global v_exp
[n m]=size(vr_theo);
if n==1;
    vr_theo=vr_theo';
end
r=sum(((vr_theo- v_exp)./v_exp).^2);
mf=sqrt(r)*100/length(v_exp);