% residuals as vary by
% 1. eval size
% 2. quadrature nodes
% 3. mesh order
% 4. mesh size
% also try more iterations, oversampling?

%%
clear
addpath(genpath("C:\Users\gusta\Downloads\chebfun"))
addpath(genpath('C:\Users\gusta\Dropbox\surfspec\Old Code\Code\SurfSpec\surfacefun-master'))
load('C:\Users\gusta\Dropbox\surfspec\Paper Code\tric_evals.mat')
load('C:\Users\gusta\Dropbox\surfspec\Paper Code\tric_evals_s.mat')
eval_1000=tric_lap_evals2(1000);
V=@(x,y,z) x.^2+y.^2+z.^2;

%% 1. eval size
evals=tric_lap_evals_s(50:50:1000);
%res_evals=zeros(length(evals),1);
dom = surfacemesh.import('baby_triceratops.csv', 'rhino');
dom = resample(dom,13);
for i=1:1
    [D,~,res]=schrSpec2(dom,'open',0,V,'contour','circle','radii',0.1,'centre',evals(i),'m',5,'max_its',1,'num_nodes',15,'svdTOL',0);
    disp(D)
    disp(res)
    %res_evals(i)=res;
    %save('tric_residuals_evals','res_evals')
end
%figure
%scatter(real(evals),res_evals)

%% 2. quadrature nodes - question, does number of necessay nodes change depending on mesh/order? 
nodes_range=[1;2;3;4;5;6;7;8;9;10];
res_nodes=zeros(length(nodes_range),1);
dom = surfacemesh.import('baby_triceratops.csv', 'rhino');
dom=resample(dom,17);
for i=1:length(nodes_range)   
    [D,~,res]=lapSpec2(dom,'open',0,'contour','circle','radii',0.1,'centre',eval_1000,'m',1,'max_its',1,'num_nodes',nodes_range(i),'svdTOL',0);
    disp(D)
    disp(res)
    res_nodes(i)=res;
    save('tric_residuals_nodes','res_nodes')
end
figure
scatter(nodes_range,res_nodes)

%% 3. mesh order
order_range=[4;8;12;16;20;24;28];
res_mesh_order=zeros(length(order_range),1);
for i=8:length(order_range)
    p=order_range(i);
    dom = surfacemesh.import('baby_triceratops.csv', 'rhino');
    dom=resample(dom,p+1);
    [D,~,res]=lapSpec2(dom,'open',0,'contour','circle','radii',0.1,'centre',eval_1000,'m',1,'max_its',1,'num_nodes',10,'svdTOL',0);
    disp(D)
    disp(res)
    res_mesh_order(i)=res;
    save('tric_residuals_order2','res_mesh_order')
end
figure
scatter(order_range,res_mesh_order)

%% 4. mesh size - run out of memory to do this
dom = surfacemesh.import('baby_triceratops.csv', 'rhino');
dom=resample(dom,13);
dom=refine(dom);
dom=refine(dom);
%res_mesh_faces=zeros(3,1);
[D,~,res]=lapSpec2(dom,'open',0,'contour','circle','radii',0.1,'centre',eval_1000,'m',1,'max_its',1,'num_nodes',10,'svdTOL',0);
disp(D)
disp(res)
save('tric_faces_temp')
% for i=1:length(res_mesh_faces)
%     [D,~,res]=lapSpec2(dom,'open',0,'contour','circle','radii',0.1,'centre',eval_1000,'m',1,'max_its',1,'num_nodes',10,'svdTOL',0);
%     disp(D)
%     disp(res)
%     res_mesh_faces(i)=res;
%     if i<length(res_size)
%         dom=refine(dom);
%     end
% end
% figure
% plot([1781,7124,28496],res_mesh_faces)