% function [vecBx, vecBy, vecBz] = biot_savart (cx,cy ,cz, Smin, Smax, I,px,py,pz)
function [vecBx, vecBy, vecBz] = biot_savart (cx,cy ,cz, derI, derJ, derK, Smin, Smax, I,px,py,pz)

syms s 
m0 = 4*pi*10^-7;
r1(s) = px - cx(s);
r2(s) = py - cy(s);
r3(s) = pz - cz(s);

R(s) = sqrt((r1(s))^2 + (r2(s))^2 + (r3(s)))^2;
% derI(s) = diff(cx);
% derJ(s) = diff(cy);
% derK(s) = diff(cz);

CompI(s) = (derJ(s) * r3(s) - r2(s)*derK(s)) / R(s)^3 ;
CompJ(s) = -(derI(s) * r3(s) - r1(s)*derK(s))  / R(s)^3;
CompK(s) = (derI(s) * r2(s) - r1(s)*derJ(s)) / R(s)^3;

vecBx = m0*I/(4*pi)*intrectangulo(CompI,Smin,Smax,50);
vecBy = m0*I/(4*pi)*intrectangulo(CompJ,Smin,Smax,50);
vecBz = m0*I/(4*pi)*intrectangulo(CompK,Smin,Smax,50);


