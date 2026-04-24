function [D,F,res] = schrSpec2(surf,bndry,pot,varargin)
    %same as schrSpec but assuming we have symmetry so can restrict contour
    %to upper half plane
    p=inputParser;
    validState={'open','closed'};
    checkState=@(x) any(validatestring(x,validState));
    addRequired(p,'surf',@(x) isa(x,'surfacemesh'));
    addRequired(p,'bndry',checkState)
    addRequired(p,'pot',@(x) or(isa(x,'function_handle'),isa(x,'surfacefun')));
    validContour={'circle','ellipse'};
    checkContour=@(x) any(validatestring(x,validContour));
    addParameter(p,'F',[])
    addParameter(p,'m',[],@(x) x==floor(x));
    addParameter(p,'zi',[],@isnumeric);
    addParameter(p,'w',[],@isnumeric);
    addParameter(p,'contour','circle',checkContour);
    addParameter(p,'centre',0,@isnumeric);
    addParameter(p,'radii',1,@isnumeric);
    addParameter(p,'num_nodes',10,@isnumeric);
    addParameter(p,'svdTOL',10^(-10),@isnumeric);
    addParameter(p,'max_its',100,@(x) x==floor(x));
    p.CaseSensitive=false;
    parse(p,surf,bndry,pot,varargin{:});
    if or(isempty(p.Results.zi),isempty(p.Results.w))
        if strcmp(p.Results.contour,'circle') && length(p.Results.radii)~=1
            error('ERROR: for a circular contour only one radii can be entered.')
        elseif strcmp(p.Results.contour,'ellipse') && length(p.Results.radii)~=2
            error('ERROR: for a elliptical contour two radii must be entered.')
            %note first radius is along x-axis, second along y-axis
        end
        [zi,w]=getContour2(p.Results.contour,p.Results.centre,p.Results.radii,p.Results.num_nodes);
    elseif length(p.Results.zi)~=length(p.Results.w)
        error('ERROR: there must be the same number of quadrature nodes as weights.')
    else
        zi=p.Results.zi;
        w=p.Results.w;
    end
    if not(isempty(p.Results.m))
        m=p.Results.m;
        if isempty(p.Results.F)
            F=generateF(surf,m);
        else
            F=p.Results.F;
        end
    else
        error('ERROR: please enter the number of functions in F, m.')
    end
    l=length(zi);
    pdo=[];
    pdo.lap=1;
    its=1;
    if isa(pot,'function_handle')
        surf_pot=surfacefun(pot,surf);
        if strcmp(bndry,'closed')
            while its>0
                V=repmat(surfacefun(surf),1,m);
                pf = parfor_progress(l);
                pfcleanup = onCleanup(@() delete(pf));
                for k=1:l
                    pdo.c=@(x,y,z) -pot(x,y,z)+zi(k);
                    L=surfaceop(surf,pdo,F);
                    V=V+(w(k)*L.solve());
                    parfor_progress(pf);
                end
                if and(its==1,m>1)
                    [V0,S0,W0]=svd(V);
                    disp('svd check')
                    diag(S0)/S0(1,1)
                    m=find(diag(S0)/S0(1,1)>p.Results.svdTOL,1,'last');
                    disp('new m')
                    m
                    V0=V0(1:m); S0=S0(1:m,1:m); W0=W0(1:m,1:m);
                    V=V0*S0*W0';
                end
                [Q,~]=qr(V);
                potQ=repmat(surfacefun(surf),1,m);
                for i=1:m
                    potQ(i)=times(surf_pot,Q(i));
                end
                L=-Q'*lap(Q)+Q'*potQ;
                [X,D]=eig(L);
                F=Q*X;
                its=its+1;
                if its>p.Results.max_its
                    its=0;
                end
            end
            res=zeros(m,1);
            potF=repmat(surfacefun(surf),1,m);
            for i=1:m
                potF(i)=times(surf_pot,F(i));
            end
            for i=1:m
                res(i)=norm(-lap(F(i))+potF(i)-D(i)*F(i))/norm(F(i));
            end
        elseif strcmp(bndry,'open')
            while its>0
                V=repmat(surfacefun(surf),1,m);
                pf = parfor_progress(l);
                pfcleanup = onCleanup(@() delete(pf));
                for k=1:l
                    pdo.c=@(x,y,z) -pot(x,y,z)+zi(k);
                    L=surfaceop(surf,pdo,F);
                    V=V+(w(k)*L.solve(0));
                    parfor_progress(pf);
                end
                if and(its==1,m>1)
                    [V0,S0,W0]=svd(V);
                    disp('svd check')
                    diag(S0)/S0(1,1)
                    m=find(diag(S0)/S0(1,1)>p.Results.svdTOL,1,'last');
                    disp('new m')
                    m
                    V0=V0(1:m); S0=S0(1:m,1:m); W0=W0(1:m,1:m);
                    V=V0*S0*W0';
                end
                [Q,~]=qr(V);
                potQ=repmat(surfacefun(surf),1,m);
                for i=1:m
                    potQ(i)=times(surf_pot,Q(i));
                end
                L=-Q'*lap(Q)+Q'*potQ;
                [X,D]=eig(L);
                F=Q*X;
                its=its+1;
                if its>p.Results.max_its
                    its=0;
                end
            end
            res=zeros(m,1);
            potF=repmat(surfacefun(surf),1,m);
            for i=1:m
                potF(i)=times(surf_pot,F(i));
            end
            for i=1:m
                res(i)=norm(-lap(F(i))+potF(i)-D(i)*F(i))/norm(F(i));
            end
        end
    elseif isa(pot,'surfacefun')
        if strcmp(bndry,'closed')
            while its>0
                V=repmat(surfacefun(surf),1,m);
                pf = parfor_progress(l);
                pfcleanup = onCleanup(@() delete(pf));
                for k=1:l
                    pdo.c=-pot+zi(k);
                    L=surfaceop(surf,pdo,F);
                    V=V+(w(k)*L.solve());
                    parfor_progress(pf);
                end
                if its==1
                    [V0,S0,W0]=svd(V);
                    disp('svd check')
                    diag(S0)/S0(1,1)
                    m=find(diag(S0)/S0(1,1)>p.Results.svdTOL,1,'last');
                    disp('new m')
                    m
                    V0=V0(1:m); S0=S0(1:m,1:m); W0=W0(1:m,1:m);
                    V=V0*S0*W0';
                end
                [Q,~]=qr(V);
                potQ=repmat(surfacefun(surf),1,m);
                for i=1:m
                    potQ(i)=times(pot,Q(i));
                end
                L=-Q'*lap(Q)+Q'*potQ;
                [X,D]=eig(L);
                F=Q*X;
                its=its+1;
                if its>p.Results.max_its
                    its=0;
                end
            end
            res=zeros(m,1);
            potF=repmat(surfacefun(surf),1,m);
            for i=1:m
                potF(i)=times(pot,F(i));
            end
            for i=1:m
                res(i)=norm(-lap(F(i))+potF(i)-D(i)*F(i))/norm(F(i));
            end
        elseif strcmp(bndry,'open')
            while its>0
                V=repmat(surfacefun(surf),1,m);
                pf = parfor_progress(l);
                pfcleanup = onCleanup(@() delete(pf));
                for k=1:l
                    pdo.c=-pot+zi(k);
                    L=surfaceop(surf,pdo,F);
                    V=V+(w(k)*L.solve(0));
                    parfor_progress(pf);
                end
                if and(its==1,m>1)
                    [V0,S0,W0]=svd(V);
                    disp('svd check')
                    diag(S0)/S0(1,1)
                    m=find(diag(S0)/S0(1,1)>p.Results.svdTOL,1,'last');
                    disp('new m')
                    m
                    V0=V0(1:m); S0=S0(1:m,1:m); W0=W0(1:m,1:m);
                    V=V0*S0*W0';
                end
                [Q,~]=qr(V);
                potQ=repmat(surfacefun(surf),1,m);
                for i=1:m
                    potQ(i)=times(pot,Q(i));
                end
                L=-Q'*lap(Q)+Q'*potQ;
                [X,D]=eig(L);
                F=Q*X;
                its=its+1;
                if its>p.Results.max_its
                    its=0;
                end
            end
            res=zeros(m,1);
            potF=repmat(surfacefun(surf),1,m);
            for i=1:m
                potF(i)=times(pot,F(i));
            end
            for i=1:m
                res(i)=norm(-lap(F(i))+potF(i)-D(i)*F(i))/norm(F(i));
            end
        end
    end
end