clear

%% as vary number of nodes
mobius=surfacemesh.mobius(17,30,10);
nodes_range=5:5:100;
res_nodes=zeros(length(nodes_range),1);
for i=1:length(nodes_range)
    nodes=nodes_range(i);
    disp(nodes)
    [D,~,res]=beynNLEP(mobius,'open',1,'contour','circle','radii',0.001,'centre',-5,'num_nodes',nodes,'a',{@(x,y,z,l) 1+0*x,@(x,y,z,l) 0*x,@(x,y,z,l) 0*x; @(x,y,z,l) 0*x,@(x,y,z,l) 1+0*x,@(x,y,z,l) 0*x;@(x,y,z,l) 0*x,@(x,y,z,l) 0*x,@(x,y,z,l) 1+0*x},'b',{@(x,y,z,l) 0*x,@(x,y,z,l) 0*x,@(x,y,z,l) 0*x},'c',@(x,y,z,l) sin(x).^2.*sin(y).^2.*sin(z).^2-l+exp(-l).*(sin(x+y+z)+1.5));
    res_nodes(i)=res;
    save('nlep_residuals_nodes','nodes_range','res_nodes')
end

%% as vary surface for fixed nodes
discretization_range=5:1:15;
res_faces=zeros(length(discretization_range),1);
for i=1:length(discretization_range)
    d=discretization_range(i);
    mobius=surfacemesh.mobius(17,3*d,d);
    disp(nodes)
    [D,~,res]=beynNLEP(mobius,'open',1,'contour','circle','radii',0.001,'centre',-5,'num_nodes',50,'a',{@(x,y,z,l) 1+0*x,@(x,y,z,l) 0*x,@(x,y,z,l) 0*x; @(x,y,z,l) 0*x,@(x,y,z,l) 1+0*x,@(x,y,z,l) 0*x;@(x,y,z,l) 0*x,@(x,y,z,l) 0*x,@(x,y,z,l) 1+0*x},'b',{@(x,y,z,l) 0*x,@(x,y,z,l) 0*x,@(x,y,z,l) 0*x},'c',@(x,y,z,l) sin(x).^2.*sin(y).^2.*sin(z).^2-l+exp(-l).*(sin(x+y+z)+1.5));
    res_faces(i)=res;
    save('nlep_residuals_faces','discretization_range','res_faces')
end