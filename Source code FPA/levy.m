function L=levy(gam)
global pop nvar beta sigma
u=randn(pop,nvar)*sigma;
v=randn(pop,nvar);
step=u./(abs(v)).^(1/beta);
L=gam*step;