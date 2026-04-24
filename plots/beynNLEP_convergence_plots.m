clear
fontsize=36;
axissize=28;
linesize=4;

%% residuals w size of mesh
load('nlep_residuals_faces.mat')
figure
face_range=3*(5:1:15).^2;
loglog(face_range,res_faces,'linewidth',linesize)
ax=gca; ax.FontSize=axissize;
xlabel('Elements','interpreter','latex','fontsize',fontsize)
ylabel('$\mathrm{res}(\lambda_{100})$','interpreter','latex','fontsize',fontsize)
axis tight
exportgraphics(gcf,'nlep_res_faces.pdf','ContentType','vector','BackgroundColor','none')

%% residuals w number of nodes
load('nlep_residuals_nodes.mat')
figure
node_range=5:5:50;
semilogy(node_range,res_nodes(1:10),'linewidth',linesize)
ax=gca; ax.FontSize=axissize;
xlabel('Nodes','interpreter','latex','fontsize',fontsize)
ylabel('$\mathrm{res}(\lambda_{100})$','interpreter','latex','fontsize',fontsize)
xticks([5 20 35 50])
xlim([5 50])
exportgraphics(gcf,'nlep_res_nodes.pdf','ContentType','vector','BackgroundColor','none')