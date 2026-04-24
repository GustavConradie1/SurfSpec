%%
clear
load('nlep_mobius.mat')

%% nlep plots
figure
plot(-F1)
axis off
exportgraphics(gcf,'nlep_efun_1.png')
%%
figure
plot(F10)
axis off
exportgraphics(gcf,'nlep_efun_10.png')
%%
figure
plot(F100)
axis off
exportgraphics(gcf,'nlep_efun_100.png')
