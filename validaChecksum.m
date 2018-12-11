function [valido] = validaChecksum(bitsCortados)
longitud = bitsCortados(11:20);
longitud = bin2dec(num2str(fliplr(longitud(2:9))));

checksum = bitsCortados((longitud+2)*10+1 : (longitud+2)*10+10 );
if(checksum(1) == 0 && checksum(10)==1)
   valorChecksum = bin2dec(num2str(fliplr(checksum(2:9))));
 
  
   
   decena = bitsCortados(1:10);
   decenaCor = bin2dec(num2str(fliplr(decena(2:9))));
   sumaChecksum = decenaCor;

   
   for i=1:longitud+1
       suma = i*10+1;
       decena1 = bitsCortados(suma:suma+9);
       decenaCor1 = bin2dec(num2str(fliplr(decena1(2:9))));
     
      
       sumaChecksum = sumaChecksum + decenaCor1;

      
   end

   sumaChecksum = mod(sumaChecksum, 256);
   sumaChecksum = 256 - sumaChecksum;
   
 
    
end

  if(sumaChecksum == valorChecksum)
      valido = true;
  else
      valido = false;
      
 
  end

end