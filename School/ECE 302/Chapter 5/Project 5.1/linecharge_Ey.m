%Function to calculate Ey for a line charge on the z axis
function Ey = linecharge_Ey(zp)
global x0 y0 z0;
global lambda epsilon0;
Ey = lambda/(4*pi*epsilon0) *y0...
    ./ (x0.^2 + y0.^2 +(z0-zp).^2).^1.5;
