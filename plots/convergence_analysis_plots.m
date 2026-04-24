clear
fontsize=48;
axissize=36;
linesize=5;

%% residuals w size of evals - elliptical contours
load('C:\Users\gusta\Dropbox\surfspec\Paper Code\tric_evals_s.mat')
figure
scatter(tric_lap_evals_s(1:1000),tric_lap_res_s(1:1000),20,'filled')
hold on
idx=find(tric_lap_res_s(1:1000)>5);
scatter(tric_lap_evals_s(idx),tric_lap_res_s(idx),100,'filled')
ax=gca; ax.FontSize=axissize;
xlabel('$\lambda$','interpreter','latex','fontsize',fontsize)
ylabel('$\mathrm{res}(\lambda)$','interpreter','latex','fontsize',fontsize)
%axis tight
yscale('log')
xlim([0 890])
xticks([0 200 400 600 800])
exportgraphics(gcf,'C:\Users\gusta\Dropbox\surfspec\Paper Code\Figures/schr_tric_res_eval.pdf','ContentType','vector','BackgroundColor','none')

% %% residuals w size of evals - circular contours
% load('C:\Users\gusta\Dropbox\surfspec\Paper Code\tric_residuals_evals.mat')
% figure
% scatter(tric_lap_evals_s(50:50:1000),res_evals,100,'filled')
% ax=gca; ax.FontSize=axissize;
% xlabel('$\lambda$','interpreter','latex','fontsize',fontsize)
% ylabel('$\mathrm{res}(\lambda)$','interpreter','latex','fontsize',fontsize)
% %axis tight
% yscale('log')
% xlim([0 890])
% xticks([0 200 400 600 800])
% exportgraphics(gcf,'C:\Users\gusta\Dropbox\surfspec\Paper Code\Figures/schr_tric_res_eval_circ.pdf','ContentType','vector','BackgroundColor','none')


%% residuals w order of mesh
load('C:\Users\gusta\Dropbox\surfspec\Paper Code\tric_residuals_order.mat')
figure
p_range=[4 8 12 16 20 24 28];
loglog(p_range,res_mesh_order,'linewidth',linesize)
ax=gca; ax.FontSize=axissize;
xlabel('$p$','interpreter','latex','fontsize',fontsize)
ylabel('$\mathrm{res}(\lambda_{1000})$','interpreter','latex','fontsize',fontsize)
xlim([4 28])
xticks(p_range)
yticks([10^(-4) 10^(-2) 1 10^2])
ylim([10^(-4) 310])
exportgraphics(gcf,'C:\Users\gusta\Dropbox\surfspec\Paper Code\Figures/schr_tric_res_order.pdf','ContentType','vector','BackgroundColor','none')

% %% residuals w size of mesh
% load('C:\Users\gusta\Dropbox\surfspec\Paper Code\tric_residuals_faces.mat')
% figure
% face_range=[1781 2*1781];
% semilogy(face_range,res_mesh_faces,'linewidth',linesize) %could be log plot
% ax=gca; ax.FontSize=axissize;
% xlabel('Faces','interpreter','latex','fontsize',fontsize)
% ylabel('$\mathrm{res}(\lambda_{1000})$','interpreter','latex','fontsize',fontsize)
% axis tight
% xticks(face_range)
% exportgraphics(gcf,'C:\Users\gusta\Dropbox\surfspec\Paper Code\Figures/schr_tric_res_faces.pdf','ContentType','vector','BackgroundColor','none')

%% residuals w number of nodes
load('C:\Users\gusta\Dropbox\surfspec\Paper Code\tric_residuals_nodes.mat')
figure
node_range=2:2:20;
plot(node_range,res_nodes,'linewidth',linesize) %could be log plot
ax=gca; ax.FontSize=axissize;
xlabel('Nodes','interpreter','latex','fontsize',fontsize)
ylabel('$\mathrm{res}(\lambda_{1000})$','interpreter','latex','fontsize',fontsize)
xticks([2 8 14 20])
axis([2 20 0 0.08])
%axis tight
exportgraphics(gcf,'C:\Users\gusta\Dropbox\surfspec\Paper Code\Figures/schr_tric_res_nodes.pdf','ContentType','vector','BackgroundColor','none')