function [ obrNaS ] = ObrNaSZiemia( obw, zr )
%ObrNaSZiemia funkcja zwraca obra�enia na sekund� nowej magii piecz�ci
%   zale�y od obwod�w i zr�czno�ci, zr�czno� przelicza si� na najwy�szy
%   test na kt�rym mo�na rzuci� piecz�� oraz zmniejsza obra�enia o szans�
%   pora�ki wynikaj�c� ze zr�czno�ci na danym poziomie. 
%   brane s� pod uwag� modyfikatory wsp. ataku i zr. dla danego elementu.
%   wybierany jest pr�g testowy na kt�rym b�dzie zadane najwi�cej obra�e�
elementWspMod=(19/20)*0.2+(1/20)*0.5;%modyfikator wsp. ataku za element
modZRZaEl=0;%modyfikator do zr. za element
PI = zr < 11;
    zrI=(zr+10+modZRZaEl*3);
    obrI=obw .*PI .* (1+elementWspMod*3) .* zrI./20;
PII = zr>10 & zr<21; 
    zrII=(zr+modZRZaEl*7);
    zrI=zrI.*(zrI<21) + 20.*(zrI>=21);
    obrIpII=obw .*PII .* (1+elementWspMod*3) .* zrI./20;
    obrIIpII=obw .*PII .* (1+elementWspMod*7) .* (3/2) .* zrII./20;
    obrII=obrIpII.*(obrIpII>obrIIpII) + obrIIpII.*(obrIpII<=obrIIpII);
PIII = zr>20 & zr+modZRZaEl*9<31;
    zrIII=(zr-10+modZRZaEl*9);
    zrII=zrII.*(zrII<21) + 20.*(zrII>=21);
    obrIpIII=obw .*PIII .* (1+elementWspMod*3) .* zrI./20;
    obrIIpIII=obw .*PIII .* (1+elementWspMod*7) .* (3/2) .* zrII./20;
    obrIIIpIII=obw .*PIII .* (1+elementWspMod*9) .* 2 .* zrIII./20;
    obrIII=obrIpIII.*(obrIpIII>obrIIpIII & obrIpIII>obrIIIpIII)...
        + obrIIpIII.*(obrIpIII<=obrIIpIII & obrIIpIII>=obrIIIpIII) ...
        + obrIIIpIII.*(obrIIIpIII>obrIpIII & obrIIIpIII>obrIIpIII);
PIV = zr+modZRZaEl*9>30;
    obrIV=obw .* PIV .*(1+elementWspMod*9) .* 2;
    
    
    obrNaS = obrI + obrII + obrIII + obrIV;
end

