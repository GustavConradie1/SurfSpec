function [] = plotWeylNumErrorFirst(surf,D,sf,title,tics)
    %compare number of eigenvalues less than given value to Weyl
    %asymptotics (first term only)
    %D is sorted array of first N eigenvalues of Laplace-Beltrami on surface
    %sf gives a scale factor for eigenvalues so it samples the number less
    %than 1/sf, 2/sf, ..., max_eval/sf
    fontsize=48;
    axissize=36;
        legendsize=36;
    linesize=6;
    D=D*sf;
    max_eval=ceil(max(D));
    nums_weyl=pi*surfacearea(surf)*(0:1/sf:max_eval/sf)/(2*pi)^2;
    nums_eval=zeros(max_eval+1,1);
    for i=0:max_eval
        nums_eval(i+1)=length(find(D<=i));
    end
    figure
    box on
    loglog(0:1/sf:max_eval/sf,(abs(nums_eval(:)./nums_weyl(:)-1)),'linewidth',linesize,'color',[0.85  0.325  0.098])
    ax=gca; ax.FontSize=axissize;
    xlabel('$\lambda$','interpreter','latex','FontSize',fontsize)
    ylabel('$|N(\lambda)/N^{w}(\lambda)-1|$','Interpreter','latex','Fontsize',fontsize)
    legend('Weyl one term$\;\;$','Computed','location','southwest','interpreter','latex','fontsize',legendsize)
    axis tight
    yticks(tics)
     ax.XAxis.Exponent = 0; xtickformat('%.0f');
    exportgraphics(gcf,[title '.pdf'],'ContentType','vector','BackgroundColor','none')
end