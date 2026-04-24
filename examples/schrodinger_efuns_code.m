%%
clear
V=@(x,y,z) x.^2+y.^2+z.^2;

%%
torus=surfacemesh.reg_torus(17,16,48);
[D_torus,F_torus,res_torus]=schrSpec2(torus,'closed',0,V,'contour','circle','radii',0.02,'centre',165.36,'m',2,'max_its',2,'num_nodes',20);

%%
mobius=surfacemesh.mobius(17,60,20);
[D_mobius,F_mobius,res_mobius]=schrSpec2(mobius,'open',0,V,'contour','circle','radii',0.1,'centre',2068,'m',2,'max_its',2,'num_nodes',20);

%%
rng(0)
blob=surfacemesh.blob(17,4);
[D_blob,F_blob,res_blob]=schrSpec2(blob,'closed',0,V,'contour','circle','radii',0.2,'centre',684.3,'m',1,'max_its',1,'num_nodes',20);

%%
dom = surfacemesh.import('baby_triceratops.csv', 'rhino');
dom = resample(dom,29);
[D_tric,F_tric,res_tric]=schrSpec2(dom,'open',0,V,'contour','circle','radii',0.1,'centre',889,'m',1,'max_its',1,'num_nodes',20,'svdTOL',0);

%%
save('schrodinger_efuns')