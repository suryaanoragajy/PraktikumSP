clear all;
clc;

c=xlsread('PraktikumSP.xlsx',1);
d=xlsread('PraktikumSP.xlsx',3);

tbase = c([2:11],3);
Vbase = c([2:11],8);
t = d([2:17],3);
n = length(t);

for a= 1:n
    L_int(a)= Lagrange(tbase,Vbase,t(a));
end
disp("=== Hasil interpolasi V ===");
disp(sprintf('%.3f\n',L_int));
