function [bx,by,bz]=iteracion(vecX,vecY,vecZ,cx,cy ,cz, Smin, Smax, I,resol)
syms s
bx=zeros(resol,resol,resol);%Se creaban los vectores con longitud de resol
by=zeros(resol,resol,resol);
bz=zeros(resol,resol,resol);

derI(s) = diff(cx);
derJ(s) = diff(cy);
derK(s) = diff(cz);

for i=1:resol%para obtener todas las posibles variaciones dentro de nuestros valores
    for j=1:resol
        for k=1:resol
            [vecBx, vecBy, vecBz] = biot_savart (cx,cy ,cz,derI, derJ, derK, Smin, Smax, I,vecX(i),vecY(j),vecZ(k));%se llama a biot_savart pasandole los valores de las componentes en x,y,z con los respectivos cambios por i,j,k
            bx(i,j,k)=vecBx;%Se guardan los valores obtenidos en la funcion pasada en el vector correspondiente 
            by(i,j,k)=vecBy;
            bz(i,j,k)=vecBz;
            
        end
    end
end




end