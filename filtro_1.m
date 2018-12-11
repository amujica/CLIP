function [y] = filtro_1 (x,fs)

Wn1=[900/(fs/2) 1700/(fs/2)];

[B1,A1]=ellip(2,0.5,20,Wn1);

y = filter(B1,A1,x);


end

