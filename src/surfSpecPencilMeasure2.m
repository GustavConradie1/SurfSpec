function [mu] = surfSpecPencilMeasure2(surf,bndry,g,x0,eps,a1,b1,cc1,a2,b2,cc2,order,poles,res)
    mu=0;
    for i=1:order
        const=x0-eps*poles(i);
        pdo=[];
        pdo.dxx=@(x,y,z) a1{1,1}(x,y,z)-const*a2{1,1}(x,y,z);
        pdo.dxy=@(x,y,z) a1{1,2}(x,y,z)-const*a2{1,2}(x,y,z);
        pdo.dxz=@(x,y,z) a1{1,3}(x,y,z)-const*a2{1,3}(x,y,z);
        pdo.dyx=@(x,y,z) a1{2,1}(x,y,z)-const*a2{2,1}(x,y,z);
        pdo.dyy=@(x,y,z) a1{2,2}(x,y,z)-const*a2{2,2}(x,y,z);
        pdo.dyz=@(x,y,z) a1{2,3}(x,y,z)-const*a2{2,3}(x,y,z);
        pdo.dzx=@(x,y,z) a1{3,1}(x,y,z)-const*a2{3,1}(x,y,z);
        pdo.dzy=@(x,y,z) a1{3,2}(x,y,z)-const*a2{3,2}(x,y,z);
        pdo.dzz=@(x,y,z) a1{3,3}(x,y,z)-const*a2{3,3}(x,y,z);
        pdo.dx=@(x,y,z) b1{1}(x,y,z)-const*b2{1}(x,y,z);
        pdo.dy=@(x,y,z) b1{2}(x,y,z)-const*b2{2}(x,y,z);
        pdo.dz=@(x,y,z) b1{3}(x,y,z)-const*b2{3}(x,y,z);
        pdo.c=@(x,y,z) cc1(x,y,z)-const*cc2(x,y,z);
        L=surfaceop(surf,pdo,g);
        if strcmp(bndry,'closed')
            mu=mu+res(i)*(g'*L.solve());
        elseif strcmp(bndry,'open')
            mu=mu+res(i)*(g'*L.solve(0));
        end
    end
    mu=-imag(mu)/pi;
end