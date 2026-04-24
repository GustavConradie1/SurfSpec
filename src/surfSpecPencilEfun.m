function [u] = surfSpecPencilEfun(surf,bndry,f,eps,x0,varargin)
    p=inputParser;
    addRequired(p,'surf',@(x) isa(x,'surfacemesh'));
    validState={'open','closed'};
    checkState=@(x) any(validatestring(x,validState));
    addRequired(p,'bndry',checkState)
    addRequired(p,'f',@(x) isa(x,'function_handle'));
    addRequired(p,'eps',@isnumeric);
    addParameter(p,'a1',{@(x,y,z) -1+0*x,@(x,y,z) 0*x,@(x,y,z) 0*x; @(x,y,z) 0*x,@(x,y,z) -1+0*x,@(x,y,z) 0*x;@(x,y,z) 0*x,@(x,y,z) 0*x,@(x,y,z) -1+0*x},@iscell);
    addParameter(p,'b1',{@(x,y,z) 0*x,@(x,y,z) 0*x,@(x,y,z) 0*x},@iscell);
    addParameter(p,'c1',@(x,y,z) 0*x,@(x) isa(x,'function_handle'));
    addParameter(p,'a2',{@(x,y,z) 0*x,@(x,y,z) 0*x,@(x,y,z) 0*x;@(x,y,z) 0*x,@(x,y,z) 0*x,@(x,y,z) 0*x;@(x,y,z) 0*x,@(x,y,z) 0*x,@(x,y,z) 0*x},@iscell);
    addParameter(p,'b2',{@(x,y,z) 0*x,@(x,y,z) 0*x,@(x,y,z) 0*x},@iscell);
    addParameter(p,'c2',@(x,y,z) 1+0*x,@(x) isa(x,'function_handle'));
    addParameter(p,'order',2,@(x) x==floor(x));
    validType = {'cheb','roots','extrap','equi'};
    checkType = @(x) any(f=validatestring(x,validType));
    addParameter(p,'type','equi',checkType)
    p.CaseSensitive = false;
    parse(p,surf,bndry,f,eps,varargin{:})
    a1=p.Results.a1; b1=p.Results.b1; c1=p.Results.c1;
    a2=p.Results.a2; b2=p.Results.b2; c2=p.Results.c2;
    [poles,res]=rationalKernel(p.Results.order,p.Results.type);
    f1=surfacefun(@(x,y,z) f(x,y,z),surf);
    %compute g=Bf
    g=times(surfacefun(@(x,y,z) a2{1,1}(x,y,z),surf),diffx(f1,2))+times(surfacefun(@(x,y,z) a2{2,2}(x,y,z),surf),diffy(f1,2)) ...
        +times(surfacefun(@(x,y,z) a2{3,3}(x,y,z),surf),diffz(f1,2))+times(surfacefun(@(x,y,z) a2{1,2}(x,y,z),surf),diffx(diffy(f1))) ...
        +times(surfacefun(@(x,y,z) a2{1,3}(x,y,z),surf),diffx(diffz(f1)))+times(surfacefun(@(x,y,z) a2{2,1}(x,y,z),surf),diffy(diffx(f1))) ...
        +times(surfacefun(@(x,y,z) a2{2,3}(x,y,z),surf),diffy(diffz(f1)))+times(surfacefun(@(x,y,z) a2{3,1}(x,y,z),surf),diffz(diffx(f1))) ...
        +times(surfacefun(@(x,y,z) a2{3,2}(x,y,z),surf),diffz(diffy(f1)))+times(surfacefun(@(x,y,z) b2{1}(x,y,z),surf),diffx(f1)) ...
        +times(surfacefun(@(x,y,z) b2{2}(x,y,z),surf),diffy(f1))+times(surfacefun(@(x,y,z) b2{3}(x,y,z),surf),diffz(f1)) ...
        +times(surfacefun(@(x,y,z) c2(x,y,z),surf),f1);
    u=surfacefun(surf);
    for i=1:p.Results.order
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
        pdo.c=@(x,y,z) c1(x,y,z)-const*c2(x,y,z);
        L=surfaceop(surf,pdo,g);
        if strcmp(bndry,'closed')
            u=u+res(i)*L.solve();
        elseif strcmp(bndry,'open')
            u=u+res(i)*L.solve(0);
        end
    end
    u=-imag(u)/pi;
end