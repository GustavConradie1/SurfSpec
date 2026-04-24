function [] = plotWeylNumFirst(surf,D,sf,title)
    %compare number of eigenvalues less than given value to Weyl
    %asymptotics (first term only)
    %D is sorted array of first N eigenvalues of Laplace-Beltrami on surface
    %sf gives a scale factor for eigenvalues so it samples the number less
    %than 1/sf, 2/sf, ..., max_eval/sf
    fontsize=48;
    axissize=36;
    legendsize=36;
    linesize=10;
    D=D*sf;
    max_eval=ceil(max(D));
    nums_weyl=pi*surfacearea(surf)*(0:1/sf:max_eval/sf)/(2*pi)^2;
    nums_eval=zeros(max_eval+1,1);
    for i=0:max_eval
        nums_eval(i+1)=length(find(D<=i));
    end
    figure
        plot(0:1/sf:max_eval/sf,nums_eval,'linewidth',linesize,'color',[0   0.447  0.741])
    hold on

    plot(0:1/sf:max_eval/sf,nums_weyl,'--','linewidth',linesize+2,'color',[0.85 0.325  0.098])
    box on
    ax=gca; ax.FontSize=axissize; ax.XAxis.Exponent = 0;
    xlabel('$\lambda$','interpreter','latex','fontsize',fontsize)
    ylabel('$N(\lambda)$','interpreter','latex','fontsize',fontsize)
    legend('Computed','Weyl one term$\;\;$','location','northwest','interpreter','latex','fontsize',legendsize)
    axis tight
    yticks([0 200 400 600 800 1000])
    exportgraphics(gcf,[title '.pdf'],'ContentType','vector','BackgroundColor','none')
end