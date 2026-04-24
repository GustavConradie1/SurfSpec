function map = disco(m)
%DISCO   Disco colormap.
%   DISCO(M) returns an M-by-3 matrix containing a disco colormap designed
%   by Chris Rycroft.
%
%   See also COLORMAP.

if nargin < 1
    f = get(groot,'CurrentFigure');
    if isempty(f)
        m = size(get(groot,'DefaultFigureColormap'),1);
    else
        m = size(f.Colormap,1);
    end
end

values = [255, 20,  40;
          255, 47   146;
          255, 138, 216;
          55,  145, 230;
          150, 230, 80;
          255, 251, 0;
          255, 255, 255] / 255;

P = size(values,1);
map = interp1(1:P, values, linspace(1,P,m), 'linear');

end
