function ObrNaExp( obwMod, zrMod )
    [X,Y]=meshgrid(1:(100-obwMod),1:(30-zrMod));
    figure;
    function xp = kosztExpZr(zr)
        zr1=(((zr<11).*zr + (zr>10).*10).^2)./2;
        zr2=(zr>10 & zr<21).*((zr-10).*((11+zr)./2)) + (zr>20).*(10*((11+20)/2));
        zr3=(zr>20).*((zr-20).*((21+zr)./2));
        k1=zr1.*(1*(1+0.1*zrMod));
        k2=zr2.*(3*(1+0.1*zrMod));
        k3=zr3.*(9*(1+0.1*zrMod));
        xp=k1+k2+k3;
    end;
    surf(X.^2.*0.25,kosztExpZr(Y),ObrNaSZiemia(X,Y));
    hold on
    contour3(X.^2.*0.25,kosztExpZr(Y),ObrNaSZiemia(X,Y),'LineWidth',2,'LineColor','red');
end

