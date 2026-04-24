function [F] = generateF(surf,m)
    %define a quasimatrix of m randomly generated surfacefuns (by
    %converting chebfun3s to surfacefun) on the given surf
    box=boundingbox(surf);
    F=repmat(surfacefun(surf),1,m);
    lam=max(box([2 4 6])-box([1 3 5]))/2;
    for i=1:m
        f=randnfun3(lam,box*1.1);
        F(i)=surfacefun(@(x,y,z) f(x,y,z),surf);
    end
end