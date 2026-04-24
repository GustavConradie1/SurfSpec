%%
clear

%%
torus=surfacemesh.reg_torus(17,16,48);
[D_torus,F_torus,res_torus]=lapSpec2(torus,'closed',0,'contour','circle','radii',0.1,'centre',158.5,'m',2,'max_its',2,'num_nodes',20);

%%
figure
plot(F_torus(1))
grid off
axis off
view([-20.7 42.7637])

%%
mobius=surfacemesh.mobius(17,60,20);
[D_mobius,F_mobius,res_mobius]=lapSpec2(mobius,'open',0,'contour','circle','radii',0.1,'centre',2081.05,'m',5,'max_its',2,'num_nodes',20);

%%
figure
plot(F_mobius(2))
axis off

%% 
rng(0)
blob=surfacemesh.blob(17,4);
[D_blob,F_blob,res_blob]=lapSpec2(blob,'closed',0,'contour','circle','radii',0.2,'centre',682.9,'m',1,'max_its',1,'num_nodes',20);

%%
figure
plot(F_blob)
axis off

%%
sphere=surfacemesh.sphere(17,4);
[D_sphere,F_sphere,res_sphere]=lapSpec(sphere,'closed',0,'contour','circle','radii',1,'centre',992,'m',63,'max_its',2,'num_nodes',100,'svdTOL',0);

%%
figure
plot(F_sphere(8))
axis off

%%
cap=surfacemesh.hemisphere(17,5,'r');
[D_cap,F_cap,res_cap]=lapSpec(cap,'open',0,'contour','circle','radii',1,'centre',2070,'m',45,'max_its',2,'num_nodes',100,'svdTOL',0);

%%
figure
plot(F_cap(4))
axis off
view([-243.8 -30.6])

%%
dom = surfacemesh.import('baby_triceratops.csv', 'rhino');
dom = resample(dom,29);
[D_tric,F_tric,res_tric]=lapSpec2(dom,'open',0,'contour','circle','radii',0.1,'centre',887.8,'m',1,'max_its',1,'num_nodes',20,'svdTOL',0);

%%
figure
plot(F_tric)
axis off
view([48.63070 16.3151])

%%
save('laplace_efuns')