function campo3d(vecX,vecY,vecZ,bx,by,bz,resol)
[bx,by,bz]=unitario(bx,by,bz)
hold on;
for i=1:resol
    for j=1:resol
        for k=1:resol
            quiver3(vecX(i),vecY(j),vecZ(k),bx(i,j,k),by(i,j,k),bz(i,j,k),"MaxHeadSize",1,LineWidth=3);
        end
    end
end

end
