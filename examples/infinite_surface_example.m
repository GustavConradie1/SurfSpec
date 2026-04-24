clear
% close all

%% Solve -lap(u) + q(x,y,z)*u - zk*u = f on an infinite surface

n = 18; 18;% p refinement
nref = 3;3;% mesh refinement
rect = [-0.5 0.5 -0.5 0.5]*2;

% Potential*cos(30*x).
q = @(x,y,z) exp(-5*(x.^2+y.^2));%cos(30*x).*exp(-50*(x.^2+y.^2));

% Make a perturbed surface from flat
x = @(u,v) u;
y = @(u,v) v;
z = @(u,v) 0.1.*(1-erf(25*(sqrt(u.^2+v.^2)-0.3)));


order = 6;
epsilon = 0.01;
X = (-1:0.1:10);
[BB,AA]=rationalKernel(order,'equi');



% Righthand side
f = @(x,y,z) 1./((x+0.2).^2+(y+0.1).^2+1);%exp(-80*((x+0.2).^2+(y+0.1).^2));
L = surfacebie(n, x, y, z, nref=nref, rect=rect);
g = surfacefun(f,L.dom);
c1 = g'*g;
qq = surfacefun(q,L.dom);

figure
plot(qq)
camlight('left')
colormap(brighten(redblue,0.2))
colorbar('southoutside')
clim([0,1])

exportgraphics(gcf,'bump.pdf','ContentType','image','BackgroundColor','none','Resolution',300)

%%
clear
load('measures_data.mat')

figure
semilogy(X,(abs(mu1)/c1),'linewidth',2)
hold on
semilogy(X,abs(mu2)/c2,'linewidth',2)
semilogy(X,abs(mu3)/c3,'linewidth',2)
semilogy(X,abs(mu4)/c4,'linewidth',2)
xlim([X(1),10])
ylim([10^(-5),20])

xlabel('$\lambda$','interpreter','latex','fontsize',18)
title('$\mu_f^{0.01}(\lambda)$','interpreter','latex','fontsize',18)

legend({'$\alpha=1$','$$\alpha=2$','$$\alpha=3$','$$\alpha=4$'},'interpreter','latex','fontsize',14,'location','northeast')
ax=gca; ax.FontSize=18;

exportgraphics(gcf,'bump_meas.pdf','ContentType','vector','BackgroundColor','none')



return
%%
figure
plot(g)
camlight('left')
clim([0,1])
colormap(brighten(redblue,0.2))
colorbar('southoutside')

mu1=zeros(length(X),1);
pf = parfor_progress(length(X));
pfcleanup = onCleanup(@() delete(pf));
for jj=1:length(X)
    for ii=1:order
        Z = X(jj)+BB(ii)*epsilon;
        L = surfacebie(n, x, y, z, nref=nref, rect=rect, q=q, zk=Z);
        u = L.solve(f);
        mu1(jj)=mu1(jj)+imag(AA(ii)*(g'*u.int))/pi;
    end
    parfor_progress(pf);
end

% Righthand side
f = @(x,y,z) 1./(30*(x+0.2).^2+30*(y+0.1).^2+1).^2;%exp(-80*((x+0.2).^2+(y+0.1).^2));
L = surfacebie(n, x, y, z, nref=nref, rect=rect);
g = surfacefun(f,L.dom);
c2 = g'*g;
qq = surfacefun(q,L.dom);

mu2=zeros(length(X),1);
pf = parfor_progress(length(X));
pfcleanup = onCleanup(@() delete(pf));
for jj=1:length(X)
    for ii=1:order
        Z = X(jj)+BB(ii)*epsilon;
        L = surfacebie(n, x, y, z, nref=nref, rect=rect, q=q, zk=Z);
        u = L.solve(f);
        mu2(jj)=mu2(jj)+imag(AA(ii)*(g'*u.int))/pi;
    end
    parfor_progress(pf);
end


% Righthand side
f = @(x,y,z) 1./(30*(x+0.2).^2+30*(y+0.1).^2+1).^3;%exp(-80*((x+0.2).^2+(y+0.1).^2));
L = surfacebie(n, x, y, z, nref=nref, rect=rect);
g = surfacefun(f,L.dom);
c3 = g'*g;
qq = surfacefun(q,L.dom);

mu3=zeros(length(X),1);
pf = parfor_progress(length(X));
pfcleanup = onCleanup(@() delete(pf));
for jj=1:length(X)
    for ii=1:order
        Z = X(jj)+BB(ii)*epsilon;
        L = surfacebie(n, x, y, z, nref=nref, rect=rect, q=q, zk=Z);
        u = L.solve(f);
        mu3(jj)=mu3(jj)+imag(AA(ii)*(g'*u.int))/pi;
    end
    parfor_progress(pf);
end


% % Righthand side
% f = @(x,y,z) 1./((x+0.2).^2+(y+0.1).^2+1).^4;%exp(-80*((x+0.2).^2+(y+0.1).^2));
% L = surfacebie(n, x, y, z, nref=nref, rect=rect);
% g = surfacefun(f,L.dom);
% c4 = g'*g;
% qq = surfacefun(q,L.dom);
% 
% mu4=zeros(length(X),1);
% pf = parfor_progress(length(X));
% pfcleanup = onCleanup(@() delete(pf));
% for jj=1:length(X)
%     for ii=1:order
%         Z = X(jj)+BB(ii)*epsilon;
%         L = surfacebie(n, x, y, z, nref=nref, rect=rect, q=q, zk=Z);
%         u = L.solve(f);
%         mu4(jj)=mu4(jj)+imag(AA(ii)*(g'*u.int))/pi;
%     end
%     parfor_progress(pf);
% end





%%
figure
semilogy(X,smooth(abs(mu1)/c1))
hold on
semilogy(X,abs(mu2)/c2)
semilogy(X,abs(mu3)/c3)
% semilogy(X,abs(mu4)/c4)
xlim([X(1),X(end)])


return
L = surfacebie(n, x, y, z, nref=nref, rect=rect, q=q, zk=zk);
u = L.solve(f);

% g = @(x,y,z) exp(x+y);
% g = surfacefun(g,L.dom);
% 
% g'*u.int



%% Plot

% Evaluate in the exterior
m = 100;
padx = 0.2*diff(rect(1:2));
pady = 0.2*diff(rect(3:4));
[xx, yy] = meshgrid(linspace(rect(1)-padx, rect(2)+padx, m), ...
                    linspace(rect(3)-pady, rect(4)+pady, m));
ii = xx < rect(1) | xx > rect(2) | yy < rect(3) | yy > rect(4);
vv = nan(m);
vv(ii) = u.ext(xx(ii),yy(ii));

clf

% subplot(131)
plot(surfacefun(q, L.op.domain))
axis(rect + [-padx padx -pady pady])
camlight
colormap turbo
return
colorbar

subplot(132)
plot(surfacefun(f, L.op.domain))
axis(rect + [-padx padx -pady pady])
camlight
colorbar

subplot(133)
plot(real(u.int)), hold on
pcolor(xx, yy, real(vv)), hold off
view(3)
shading interp
colormap turbo
camlight
colorbar

shg
