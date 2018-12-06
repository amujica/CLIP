function [bits] = deSimbolosABits(z, N,ultimaPosicion)

bits = [];

posicion = ultimaPosicion; %Como empieza en 0 nos traduce todo, pero no tiene que hacer eso
for i=1:length(z)
    posicion =  posicion + N;
    if(posicion<length(z))
        if z(round(posicion))>0
            bits = [bits 1];
        else
             bits = [bits 0];
        end %if
        
    else
        return;
    end
   
end