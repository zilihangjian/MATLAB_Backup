%Function to calculate Ez for a line charge on the z axis
function Ez = linecharge_Ez(zp)
global x0 y0 z0;
global lambda epsilon0;
Ez = lambda/(4*pi*epsilon0) *(z0-zp)...
    ./ (x0.^2 + y0.^2 +(z0-zp).^2).^1.5;
