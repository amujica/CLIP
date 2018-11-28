function [w] = filtro_0 (x,fs)

Wn0=[1700/(fs/2) 2500/(fs/2)];

[B0,A0]=ellip(2,0.5,20,Wn0);

w = filter(B0,A0,x);


end
