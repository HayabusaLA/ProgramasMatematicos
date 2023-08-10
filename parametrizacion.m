clear; clc; close all

% syms cx1 cy1 cz1 cx2 cy2 cz2 cx2 cy2 cz2 cx3 cy3 cz3 cx4 cy4 cz4 s
% 
% %Valores de la parametrización
% a = 2; %Radio
% h = 1; %Altura
% sep = 3; %Separación al origen
% vuel = 10; %Número de vueltas del solenoide
% 
% %Limite de los valores de S
% Smin = 0;
% Smax = 2 * pi;
% 
% %Figura 1
% cx1(s) = a*cos(vuel*s);%Componentes de la Parametrizacion 
% cy1(s) = a*sin(vuel*s);
% cz1(s) = h * (s) + sep;
% hold on
% fplot3(cx1,cy1,cz1,[Smin,Smax])
% 
% %figura 2
% cx2(s) = a*cos(vuel*s);%Componentes de la Parametrizacion 
% cy2(s) = a*sin(vuel*s);
% cz2(s) = h * (s) - sep - h*Smax;
% hold on
% fplot3(cx2,cy2,cz2,[Smin,Smax])
% 
% %figura 3
% cx3(s) = h * (s) + sep ;%Componentes de la Parametrizacion 
% cy3(s) = a*cos(vuel * s);
% cz3(s) = a*sin(vuel * s);
% hold on
% fplot3(cx3,cy3,cz3,[Smin,Smax])
% 
% %figura 4
% cx4(s) = h * (s) - sep - h*Smax;%Componentes de la Parametrizacion 
% cy4(s) = a*sin(vuel * s);
% cz4(s) = a*cos(vuel*s);
% hold on
% fplot3(cx4,cy4,cz4,[Smin,Smax])
% 
% xlabel('X')
% ylabel('Y')
% zlabel('Z')
% 
% %Visualización
% view(30,60)
% daspect([1,1,1])

syms cx1 cy1 cz1 cx2 cy2 cz2 cx2 cy2 cz2 cx3 cy3 cz3 cx4 cy4 cz4 s
%tic

%Limite de los valores de S
Smin = 0;
Smax = 2 * pi;

%Figura 1
cx1(s) = cos(10*s);%Componentes de la Parametrizacion 
cy1(s) = sin(10*s);
cz1(s) = 1 * (s) + 2;
hold on
fplot3(cx1,cy1,cz1,[Smin,Smax])
%figura 2
cx2(s) = cos(10*s);%Componentes de la Parametrizacion 
cy2(s) = sin(10*s);
cz2(s) = 1 * (s) - 2 - 2*pi;
hold on
fplot3(cx2,cy2,cz2,[Smin,Smax])
%figura 3
cx3(s) = 1 * (s) + 2 ;%Componentes de la Parametrizacion 
cy3(s) = cos(10 * s);
cz3(s) = sin(10 * s);
hold on
fplot3(cx3,cy3,cz3,[Smin,Smax])
%figura 4
cx4(s) = 1 * (s) - 2 - 2*pi;%Componentes de la Parametrizacion 
cy4(s) = sin(10 * s);
cz4(s) = cos(10*s);
hold on
fplot3(cx4,cy4,cz4,[Smin,Smax])
view(30,60)
daspect([1,1,1])


%Para establecer las dimensiones del cubo
minX = -7; minY = minX; minZ = minX;
maxX = 7; maxY = maxX; maxZ = maxX;

%El numero de puntos
resol = 5;
%Se crean los vectores
vecX = linspace(minX,maxX,resol);
vecY = linspace(minY,maxY,resol);
vecZ = linspace(minZ,maxZ,resol);
 
%Corriente que pasa
I = 10^-7;
%%

%Se llama a la funcion iteracion

[bx1,by1,bz1]=iteracion(vecX,vecY,vecZ,cx1,cy1 ,cz1, Smin, Smax, I,resol);

[bx2,by2,bz2]=iteracion(vecX,vecY,vecZ,cx2,cy2 ,cz2, Smin, Smax, I,resol);

[bx3,by3,bz3]=iteracion(vecX,vecY,vecZ,cx3,cy3 ,cz3, Smin, Smax, I,resol);

[bx4,by4,bz4]=iteracion(vecX,vecY,vecZ,cx4,cy4 ,cz4, Smin, Smax, I,resol);

BX = bx1 + bx2 + bx3 + bx4;
BY = by1 + by2 + by3 + by4;
BZ = bz1 + bz2 + bz3 + bz4;

campo3d(vecX,vecY,vecZ,BX,BY,BZ,resol)

%toc
%Hace ruido 
sound(sin(1:6000))
%%
posicion = [0,-2,0];
vel = [0,10,0];
Masa = 0.0000001;
Carga_M = 1;
Tmax = 0.5;

 [x,y,z] = euler_M(posicion, vel,Masa,Carga_M,Tmax,cx1,cy1 ,cz1, cx2,cy2 ,cz2,cx3,cy3 ,cz3,cx4,cy4 ,cz4,Smin, Smax, I)
hold on 
plot3(x,y,z)