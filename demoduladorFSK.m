function [z] = demoduladorFSK (x,fs)

y = filtro_1(x,fs);
w = filtro_0(x,fs);
y1 = modulo(y);
w1 = modulo(w);
y2 = fir(y1);
w2 = fir(w1);
z = resta(y2,w2);

subplot(4,1,1)
plot(x)
title("Se�al original")
subplot(4,1,2)
plot(y2)
title("Se�al de 1's")
subplot(4,1,3)
plot(w2)
title("Se�al de 0's")
subplot(4,1,4)
plot(z)
title("Se�al demodulada")

end