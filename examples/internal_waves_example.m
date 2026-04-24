clear

%% Set up the surface mesh and PDE
torus = surfacemesh.reg_torus(17,8,24);
a1 = {@(x,y,z)0*x,@(x,y,z) 0*x,@(x,y,z) 0*x;
    @(x,y,z) 0*x,@(x,y,z) -1+0*x,@(x,y,z) 0*x;
    @(x,y,z) 0*x,@(x,y,z) 0*x,@(x,y,z) 0*x};

c1 = @(x,y,z) cos(10*x).^2;
a2 = {@(x,y,z) -1+0*x,@(x,y,z) 0*x,@(x,y,z) 0*x;
    @(x,y,z) 0*x,@(x,y,z) -1+0*x,@(x,y,z) 0*x;
    @(x,y,z) 0*x,@(x,y,z) 0*x,@(x,y,z) -1+0*x};
c2 = @(x,y,z) 1+0*x;
f = @(x,y,z) sin(2*(x-y+z).^2);

%% Set up parameters
X = -0.05:0.02:1.05;
order = 6;
mu = surfSpecPencilMeasure(torus,'closed',f,X,0.2,'order',order,'a1',a1,'c1',c1,'a2',a2,'c2',c2);
mu2 = surfSpecPencilMeasure(torus,'closed',f,X,0.1,'order',order,'a1',a1,'c1',c1,'a2',a2,'c2',c2);
mu3 = surfSpecPencilMeasure(torus,'closed',f,X,0.05,'order',order,'a1',a1,'c1',c1,'a2',a2,'c2',c2);

%%
figure
plot(X,mu/mean(abs(mu)))
hold on
plot(X,mu2/mean(abs(mu2)))
plot(X,mu3/mean(abs(mu3)))

%%
u1=surfSpecPencilEfun(torus,'closed',f,0.2,1,'order',6,'a1',a1,'c1',c1,'a2',a2,'c2',c2);
u2=surfSpecPencilEfun(torus,'closed',f,0.1,1,'order',6,'a1',a1,'c1',c1,'a2',a2,'c2',c2);
u3=surfSpecPencilEfun(torus,'closed',f,0.05,1,'order',6,'a1',a1,'c1',c1,'a2',a2,'c2',c2);

%%
save('torus_gefun','u1','u2','u3')

%%
figure
v = u1;
v = v - mean(v);
plot(v)
camlight('left')
colormap(brighten(redblue,0.2))
clim([-1,1])
axis equal
axis off
set(gca,'view',[-64.3000 23.0670])
exportgraphics(gcf,'torus_gefun_02.png')

%%
figure
v = u2;
v = v - mean(v);
plot(v)
camlight('left')
colormap(brighten(redblue,0.2))
clim([-1,1])
axis equal
axis off
set(gca,'view',[-64.3000 23.0670])
exportgraphics(gcf,'torus_gefun_01.png')

%%
figure
v = u3;
v = v - mean(v);
plot(v)
camlight('left')
colormap(brighten(redblue,0.2))
clim([-1,1])
axis equal
axis off
set(gca,'view',[-64.3000 23.0670])
exportgraphics(gcf,'torus_gefun_005.png')

