function [zi,w] = getContour(contour,c,r,N)
    %using trapezoid rules/equispaced nodes
    if strcmp(contour,'circle')
        zi=c+r*exp(2*pi*1i*(0:1:(N-1))/N);
        w=2*pi*r*exp(2*pi*1i*(0:1:(N-1))/N)/N;
    elseif strcmp(contour,'ellipse')
        zi=c+r(1)*cos(2*pi*(0:1:(N-1))/N)+1i*r(2)*sin(2*pi*(0:1:(N-1))/N);
        w=2*pi*(r(2)*cos(2*pi*(0:1:(N-1))/N)+1i*r(1)*sin(2*pi*(0:1:(N-1))/N))/N;
    end
end