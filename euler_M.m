function [x,y,z] = euler_M(posicion, vel,Masa,Carga_M,Tmax,cx1,cy1 ,cz1, cx2,cy2 ,cz2,cx3,cy3 ,cz3,cx4,cy4 ,cz4,Smin, Smax, I)
syms s 

pasos = 10;
deltaT = Tmax / (pasos - 1);
x = zeros(1,pasos);
y = zeros(1,pasos);
z = zeros(1,pasos);
x(1) = posicion(1);
y(1) = posicion(2);
z(1) = posicion(3);

derI1(s) = diff(cx1);
derJ1(s) = diff(cy1);
derK1(s) = diff(cz1);

derI2(s) = diff(cx2);
derJ2(s) = diff(cy2);
derK2(s) = diff(cz2);

derI3(s) = diff(cx3);
derJ3(s) = diff(cy3);
derK3(s) = diff(cz3);

derI4(s) = diff(cx4);
derJ4(s) = diff(cy4);
derK4(s) = diff(cz4);

for i=1:pasos
    [vecBx1, vecBy1, vecBz1] = biot_savart (cx1,cy1 ,cz1,derI1, derJ1, derK1, Smin, Smax, I,posicion(1),posicion(2),posicion(3));
    [vecBx2, vecBy2, vecBz2] = biot_savart (cx2,cy2 ,cz2,derI2, derJ2, derK2 ,Smin, Smax, I,posicion(1),posicion(2),posicion(3));
    [vecBx3, vecBy3, vecBz3] = biot_savart (cx3,cy3 ,cz3, derI3, derJ3, derK3, Smin, Smax, I,posicion(1),posicion(2),posicion(3));
    [vecBx4, vecBy4, vecBz4] = biot_savart (cx4,cy4 ,cz4, derI4 ,derJ4, derK4, Smin, Smax, I,posicion(1),posicion(2),posicion(3));
     CMb = [vecBx1+vecBx2+vecBx3+vecBx4,vecBy1+vecBy2+vecBy3+vecBy4,vecBz1+vecBz2+vecBz3+vecBz4];
    aceleracion = Carga_M/Masa*cross(vel,CMb);

    Re = posicion + deltaT*(vel);
    Ve = vel + deltaT*(aceleracion);
     [vecBx1, vecBy1, vecBz1] = biot_savart (cx1,cy1 ,cz1,derI1, derJ1, derK1, Smin, Smax, I,Re(1),Re(2),Re(3));
    [vecBx2, vecBy2, vecBz2] = biot_savart (cx2,cy2 ,cz2, derI2, derJ2, derK2 , Smin, Smax, I,Re(1),Re(2),Re(3));
    [vecBx3, vecBy3, vecBz3] = biot_savart (cx3,cy3 ,cz3,derI3, derJ3, derK3, Smin, Smax, I,Re(1),Re(2),Re(3));
    [vecBx4, vecBy4, vecBz4] = biot_savart (cx4,cy4 ,cz4, derI4 ,derJ4, derK4,Smin, Smax, I,Re(1),Re(2),Re(3));
    CMb2 = [vecBx1+vecBx2+vecBx3+vecBx4,vecBy1+vecBy2+vecBy3+vecBy4,vecBz1+vecBz2+vecBz3+vecBz4];
    Ae = Carga_M/Masa*cross(Ve,CMb2);

    posicion = posicion + deltaT * (vel + Ve) / 2;
    vel = vel + deltaT * (aceleracion + Ae) / 2;

    x(i) = posicion(1);
    y(i) = posicion(2);
    z(i) = posicion(3);





    
    





end