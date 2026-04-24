%% load relevant data
clear
eval_1000=tric_lap_evals2(1000);
V=@(x,y,z) x.^2+y.^2+z.^2;

%% quadrature nodes 
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

%% mesh order
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
