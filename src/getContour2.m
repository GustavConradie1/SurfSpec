function [zi,w] = getContour2(contour,c,r,N)
    %same as getContour but here we assume that we have
    %symmetry allowing us to use only the upper half plane
    if strcmp(contour,'circle')
        zi=c+r*exp(pi*1i*(0.5:1:(N-0.5))/N);
        w=pi*r*exp(pi*1i*(0.5:1:(N-0.5))/N)/N;
    elseif strcmp(contour,'ellipse')
        zi=c+r(1)*cos(pi*(0.5:1:(N-0.5))/N)+1i*r(2)*sin(pi*(0:1:(N-1))/N);
        w=pi*(r(2)*cos(pi*(0.5:1:(N-0.5))/N)+1i*r(1)*sin(pi*(0:1:(N-1))/N))/N;
    end
end