%% load relevant data
clear

%% plotting eval figures for Laplace
plotWeylNumFirst(sphere,sphere_evals,1,'sphere_lap_evals_number')
plotWeylNumErrorFirst(sphere,sphere_evals,1,'sphere_lap_evals_error',flip([10^0 10^(-5) 10^(-10) 10^(-15)]))
plotWeylNumSecond(cap,cap_evals,2*pi,'cap_lap_evals_number')
plotWeylNumErrorSecond(cap,cap_evals,2*pi,'cap_lap_evals_error',flip([10^0 10^(-5) 10^(-10) 10^(-15)]))
plotWeylNumFirst(blob,blob_evals,1,'blob_lap_evals_number')
plotWeylNumErrorFirst(blob,blob_evals,1,'blob_lap_evals_error',flip([10^0 10^(-2) 10^(-4) 10^(-6)]))
plotWeylNumSecond(mobius,mobius_evals,6.50337723307304,'mobius_lap_evals_number')
plotWeylNumErrorSecond(mobius,mobius_evals,6.50337723307304,'mobius_lap_evals_error',flip([10^0 10^(-1) 10^(-2)]))
plotWeylNumFirst(torus,torus_evals,1,'torus_lap_evals_number')
plotWeylNumErrorFirst(torus,torus_evals,1,'torus_lap_evals_error',flip([10^0 10^(-1) 10^(-2) 10^(-3) 10^(-4) 10^(-5)]))
plotWeylNumFirst(tric,tric_evals,1,'tric_lap_evals_number')
plotWeylNumErrorFirst(tric,tric_evals,1,'tric_lap_evals_error',flip([10^0 10^(-1) 10^(-2) 10^(-3) 10^(-4) 10^(-5)]))

%% plot eigenfunctions
figure
plot(F_torus(1))
grid off
axis off
colormap('inferno')
view([-20.7 42.7637])
exportgraphics(gcf,'torus_efun_1000.png')

%%
figure
plot(F_mobius(2))
grid off
axis off
colormap('inferno')
exportgraphics(gcf,'mobius_efun_1000.png')

%%
figure
plot(F_blob)
grid off
axis off
colormap('inferno')
exportgraphics(gcf,'blob_efun_1000.png')

%%
figure
plot(F_sphere(11))
grid off
axis off
colormap('inferno')
exportgraphics(gcf,'sphere_efun_1000.png')

%%
figure
plot(F_cap(5))
grid off
axis off
colormap('inferno')
view([-243.8 -19.5])
exportgraphics(gcf,'cap_efun_1000.png')

%%
figure
plot(F_tric)
grid off
axis off
colormap('inferno')
view([48.63070 16.3151])
exportgraphics(gcf,'tric_efun_1000.png')

%%
figure
plot(tric)
view([48.63070 16.3151])
grid off
axis off
exportgraphics(gcf,'triceratops_mesh.png')
