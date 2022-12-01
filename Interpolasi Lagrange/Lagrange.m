function L_int = Lagrange(x,y,xx)
% x adalah variabel bebas
% y adalah variabel terikat
% xx adalah nilai variabel bebas yang dihitung
n = length(x); % jumlah data yang digunakan
s = 0;
for i = 1:n
  P = y(i); %array variabel terikat
    for j = 1:n
      if i ~= j
        li = (xx-x(j))/(x(i)-x(j)); % menentukan nilai L_{i}
        P = P*li;
      end
    end
    s = s+P;
 end
 L_int = s;

