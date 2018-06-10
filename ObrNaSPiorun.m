function [ obrNaS ] = ObrNaSPiorun( obw, zr )
%ObrNaS funkcja zwraca obra�enia na sekund� nowej magii piecz�ci
%   zale�y od obwod�w i zr�czno�ci, zr�czno� przelicza si� na najwy�szy
%   test na kt�rym mo�na rzuci� piecz�� oraz zmniejsza obra�enia o szans�
%   pora�ki wynikaj�c� ze zr�czno�ci na danym poziomie. modyfikatory do
%   obwod�w i obra�eni� nie s� brane pod uwag�
elementWspMod=0.3;
PI = zr < 11;
    zrI=(zr+10-3*3);
    obrI=obw .*PI .* (1+elementWspMod*3) .* zrI./20;
PII = zr>10 & zr<21; 
    zrII=(zr-3*7);
    zrI=zrI.*(zrI<21) + 20.*(zrI>=21);
    obrIpII=obw .*PII .* (1+elementWspMod*3) .* zrI./20;
    obrIIpII=obw .*PII .* (1+elementWspMod*7) .* (3/2) .* zrII./20;
    obrII=obrIpII.*(obrIpII>obrIIpII) + obrIIpII.*(obrIpII<=obrIIpII);
PIII = zr>20 & zr-3*9<31;
    zrIII=(zr-10-3*9);
    zrII=zrII.*(zrII<21) + 20.*(zrII>=21);
    obrIpIII=obw .*PIII .* (1+elementWspMod*3) .* zrI./20;
    obrIIpIII=obw .*PIII .* (1+elementWspMod*7) .* (3/2) .* zrII./20;
    obrIIIpIII=obw .*PIII .* (1+elementWspMod*9) .* 2 .* zrIII./20;
    obrIII=obrIpIII.*(obrIpIII>obrIIpIII & obrIpIII>obrIIIpIII) + obrIIpIII.*(obrIpIII<=obrIIpIII & obrIIpIII>=obrIIIpIII) + obrIIIpIII.*(obrIIIpIII>obrIpIII & obrIIIpIII>obrIIpIII);
PIV = zr-3*9>30;
    obrIV=obw .* PIV .*(1+elementWspMod*9) .* 2;
    
    
    obrNaS = obrI + obrII + obrIII + obrIV;
end
