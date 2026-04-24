%%
clear
addpath(genpath("C:\Users\gusta\Downloads\chebfun"))
addpath(genpath('C:\Users\gusta\Dropbox\surfspec\Old Code\Code\SurfSpec\surfacefun-master'))
load('nlep_mobius.mat')

%% nlep plots
figure
plot(-F1)
%title('Eigenfunction $1$','interpreter','latex','fontsize',18)
axis off
exportgraphics(gcf,'C:\Users\gusta\Dropbox\surfspec\Paper Code\Figures/nlep_efun_1.png')
%%
figure
plot(F10)
%title('Eigenfunction $10$','interpreter','latex','fontsize',18)
axis off
exportgraphics(gcf,'C:\Users\gusta\Dropbox\surfspec\Paper Code\Figures/nlep_efun_10.png')
%%
figure
plot(F100)
%title('Eigenfunction $100$','interpreter','latex','fontsize',18)
axis off
exportgraphics(gcf,'C:\Users\gusta\Dropbox\surfspec\Paper Code\Figures/nlep_efun_100.png')
