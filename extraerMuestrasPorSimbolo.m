function [N, ultimaPosicion] = extraerMuestrasPorSimbolo(z)
%Acordarse de birrar bits
fs = 8000;
zt = sinusoide_muestreo(z, fs);
posiciones = [];
bits = [];
for i=2:length(zt)%Ojo con ese 2
  
    if(zt(i-1)>0 && zt(i)<0)
        posiciones = [posiciones i];
        
    end %if
    
end %for

contador = 0;
for i=2:length(posiciones)
    if(sign(z(posiciones(i-1)))~= sign(z(posiciones(i))))
        contador = contador + 1;
        if(contador == 200)
               N = (posiciones(i)-posiciones(i-100))/100;
               ultimaPosicion = posiciones(i);
               return; %Mirar este return, ver si acaba la función
        end %if contador
    else
        contador = contador -1;
       
    end %if
    
%muestras = [];
   
%muestras = [muestras,z(posicion)];

end

end