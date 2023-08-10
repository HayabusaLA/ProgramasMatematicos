function [nvx,nvy,nvz]=unitario(bx,by,bz)
magnitud=sqrt(bx.^2+by.^2+bz.^2);
nvx=bx./magnitud;
nvy=by./magnitud;
nvz=bz./magnitud;

