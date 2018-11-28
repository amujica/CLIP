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
title("Señal original")
subplot(4,1,2)
plot(y2)
title("Señal de 1's")
subplot(4,1,3)
plot(w2)
title("Señal de 0's")
subplot(4,1,4)
plot(z)
title("Señal demodulada")

end