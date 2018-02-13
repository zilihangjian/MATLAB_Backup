function [range, x, y, vx, vy] = twoD_projectile(theta, v0, B, m, deltat, g)
%
% function [x, y] = twoD_projectile(theta, v0, B, m, deltat, g)
% calculates the 2D-trajectory x(t) and y(t) for a projectile launched at
% an angle theta to the horizontal using Eulers method for IVPs
% borrowed from Chapter 2, Giordano & Nakanishi, Computational Physics, 2nd
% Ed.
% theta must be in radians (and usually between 0 and pi/2)
% v0 is the initial speed (in m/s)
% B - drag coefficient (kg/m)
% m - mass of object (in kg)
% deltat - time step (in s)
% g - gravitational acceleration (m/s^2)

vx(1) = v0.*cos(theta);
vy(1) = v0.*sin(theta);
t(1) = 0;
x(1) = 0;
y(1) = 0;
count = 2;
while(y(count-1) >=0)
    v = sqrt(vx(count-1).^2 + vy(count-1).^2);
    adx = B.*v.*vx(count-1)./m;
    ady = B.*v.*vy(count-1)./m + g;
    x(count) = x(count-1)+vx(count-1).*deltat;
    y(count) = y(count-1)+vy(count-1).*deltat;
%     keyboard
    vx(count)= vx(count-1)-adx.*deltat;
    vy(count)= vy(count-1)-ady.*deltat;
    count = count +1;
end

rho = -y(count-2)./y(count-1);
range = (x(count-2) + rho.*x(count-1))./(rho +1);
