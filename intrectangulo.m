function [IntR] = intrectangulo(f,a,b,n)  %Paso 1
x=linspace(a,b,n);
delta=x(2)-x(1);
IntR=delta*sum(double(f(x)));
end