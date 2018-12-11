function [horaYFecha, numeroDeTelefono] =  decoder (bits)

bitsCortados = [];

for i=2:length(bits)
    if(bits(i)==1 && bits(i+1)==1)
        bitsCortados = bits(i+81:length(bits));
        break
    end
end

checksum = validaChecksum(bitsCortados);

if(checksum == 1)

for i=1:length(bitsCortados)
    if(bitsCortados(i)==0 && bitsCortados(i+1)==1 && bitsCortados(i+2)==0 && bitsCortados(i+3)==0 && bitsCortados(i+4)==0 && bitsCortados(i+5)==0 && bitsCortados(i+6)==0 && bitsCortados(i+7)==0 && bitsCortados(i+8)==0 && bitsCortados(i+9)==1)
       empiezaHoraYFecha = i;
     
       break;
    end
end
longitudHoraYFecha = bitsCortados(empiezaHoraYFecha+10:empiezaHoraYFecha+19);
longitudHoraYFechaCor = bin2dec(num2str(fliplr(longitudHoraYFecha(2:9))));

horaYFecha = [];
for i=1:longitudHoraYFechaCor %De 1 a 8
    
    suma = 10*i;
    Numero =  bitsCortados(empiezaHoraYFecha+10+suma:empiezaHoraYFecha+9+suma+10);
    NumeroCor = char(bin2dec(num2str(fliplr(Numero(2:9)))));
    horaYFecha = [horaYFecha NumeroCor];
 
end


for i=(empiezaHoraYFecha+20+longitudHoraYFechaCor*10):length(bitsCortados)
    if(bitsCortados(i)==0 && bitsCortados(i+1)==0 && bitsCortados(i+2)==1 && bitsCortados(i+3)==0 && bitsCortados(i+4)==0 && bitsCortados(i+5)==0 && bitsCortados(i+6)==0 && bitsCortados(i+7)==0 && bitsCortados(i+8)==0 && bitsCortados(i+9)==1)
       empiezaNumeroLlamante = i;
       
       break;
    end
end





longitudLlamante = bitsCortados(empiezaNumeroLlamante+10:empiezaNumeroLlamante+19);
longitudLlamanteCor = bin2dec(num2str(fliplr(longitudLlamante(2:9))));

numeroDeTelefono = [];
for i=1:longitudLlamanteCor %De 1 a 9
    suma = 10*i;
    Numero =  bitsCortados(empiezaNumeroLlamante+10+suma:empiezaNumeroLlamante+9+suma+10);
    NumeroCor = char(bin2dec(num2str(fliplr(Numero(2:9)))));
    numeroDeTelefono = [numeroDeTelefono NumeroCor];
 
end

disp(['El dia ' horaYFecha(3:4) '/' horaYFecha(1:2) ' a las ' horaYFecha(5:6) ':' horaYFecha(7:8) ' llamó ' numeroDeTelefono ])


else
    x = "El checksum no coincide";
    x
end


end