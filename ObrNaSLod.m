function [ obrNaS ] = ObrNaSLod( obw, zr )
%ObrNaS funkcja zwraca obra¿enia na sekundê nowej magii pieczêci
%   zale¿y od obwodów i zrêcznoœci, zrêcznoœ przelicza siê na najwy¿szy
%   test na którym mo¿na rzuciæ pieczêæ oraz zmniejsza obra¿enia o szansê
%   pora¿ki wynikaj¹c¹ ze zrêcznoœci na danym poziomie. modyfikatory do
%   obwodów i obra¿eniñ nie s¹ brane pod uwagê
PI = zr < 11;
    zrI=(zr+10).*PI;
    %obrNaS = obw * zrI/20;
PII = zr>10 & zr<21; 
    zrII=zr.*PII;
    %obrNaS = obw * (3/2) * zrII/20;
PIII = zr>20 & zr<31;
    zrIII=(zr-10).*PIII;
    %obrNaS = obw * 2 * zrIII/20;
PIV = zr>30;
    %obrNaS = obw * 2;
    elementWspMod=0.2;
    
    obrNaS = obw .* ((PI .*(1+elementWspMod*3) .* zrI./20) + (PII .*(1+elementWspMod*7) .* (3/2) .* zrII./20) + (PIII .*(1+elementWspMod*9) .* 2 .* zrIII./20) + (PIV .*(1+elementWspMod*9) .* 2));
end

