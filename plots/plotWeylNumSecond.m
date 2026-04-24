function [] = plotWeylNumSecond(surf,D,perim,title)
    %compare number of eigenvalues less than given value to first two terms
    %of Weyl asymptotics (note second term only makes a contribution for
    %open surfaces)
    %for cap perim is 2*pi
    %for saddle perim is 4*sqrt(5)+2*asinh(2)
    %for mobius strip is 6.50337723307304
    fontsize=48;
    axissize=36;
    legendsize=36;
    linesize=10;
    max_eval=ceil(max(D));
    nums_weyl_first=pi*surfacearea(surf)*(0:1:max_eval)/(2*pi)^2;
    nums_weyl_second=pi*surfacearea(surf)*(0:1:max_eval)/(2*pi)^2-(1/4)*2*perim*sqrt(0:1:max_eval)/(2*pi);
    nums_eval=zeros(max_eval+1,1);
    for i=0:max_eval
        nums_eval(i+1)=length(find(D<=i));
    end
    figure
        plot(0:1:max_eval,nums_eval,'linewidth',linesize,'color',[0   0.447 0.741])
    hold on
    box on
    plot(0:1:max_eval,nums_weyl_first,'--','linewidth',linesize+2,'color',[0.85  0.325 0.098])
    ax=gca; ax.FontSize=axissize; ax.XAxis.Exponent = 0;
    plot(0:1:max_eval,nums_weyl_second,'--','linewidth',linesize+2,'color',[0.929  0.694  0.125])
    xlabel('$\lambda$','interpreter','latex','fontsize',fontsize)
    ylabel('$N(\lambda)$','interpreter','latex','fontsize',fontsize)
    legend('Computed','Weyl one term$\;\;$','Weyl two terms$\;\;$','location','northwest','interpreter','latex','fontsize',legendsize)
    yticks([0 200 400 600 800 1000])
    axis tight
    exportgraphics(gcf,[title '.pdf'],'ContentType','vector','BackgroundColor','none')
end