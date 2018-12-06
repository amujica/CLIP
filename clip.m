fs = 8000;
load sani1.mat;
x = sani1;
z = demoduladorFSK(x,fs);
zt = sinusoide_muestreo(z,fs);
[N, ultimaPosicion] = extraerMuestrasPorSimbolo(z);
bits = deSimbolosABits(z,N, ultimaPosicion);

subplot(2,1,1)
plot(z)
subplot(2,1,2)
plot(zt)
