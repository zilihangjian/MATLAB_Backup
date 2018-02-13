%Function given in textbook to calculate Ex for a line charge given on the
%z axis 
function Ex = linecharge_Ex(zp)
global x0 y0 z0;
global lambda epsilon0;
Ex = lambda/(4*pi*epsilon0) *x0...
    ./ (x0.^2 + y0.^2 +(z0-zp).^2).^1.5;