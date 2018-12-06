function [zt] = sinusoide_muestreo (z,fs)
    
  u = modulo(z);
 [Bz1,Az1]=ellip(6,1,50,[1150/(fs/2) 1250/(fs/2)]);
  zt = filter(Bz1,Az1,u);
  
% subplot(2,1,1)
% plot(z)
% subplot(2,1,2)
% plot(zt)

end