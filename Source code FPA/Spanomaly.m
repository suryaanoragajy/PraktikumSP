function v=Spanomaly(P,D,h,thetha,q,select)
global x
the=thetha*pi/180;
v=zeros(length(x),1);
if select==1
    % 
    for ii=1:length(x);
        v(ii)=P*((x(ii)-D)*cos(the)+h*sin(the))/((x(ii)-D)^2+h^2)^q;
    end
elseif select==2
    % inclined sheet
    a=q;
    for ii=1:length(x);
        op3=a*sin(the);
        op1(ii)=(x(ii)-D);
        op2=a*cos(the);
        v(ii)=P*log(((op1(ii)-op2)^2+(h-op3)^2)/((op1(ii)+op2)^2+(h+op3)^2));
    end
else
    % inclinedsheet
    x1=D;z1=h;x2=thetha;z2=q;
    for ii=1:length(x);
        g1(ii)=(x(ii)-x1)^2+z1^2;
        g2(ii)=(x(ii)-x2)^2+z2^2;
        v(ii)=P*log(g1(ii)/g2(ii));
    end
end
    