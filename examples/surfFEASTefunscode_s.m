%%
clear
addpath(genpath("C:\Users\gusta\Downloads\chebfun"))
addpath(genpath('C:\Users\gusta\Dropbox\surfspec\Old Code\Code\SurfSpec\surfacefun-master'))
V=@(x,y,z) x.^2+y.^2+z.^2;

%%
% why torus eigenfunctions non existent in middle
torus=surfacemesh.reg_torus(17,16,48);
[D_torus,F_torus,res_torus]=schrSpec2(torus,'closed',0,V,'contour','circle','radii',0.02,'centre',165.36,'m',2,'max_its',2,'num_nodes',20);
save('torus_temp')

%%
figure
plot(F_torus(2))
grid off
axis off
view([-20.7 42.7637])

%% (10^(-8) w 60,20, nodes=80) (90,30,120 does run in about 4 hours)
mobius=surfacemesh.mobius(17,60,20);
[D_mobius,F_mobius,res_mobius]=schrSpec2(mobius,'open',0,V,'contour','circle','radii',0.1,'centre',2068,'m',2,'max_its',2,'num_nodes',20);
save('mobius_temp')

%%
figure
plot(F_mobius(2))
axis off

% %%
% rng(0)
% blob=surfacemesh.blob(17,4);
% [D_blob,F_blob,res_blob]=schrSpec2(blob,'closed',0,V,'contour','circle','radii',0.2,'centre',684.3,'m',1,'max_its',1,'num_nodes',20);
% save('blob_temp')
% 
% %%
% figure
% plot(F_blob)
% axis off
% 
%%
dom = surfacemesh.import('baby_triceratops.csv', 'rhino');
dom = resample(dom,29);
[D_tric,F_tric,res_tric]=schrSpec2(dom,'open',0,V,'contour','circle','radii',0.1,'centre',889,'m',1,'max_its',1,'num_nodes',20,'svdTOL',0);
save('tric_temp')

%%
figure
plot(F_tric)
axis off
%view([-243.8 -30.6])

%%
%save('schrodinger_efuns')