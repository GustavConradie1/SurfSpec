%% load relevant data
clear

%% plotting eval figures for Laplace
plotWeylNumFirst(blob,blob_evals_schr,2*pi,'blob_schr_evals_number')
plotWeylNumErrorFirst(blob,blob_evals_schr,2*pi,'blob_schr_evals_error',flip([10^0 10^(-5) 10^(-10) 10^(-15)]))
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
view([-20.7 42.7637])
exportgraphics(gcf,'torus_efun_1000_schr.png')

%%
figure
plot(F_mobius(2))
grid off
axis off
colormap('viridis')
exportgraphics(gcf,'mobius_efun_1000_schr.png')

%%
figure
plot(F_blob)
grid off
axis off
colormap('viridis')
exportgraphics(gcf,'blob_efun_1000_schr.png')

%%
figure
plot(F_tric)
grid off
axis off
colormap('viridis')
view([48.63070 16.3151])
exportgraphics(gcf,'tric_efun_1000_schr.png')

