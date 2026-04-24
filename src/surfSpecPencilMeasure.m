function [mu] = surfSpecPencilMeasure(surf,bndry,f,x_range,eps,varargin)
    %computes mu, spectral measure of linear pencil L=B^{-1}A wrt f
    %note a1 is A, a2 is B
    p=inputParser;
    addRequired(p,'surf',@(x) isa(x,'surfacemesh'));
    validState={'open','closed'};
    checkState=@(x) any(validatestring(x,validState));
    addRequired(p,'bndry',checkState)
    addRequired(p,'f',@(x) isa(x,'function_handle'));
    addRequired(p,'x_range',@isnumeric);
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
    parse(p,surf,bndry,f,x_range,eps,varargin{:})
    a2=p.Results.a2; b2=p.Results.b2; c2=p.Results.c2;
    mu=zeros(length(x_range),1);
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
    pf = parfor_progress(length(x_range));
    pfcleanup = onCleanup(@() delete(pf));
    for i=1:length(x_range)
        mu(i)=surfSpecPencilMeasure2(surf,bndry,g,x_range(i),eps,p.Results.a1,p.Results.b1,...
            p.Results.c1,a2,b2,c2,p.Results.order,poles,res);
        parfor_progress(pf);
    end
    figure
    plot(x_range,mu)
end