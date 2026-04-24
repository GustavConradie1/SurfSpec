function [D,F,res] = beynNLEP(surf,bndry,m,varargin)
    %implements SurfBEYN (Algorithm 3.2)
    %calculate eigenvalues, eigenfunctions and residuals of non-linear
    %eigenvalue problem T(lambda)v=0, where T(lambda) is defined by cells
    %of coefficients a,b,c:
    %T(lambda)=a{1,1}(lambda,x,y,z)d^2v/dx^2+....+b{1}(lambda,x,y,z)dv/dx+...+c(lambda,x,y,z)v
    p=inputParser;
    validState={'open','closed'};
    checkState=@(x) any(validatestring(x,validState));
    addRequired(p,'surf',@(x) isa(x,'surfacemesh'));
    addRequired(p,'bndry',checkState)
    addRequired(p,'m',@(x) x==floor(x));
    validContour={'circle','ellipse'};
    checkContour=@(x) any(validatestring(x,validContour));
    addParameter(p,'F',[]);
    addParameter(p,'contour','circle',checkContour);
    addParameter(p,'centre',0,@isnumeric);
    addParameter(p,'radii',1,@isnumeric);
    addParameter(p,'num_nodes',20,@isnumeric);
    addParameter(p,'svdTOL',10^(-5),@isnumeric);
    addParameter(p,'a',{@(x,y,z,l) 1+0*x,@(x,y,z,l) 0*x,@(x,y,z,l) 0*x; @(x,y,z,l) 0*x,@(x,y,z,l) 1+0*x,@(x,y,z,l) 0*x;@(x,y,z,l) 0*x,@(x,y,z,l) 0*x,@(x,y,z,l) 1+0*x},@iscell);
    addParameter(p,'b',{@(x,y,z,l) 0*x,@(x,y,z,l) 0*x,@(x,y,z,l) 0*x},@iscell);
    addParameter(p,'c',@(x,y,z,l) l,@(x) isa(x,'function_handle'));
    p.CaseSensitive=false;
    parse(p,surf,bndry,m,varargin{:});
    if strcmp(p.Results.contour,'circle') && length(p.Results.radii)~=1
        error('ERROR: for a circular contour only one radii can be entered.')
    elseif strcmp(p.Results.contour,'ellipse') && length(p.Results.radii)~=2
        error('ERROR: for a elliptical contour two radii must be entered.')
        %note first radius is along x-axis, second along y-axis
    end
    [zi,w]=getContour(p.Results.contour,p.Results.centre,p.Results.radii,p.Results.num_nodes);
    l=length(zi);
    if isempty(p.Results.F)
        F=generateF(surf,m);
    else
        F=p.Results.F;
    end
    pdo=[];
    V=repmat(surfacefun(surf),1,m);
    W=repmat(surfacefun(surf),1,m);
    if strcmp(bndry,'closed')
        %calculate contour integrals, in language of paper V=A_0, W=A_1
        for k=1:l
            %+0*x ensures have matrix function handles
            pdo.dxx=@(x,y,z) p.Results.a{1,1}(x,y,z,zi(k))+0*x; pdo.dxy=@(x,y,z) p.Results.a{1,2}(x,y,z,zi(k))+0*x; pdo.dxz=@(x,y,z) p.Results.a{1,3}(x,y,z,zi(k))+0*x;
            pdo.dyx=@(x,y,z) p.Results.a{2,1}(x,y,z,zi(k))+0*x; pdo.dyy=@(x,y,z) p.Results.a{2,2}(x,y,z,zi(k))+0*x; pdo.dyz=@(x,y,z) p.Results.a{2,3}(x,y,z,zi(k))+0*x;
            pdo.dzx=@(x,y,z) p.Results.a{3,1}(x,y,z,zi(k))+0*x; pdo.dzy=@(x,y,z) p.Results.a{3,2}(x,y,z,zi(k))+0*x; pdo.dzz=@(x,y,z) p.Results.a{3,3}(x,y,z,zi(k))+0*x;
            pdo.dx=@(x,y,z) p.Results.b{1}(x,y,z,zi(k))+0*x; pdo.dy=@(x,y,z) p.Results.b{2}(x,y,z,zi(k))+0*x; pdo.dz=@(x,y,z) p.Results.b{3}(x,y,z,zi(k))+0*x;
            pdo.c=@(x,y,z) p.Results.c(x,y,z,zi(k))+0*x;
            L=surfaceop(surf,pdo,F);
            soln=L.solve();
            V=V+w(k)*soln;
            W=W+zi(k)*w(k)*soln;
        end
        [V0,S0,W0]=svd(V);
        disp('svd check')
        diag(S0)/S0(1,1)
        if m>1
            m=find(diag(S0)/S0(1,1)>p.Results.svdTOL,1,'last');
        else
            m=1;
        end
        disp('new m')
        m
        V0=V0(1:m); S0=S0(1:m,1:m); W0=W0(:,1:m);
        [X,D]=eig(V0'*W*W0*diag(1./diag(S0)));
        F=V0*S0*X;
        D=diag(D);
        res=zeros(m,1);
        for i=1:m
            a11=surfacefun(@(x,y,z) p.Results.a{1,1}(x,y,z,D(i))+0*x,surf); a12=surfacefun(@(x,y,z) p.Results.a{1,2}(x,y,z,D(i))+0*x,surf); a13=surfacefun(@(x,y,z) p.Results.a{1,3}(x,y,z,D(i))+0*x,surf);
            a21=surfacefun(@(x,y,z) p.Results.a{2,1}(x,y,z,D(i))+0*x,surf); a22=surfacefun(@(x,y,z) p.Results.a{2,2}(x,y,z,D(i))+0*x,surf); a23=surfacefun(@(x,y,z) p.Results.a{2,3}(x,y,z,D(i))+0*x,surf);
            a31=surfacefun(@(x,y,z) p.Results.a{3,1}(x,y,z,D(i))+0*x,surf); a32=surfacefun(@(x,y,z) p.Results.a{3,2}(x,y,z,D(i))+0*x,surf); a33=surfacefun(@(x,y,z) p.Results.a{3,3}(x,y,z,D(i))+0*x,surf);
            b1=surfacefun(@(x,y,z) p.Results.b{1}(x,y,z,D(i))+0*x,surf); b2=surfacefun(@(x,y,z) p.Results.b{2}(x,y,z,D(i))+0*x,surf); b3=surfacefun(@(x,y,z) p.Results.b{3}(x,y,z,D(i))+0*x,surf);
            c=surfacefun(@(x,y,z) p.Results.c(x,y,z,D(i))+0*x,surf);
            dF=grad(F(i));
            dxdF=grad(dF(1));
            dydF=grad(dF(2));
            dzdF=grad(dF(3));
            TF=times(a11,dxdF(1))+times(a12,dxdF(2))+times(a13,dxdF(3))+times(a21,dydF(1))+times(a22,dydF(2))+times(a23,dydF(3))+times(a31,dzdF(1))+times(a32,dzdF(2))+times(a33,dzdF(3))+times(b1,dF(1))+times(b2,dF(2))+times(b3,dF(3))+times(c,F(i));
            res(i)=norm(TF);
        end
    elseif strcmp(bndry,'open')
        pf = parfor_progress(l);
        pfcleanup = onCleanup(@() delete(pf));
        for k=1:l
            pdo.dxx=@(x,y,z) p.Results.a{1,1}(x,y,z,zi(k))+0*x; pdo.dxy=@(x,y,z) p.Results.a{1,2}(x,y,z,zi(k))+0*x; pdo.dxz=@(x,y,z) p.Results.a{1,3}(x,y,z,zi(k))+0*x;
            pdo.dyx=@(x,y,z) p.Results.a{2,1}(x,y,z,zi(k))+0*x; pdo.dyy=@(x,y,z) p.Results.a{2,2}(x,y,z,zi(k))+0*x; pdo.dyz=@(x,y,z) p.Results.a{2,3}(x,y,z,zi(k))+0*x;
            pdo.dzx=@(x,y,z) p.Results.a{3,1}(x,y,z,zi(k))+0*x; pdo.dzy=@(x,y,z) p.Results.a{3,2}(x,y,z,zi(k))+0*x; pdo.dzz=@(x,y,z) p.Results.a{3,3}(x,y,z,zi(k))+0*x;
            pdo.dx=@(x,y,z) p.Results.b{1}(x,y,z,zi(k))+0*x; pdo.dy=@(x,y,z) p.Results.b{2}(x,y,z,zi(k))+0*x; pdo.dz=@(x,y,z) p.Results.b{3}(x,y,z,zi(k))+0*x;
            pdo.c=@(x,y,z) p.Results.c(x,y,z,zi(k))+0*x;
            L=surfaceop(surf,pdo,F);
            soln=L.solve(0);
            V=V+w(k)*soln;
            W=W+zi(k)*w(k)*soln;
            parfor_progress(pf);
        end
        [V0,S0,W0]=svd(V);
        disp('svd check')
        diag(S0)/S0(1,1)
        if m>1
            m=find(diag(S0)/S0(1,1)>p.Results.svdTOL,1,'last');
        else
            m=1;
        end
        disp('new m')
        m
        V0=V0(1:m); S0=S0(1:m,1:m); W0=W0(:,1:m);
        [X,D]=eig(V0'*W*W0*diag(1./diag(S0)));
        F=V0*S0*X;
        D=real(diag(D));
        res=zeros(m,1);
        for i=1:m
            a11=surfacefun(@(x,y,z) p.Results.a{1,1}(x,y,z,D(i))+0*x,surf); a12=surfacefun(@(x,y,z) p.Results.a{1,2}(x,y,z,D(i))+0*x,surf); a13=surfacefun(@(x,y,z) p.Results.a{1,3}(x,y,z,D(i))+0*x,surf);
            a21=surfacefun(@(x,y,z) p.Results.a{2,1}(x,y,z,D(i))+0*x,surf); a22=surfacefun(@(x,y,z) p.Results.a{2,2}(x,y,z,D(i))+0*x,surf); a23=surfacefun(@(x,y,z) p.Results.a{2,3}(x,y,z,D(i))+0*x,surf);
            a31=surfacefun(@(x,y,z) p.Results.a{3,1}(x,y,z,D(i))+0*x,surf); a32=surfacefun(@(x,y,z) p.Results.a{3,2}(x,y,z,D(i))+0*x,surf); a33=surfacefun(@(x,y,z) p.Results.a{3,3}(x,y,z,D(i))+0*x,surf);
            b1=surfacefun(@(x,y,z) p.Results.b{1}(x,y,z,D(i))+0*x,surf); b2=surfacefun(@(x,y,z) p.Results.b{2}(x,y,z,D(i))+0*x,surf); b3=surfacefun(@(x,y,z) p.Results.b{3}(x,y,z,D(i))+0*x,surf);
            c=surfacefun(@(x,y,z) p.Results.c(x,y,z,D(i))+0*x,surf);
            [dF1,dF2,dF3]=grad(F(:,i));
            [dF11,dF12,dF13]=grad(dF1);
            [dF21,dF22,dF23]=grad(dF2);
            [dF31,dF32,dF33]=grad(dF3);
            TF=times(a11,dF11)+times(a12,dF12)+times(a13,dF13)+times(a21,dF21)+times(a22,dF22)+times(a23,dF23)+times(a31,dF31)+times(a32,dF32)+times(a33,dF33)+times(b1,dF1)+times(b2,dF2)+times(b3,dF3)+times(c,F(i));
            res(i)=norm(TF)/norm(F(:,i));
        end
    end
end