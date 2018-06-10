function [ obrNaS ] = ObrNaS( obw, zr )
%ObrNaS funkcja zwraca obra�enia na sekund� nowej magii piecz�ci
%   zale�y od obwod�w i zr�czno�ci, zr�czno� przelicza si� na najwy�szy
%   test na kt�rym mo�na rzuci� piecz�� oraz zmniejsza obra�enia o szans�
%   pora�ki wynikaj�c� ze zr�czno�ci na danym poziomie. modyfikatory do
%   obwod�w i obra�eni� nie s� brane pod uwag�
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
    
    obrNaS = obw .* ((PI .* zrI./20) + (PII .* (3/2) .* zrII./20) + (PIII .* 2 .* zrIII./20) + (PIV .* 2));
end

