%% load relevant data
clear
addpath(genpath('C:\Users\gusta\Dropbox\Koopman Control\Code\chebfun'))
addpath(genpath('C:\Users\gusta\Dropbox\surfspec\Old Code\Code\SurfSpec\surfacefun-master'))
load('laplace_evals.mat')
load('surfaces.mat')
fontsize=36;
%load('laplace_efuns')

%% plotting eval figures for Laplace
plotWeylNumFirst(sphere,sphere_evals,1,'sphere_lap_evals_number')
plotWeylNumErrorFirst(sphere,sphere_evals,1,'sphere_lap_evals_error',flip([10^0 10^(-5) 10^(-10) 10^(-15)]))
plotWeylNumSecond(cap,cap_evals,2*pi,'cap_lap_evals_number')
plotWeylNumErrorSecond(cap,cap_evals,2*pi,'cap_lap_evals_error',flip([10^0 10^(-5) 10^(-10) 10^(-15)]))

%%
plotWeylNumFirst(blob,blob_evals,1,'blob_lap_evals_number')
plotWeylNumErrorFirst(blob,blob_evals,1,'blob_lap_evals_error',flip([10^0 10^(-2) 10^(-4) 10^(-6)]))
plotWeylNumSecond(mobius,mobius_evals,6.50337723307304,'mobius_lap_evals_number')
plotWeylNumErrorSecond(mobius,mobius_evals,6.50337723307304,'mobius_lap_evals_error',flip([10^0 10^(-1) 10^(-2)]))
plotWeylNumFirst(torus,torus_evals,1,'torus_lap_evals_number')
plotWeylNumErrorFirst(torus,torus_evals,1,'torus_lap_evals_error',flip([10^0 10^(-1) 10^(-2) 10^(-3) 10^(-4) 10^(-5)]))
plotWeylNumFirst(tric,tric_evals,1,'tric_lap_evals_number')
plotWeylNumErrorFirst(tric,tric_evals,1,'tric_lap_evals_error',flip([10^0 10^(-1) 10^(-2) 10^(-3) 10^(-4) 10^(-5)]))

return

%%
load('blob mobius torus.mat')

%% plot eigenfunctions
figure
plot(F_torus(1))
grid off
axis off
colormap('inferno')
%title('$\quad\lambda=158.52046 \\ \mathrm{res}(\lambda)=2.43\times 10^{-7}$','interpreter','latex','fontsize',fontsize)
view([-20.7 42.7637])
%axis tight
exportgraphics(gcf,'C:\Users\gusta\Dropbox\surfspec\Paper Code\Figures/torus_efun_1000.png')

%%
figure
plot(F_mobius(2))
grid off
axis off
colormap('inferno')
%title('$\;\lambda=2081.0685704 \\ \mathrm{res}(\lambda)=3.28\times 10^{-9}$','interpreter','latex','fontsize',fontsize)
exportgraphics(gcf,'C:\Users\gusta\Dropbox\surfspec\Paper Code\Figures/mobius_efun_1000.png')

%%
figure
plot(F_blob)
grid off
axis off
colormap('inferno')
%axis tight
%title('$\;\;\,\lambda=682.963454 \\ \mathrm{res}(\lambda)=1.19\times 10^{-7}$','interpreter','latex','fontsize',fontsize)
exportgraphics(gcf,'C:\Users\gusta\Dropbox\surfspec\Paper Code\Figures/blob_efun_1000.png')

%%
figure
plot(F_sphere(11))
grid off
axis off
colormap('inferno')
%title('$\;\;\lambda=992.0000000 \\ \mathrm{res}(\lambda)=2.87\times 10^{-8}$','interpreter','latex','fontsize',fontsize)
exportgraphics(gcf,'C:\Users\gusta\Dropbox\surfspec\Paper Code\Figures/sphere_efun_1000.png')

%%
figure
plot(F_cap(5))
grid off
axis off
colormap('inferno')
%title('$\;\;\,\lambda=2070.00000 \\ \mathrm{res}(\lambda)=9.77\times 10^{-7}$','interpreter','latex','fontsize',fontsize)
view([-243.8 -19.5])
exportgraphics(gcf,'C:\Users\gusta\Dropbox\surfspec\Paper Code\Figures/cap_efun_1000.png')

%%
load('tric_efun.mat')

%%
figure
plot(F_tric)
grid off
axis off
colormap('inferno')
%title('$\quad\;\;\lambda=887.819 \\ \mathrm{res}(\lambda)=4.70\times 10^{-4}$','interpreter','latex','fontsize',fontsize)
view([48.63070 16.3151])
exportgraphics(gcf,'C:\Users\gusta\Dropbox\surfspec\Paper Code\Figures/tric_efun_1000.png')

%%
% figure
% plot(tric)
% view([48.63070 16.3151])
% grid off
% axis off
% exportgraphics(gcf,'C:\Users\gusta\Dropbox\surfspec\Paper Code\Figures/triceratops_mesh.png')
