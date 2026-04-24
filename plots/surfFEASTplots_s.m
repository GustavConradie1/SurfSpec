%% load relevant data
clear
addpath(genpath('C:\Users\gusta\Dropbox\Koopman Control\Code\chebfun'))
addpath(genpath('C:\Users\gusta\Dropbox\surfspec\Old Code\Code\SurfSpec\surfacefun-master'))
load('schrodinger_evals.mat')
load('surfaces.mat')
fontsize=36;
%load('schrodinger_efuns')

%% plotting eval figures for Laplace
plotWeylNumFirst(blob,blob_evals_schr,2*pi,'blob_schr_evals_number')
plotWeylNumErrorFirst(blob,blob_evals_schr,2*pi,'blob_schr_evals_error',flip([10^0 10^(-5) 10^(-10) 10^(-15)]))

%%
plotWeylNumSecond(mobius,mobius_evals_schr,6.50337723307304,'mobius_schr_evals_number')
plotWeylNumErrorSecond(mobius,mobius_evals_schr,6.50337723307304,'mobius_schr_evals_error',flip([10^0 10^(-1) 10^(-2)]))
plotWeylNumFirst(torus,torus_evals_schr,1,'torus_schr_evals_number')
plotWeylNumErrorFirst(torus,torus_evals_schr,1,'torus_schr_evals_error',flip([10^0 10^(-1) 10^(-2) 10^(-3) 10^(-4) 10^(-5)]))
plotWeylNumFirst(tric,tric_evals_schr,1,'tric_schr_evals_number')
plotWeylNumErrorFirst(tric,tric_evals_schr,1,'tric_schr_evals_error',flip([10^0 10^(-1) 10^(-2) 10^(-3) 10^(-4) 10^(-5)]))

%% plot eigenfunctions
figure
plot(F_torus(1))
grid off
axis off
colormap('viridis')
%title('$\;\;\lambda=165.3611933 \\ \mathrm{res}(\lambda)=2.65\times 10^{-8}$','interpreter','latex','fontsize',fontsize)
view([-20.7 42.7637])
exportgraphics(gcf,'C:\Users\gusta\Dropbox\surfspec\Paper Code\Figures/torus_efun_1000_schr.png')

%%
figure
plot(F_mobius(2))
grid off
axis off
colormap('viridis')
%title('$\quad\lambda=2068.0469 \\ \mathrm{res}(\lambda)=1.84\times 10^{-5}$','interpreter','latex','fontsize',fontsize)
exportgraphics(gcf,'C:\Users\gusta\Dropbox\surfspec\Paper Code\Figures/mobius_efun_1000_schr.png')

%%
figure
plot(F_blob)
grid off
axis off
colormap('viridis')
%title('$\;\;\,\lambda=684.310343\\ \mathrm{res}(\lambda)=1.20\times 10^{-7}$','interpreter','latex','fontsize',fontsize)
exportgraphics(gcf,'C:\Users\gusta\Dropbox\surfspec\Paper Code\Figures/blob_efun_1000_schr.png')

%%
figure
plot(F_tric)
grid off
axis off
colormap('viridis')
%title('$\quad\;\;\lambda=889.02 \\ \mathrm{res}(\lambda)=6.18\times 10^{-4}$','interpreter','latex','fontsize',fontsize)
view([48.63070 16.3151])
exportgraphics(gcf,'C:\Users\gusta\Dropbox\surfspec\Paper Code\Figures/tric_efun_1000_schr.png')

