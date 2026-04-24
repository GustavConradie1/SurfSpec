clear
addpath(genpath("C:\Users\gusta\Downloads\chebfun"))
addpath(genpath('C:\Users\gusta\Dropbox\surfspec\Old Code\Code\SurfSpec\surfacefun-master'))

%% beyn nlep - nb residuals are bad as only one iteration if u take m>1
mobius=surfacemesh.mobius(17,30,7);
nodes=50;
disp(1)
[D1,F1,res1]=beynNLEP(mobius,'open',1,'contour','circle','radii',0.1,'centre',-1.4,'num_nodes',nodes,'a',{@(x,y,z,l) 1+0*x,@(x,y,z,l) 0*x,@(x,y,z,l) 0*x; @(x,y,z,l) 0*x,@(x,y,z,l) 1+0*x,@(x,y,z,l) 0*x;@(x,y,z,l) 0*x,@(x,y,z,l) 0*x,@(x,y,z,l) 1+0*x},'b',{@(x,y,z,l) 0*x,@(x,y,z,l) 0*x,@(x,y,z,l) 0*x},'c',@(x,y,z,l) sin(x).^2.*sin(y).^2.*sin(z).^2-l+exp(-l).*(sin(x+y+z)+1.5));
res1
disp(2)
[D2,F2,res2]=beynNLEP(mobius,'open',1,'contour','circle','radii',0.1,'centre',-1.6,'num_nodes',nodes,'a',{@(x,y,z,l) 1+0*x,@(x,y,z,l) 0*x,@(x,y,z,l) 0*x; @(x,y,z,l) 0*x,@(x,y,z,l) 1+0*x,@(x,y,z,l) 0*x;@(x,y,z,l) 0*x,@(x,y,z,l) 0*x,@(x,y,z,l) 1+0*x},'b',{@(x,y,z,l) 0*x,@(x,y,z,l) 0*x,@(x,y,z,l) 0*x},'c',@(x,y,z,l) sin(x).^2.*sin(y).^2.*sin(z).^2-l+exp(-l).*(sin(x+y+z)+1.5));
disp(3)
[D3,F3,res3]=beynNLEP(mobius,'open',1,'contour','circle','radii',0.1,'centre',-1.85,'num_nodes',nodes,'a',{@(x,y,z,l) 1+0*x,@(x,y,z,l) 0*x,@(x,y,z,l) 0*x; @(x,y,z,l) 0*x,@(x,y,z,l) 1+0*x,@(x,y,z,l) 0*x;@(x,y,z,l) 0*x,@(x,y,z,l) 0*x,@(x,y,z,l) 1+0*x},'b',{@(x,y,z,l) 0*x,@(x,y,z,l) 0*x,@(x,y,z,l) 0*x},'c',@(x,y,z,l) sin(x).^2.*sin(y).^2.*sin(z).^2-l+exp(-l).*(sin(x+y+z)+1.5));
disp(4)
[D4,F4,res4]=beynNLEP(mobius,'open',1,'contour','circle','radii',0.1,'centre',-2.1,'num_nodes',nodes,'a',{@(x,y,z,l) 1+0*x,@(x,y,z,l) 0*x,@(x,y,z,l) 0*x; @(x,y,z,l) 0*x,@(x,y,z,l) 1+0*x,@(x,y,z,l) 0*x;@(x,y,z,l) 0*x,@(x,y,z,l) 0*x,@(x,y,z,l) 1+0*x},'b',{@(x,y,z,l) 0*x,@(x,y,z,l) 0*x,@(x,y,z,l) 0*x},'c',@(x,y,z,l) sin(x).^2.*sin(y).^2.*sin(z).^2-l+exp(-l).*(sin(x+y+z)+1.5));
disp(5)
[D5,F5,res5]=beynNLEP(mobius,'open',1,'contour','circle','radii',0.1,'centre',-2.3,'num_nodes',nodes,'a',{@(x,y,z,l) 1+0*x,@(x,y,z,l) 0*x,@(x,y,z,l) 0*x; @(x,y,z,l) 0*x,@(x,y,z,l) 1+0*x,@(x,y,z,l) 0*x;@(x,y,z,l) 0*x,@(x,y,z,l) 0*x,@(x,y,z,l) 1+0*x},'b',{@(x,y,z,l) 0*x,@(x,y,z,l) 0*x,@(x,y,z,l) 0*x},'c',@(x,y,z,l) sin(x).^2.*sin(y).^2.*sin(z).^2-l+exp(-l).*(sin(x+y+z)+1.5));
disp(10)
[D10,F10,res10]=beynNLEP(mobius,'open',1,'contour','circle','radii',0.01,'centre',-2.84,'num_nodes',nodes,'a',{@(x,y,z,l) 1+0*x,@(x,y,z,l) 0*x,@(x,y,z,l) 0*x; @(x,y,z,l) 0*x,@(x,y,z,l) 1+0*x,@(x,y,z,l) 0*x;@(x,y,z,l) 0*x,@(x,y,z,l) 0*x,@(x,y,z,l) 1+0*x},'b',{@(x,y,z,l) 0*x,@(x,y,z,l) 0*x,@(x,y,z,l) 0*x},'c',@(x,y,z,l) sin(x).^2.*sin(y).^2.*sin(z).^2-l+exp(-l).*(sin(x+y+z)+1.5));
disp(20)
[D20,F20,res20]=beynNLEP(mobius,'open',1,'contour','circle','radii',0.01,'centre',-3.55,'num_nodes',nodes,'a',{@(x,y,z,l) 1+0*x,@(x,y,z,l) 0*x,@(x,y,z,l) 0*x; @(x,y,z,l) 0*x,@(x,y,z,l) 1+0*x,@(x,y,z,l) 0*x;@(x,y,z,l) 0*x,@(x,y,z,l) 0*x,@(x,y,z,l) 1+0*x},'b',{@(x,y,z,l) 0*x,@(x,y,z,l) 0*x,@(x,y,z,l) 0*x},'c',@(x,y,z,l) sin(x).^2.*sin(y).^2.*sin(z).^2-l+exp(-l).*(sin(x+y+z)+1.5));
disp(50)
[D50,F50,res50]=beynNLEP(mobius,'open',1,'contour','circle','radii',0.001,'centre',-4.316,'num_nodes',nodes,'a',{@(x,y,z,l) 1+0*x,@(x,y,z,l) 0*x,@(x,y,z,l) 0*x; @(x,y,z,l) 0*x,@(x,y,z,l) 1+0*x,@(x,y,z,l) 0*x;@(x,y,z,l) 0*x,@(x,y,z,l) 0*x,@(x,y,z,l) 1+0*x},'b',{@(x,y,z,l) 0*x,@(x,y,z,l) 0*x,@(x,y,z,l) 0*x},'c',@(x,y,z,l) sin(x).^2.*sin(y).^2.*sin(z).^2-l+exp(-l).*(sin(x+y+z)+1.5));
disp(100)
[D100,F100,res100]=beynNLEP(mobius,'open',1,'contour','circle','radii',0.001,'centre',-5,'num_nodes',nodes,'a',{@(x,y,z,l) 1+0*x,@(x,y,z,l) 0*x,@(x,y,z,l) 0*x; @(x,y,z,l) 0*x,@(x,y,z,l) 1+0*x,@(x,y,z,l) 0*x;@(x,y,z,l) 0*x,@(x,y,z,l) 0*x,@(x,y,z,l) 1+0*x},'b',{@(x,y,z,l) 0*x,@(x,y,z,l) 0*x,@(x,y,z,l) 0*x},'c',@(x,y,z,l) sin(x).^2.*sin(y).^2.*sin(z).^2-l+exp(-l).*(sin(x+y+z)+1.5));
res100
% then consider D+-res
%%
save('nlep_mobius2')
