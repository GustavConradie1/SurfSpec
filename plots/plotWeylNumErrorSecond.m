function [] = plotWeylNumErrorSecond(surf,D,perim,title,tics)
    %compare number of eigenvalues less than given value to first two terms
    %of Weyl asymptotics (note second term only makes a contribution for
    %open surfaces)
    %for cap perim is 2*pi
    %for saddle perim is 4*sqrt(5)+2*asinh(2)
    %for mobius strip is 6.50337723307304
    fontsize=48;
    axissize=36;
        legendsize=36;
    linesize=6;
    max_eval=ceil(max(D));
    nums_weyl_first=pi*surfacearea(surf)*(0:1:max_eval)/(2*pi)^2;
    nums_weyl_second=pi*surfacearea(surf)*(0:1:max_eval)/(2*pi)^2-(1/4)*2*perim*sqrt(0:1:max_eval)/(2*pi);
    nums_eval=zeros(max_eval+1,1);
    for i=0:max_eval
        nums_eval(i+1)=length(find(D<=i));
    end
    figure
    box on
    loglog(0:1:max_eval,(abs(nums_eval(:)./nums_weyl_first(:)-1)),'linewidth',linesize,'color',[0.85  0.325  0.098])
    hold on
    ax=gca; ax.FontSize=axissize; ax.XAxis.Exponent = 0; xtickformat('%.0f');
    loglog(0:1:max_eval,(abs(nums_eval(:)./nums_weyl_second(:)-1)),'linewidth',linesize,'color',[0.929  0.694  0.125])
    xlabel('$\lambda$','interpreter','latex','fontsize',fontsize)
    ylabel('$|N^w(\lambda)/N^c(\lambda)-1|$','Interpreter','latex','fontsize',fontsize)
    legend('Weyl one term$\;\;$','Weyl two terms$\;\;$','Computed','location','southwest','interpreter','latex','fontsize',legendsize)
    %axis([0 max_eval min(abs(nums_eval(:)./nums_weyl_second(:)-1)) 1])
    axis tight
    yticks(tics)
    
    exportgraphics(gcf,[title '.pdf'],'ContentType','vector','BackgroundColor','none')
end