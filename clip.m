fs = 8000;
load sani2.mat;
x = sani2;
z = demoduladorFSK(x,fs);
zt = sinusoide_muestreo(z,fs);
[N, ultimaPosicion] = extraerMuestrasPorSimbolo(z);
bits = deSimbolosABits(z,N, ultimaPosicion);
[horaYFecha, numeroDeLlamante] = decoder (bits);

subplot(2,1,1)
plot(z)
subplot(2,1,2)
plot(zt)
