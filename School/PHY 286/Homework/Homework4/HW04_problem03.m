function [y1,z1,a1,y2,z2,a2] = HW04_problem03(sigma, r, b, deltat, tmax)
%function [y1,z1,a1,y2,z2,a2] = HW04_problem03(sigma, r, b, deltat, tmax)
%Inputs:
%sigma: value for the coupled differential equations
%r: value for the coupled differential equations
%b: value for the coupled differential equations
%deltat: time step for the for loop
%tmax: maximum time length for loop
%Outputs:
%Description: This function models the Stokes-Navier Coupled Differential
%Equations and plots the poincare sections of y vs z to show that the
%initial conditions do not impact the result

if nargin == 0
    sigma = 10;
    r = 25;
    b = 8/3;
    deltat = .0001;
    tmax = 150;
end

%Case 1 x=1,y=0,z=0
x1(1) = 1;
y1(1) = 0;
z1(1) = 0;
%Function Declarations for x,y, and z 
Fx = @(xt,yt) sigma.*(yt-xt);
Fy = @(xt,yt,zt) -xt.*zt + r.*xt - yt;
Fz = @(xt,yt,zt) xt.*yt - b.*zt;

for n = 1 : (tmax/deltat)
    k1x = Fx(x1(n),y1(n));
    k2x = Fx(x1(n) + .5*deltat,y1(n)+.5.*deltat.*k1x);
    k3x = Fx(x1(n) + .5*deltat,y1(n)+.5.*deltat.*k2x);
    k4x = Fx(x1(n) + .5*deltat,y1(n)+.5.*deltat.*k3x);
    x1(n+1) = x1(n) + (1/6)*(k1x + 2.*k2x + 2.*k3x + k4x)*deltat; 
    
    k1y = Fy(x1(n),y1(n),z1(n));
    k2y = Fy(x1(n) + .5.*deltat.*k1y, y1(n) + .5.*deltat, z1(n) + ...
        .5.*deltat.*k1y);
    k3y = Fy(x1(n) + .5.*deltat.*k2y,y1(n) + .5.*deltat, z1(n) + ...
        .5.*deltat.*k2y);
    k4y = Fy(x1(n) + .5.*deltat.*k3y,y1(n) + .5.*deltat, z1(n) + ...
        .5.*deltat.*k3y);
    y1(n+1) = y1(n) + (1/6)*(k1y + 2.*k2y + 2.*k3y + k4y)*deltat; 
     
    k1z = Fz(x1(n),y1(n),z1(n));
    k2z = Fz(x1(n) + .5.*deltat.*k1z,y1(n) + .5.*deltat.*k1z,z1(n) + ...
        .5.*deltat);
    k3z = Fz(x1(n) + .5.*deltat.*k2z,y1(n) + .5.*deltat.*k2z, z1(n) + ...
        .5.*deltat);
    k4z = Fz(x1(n) + .5.*deltat.*k3z,y1(n) + .5.*deltat.*k3z, z1(n) + ...
        .5.*deltat);
    z1(n+1) = z1(n) + (1/6)*(k1z + 2.*k2z + 2.*k3z + k4z)*deltat; 
end

a1 = [];
i1 = 1;
for n = 1 : (tmax/deltat)
    if x1(n) > 0 && x1(n+1) < 0 || x1(n) < 0 && x1(n+1) > 0
       x1new = x1(n);
       x2new = x1(n+1);
       m = (x2new-x1new)/deltat;
       if (-x1new/m) - (deltat/2) >= 0 
           a1(i1) = n + 1;
       else
           a1(i1) = n;
       end
       i1 = i1 + 1;
    end
end

fprintf('Number of Points where x is zero: %.0f', length(a1));
figure(1);
plot(y1(a1),z1(a1), '.r');
title('Poincare Sections of y vs z');
xlabel('y'); ylabel('z');

%Case 2 x=0,y=0,z=1
x2(1) = 0;
y2(1) = 0;
z2(1) = 1;

for n = 1 : (tmax/deltat)
    k1x1 = Fx(x2(n),y2(n));
    k2x1 = Fx(x2(n) + .5*deltat,y2(n)+.5.*deltat.*k1x1);
    k3x1 = Fx(x2(n) + .5*deltat,y2(n)+.5.*deltat.*k2x1);
    k4x1 = Fx(x2(n) + .5*deltat,y2(n)+.5.*deltat.*k3x1);
    x2(n+1) = x2(n) + (1/6)*(k1x1 + 2.*k2x1 + 2.*k3x1 + k4x1)*deltat; 
    
    k1y1 = Fy(x2(n),y2(n),z2(n));
    k2y1 = Fy(x2(n) + .5.*deltat.*k1y1, y2(n) + .5.*deltat, z2(n) + ...
        .5.*deltat.*k1y1);
    k3y1 = Fy(x2(n) + .5.*deltat.*k2y1,y2(n) + .5.*deltat, z2(n) + ...
        .5.*deltat.*k2y1);
    k4y1 = Fy(x2(n) + .5.*deltat.*k3y1,y2(n) + .5.*deltat, z2(n) + ...
        .5.*deltat.*k3y1);
    y2(n+1) = y2(n) + (1/6)*(k1y1 + 2.*k2y1 + 2.*k3y1 + k4y1)*deltat; 
     
    k1z1 = Fz(x2(n),y2(n),z2(n));
    k2z1 = Fz(x2(n) + .5.*deltat.*k1z1,y2(n) + .5.*deltat.*k1z1, z2(n) + ...
        .5.*deltat);
    k3z1 = Fz(x2(n) + .5.*deltat.*k2z1,y2(n) + .5.*deltat.*k2z1, z2(n) + ...
        .5.*deltat);
    k4z1 = Fz(x2(n) + .5.*deltat.*k3z1,y2(n) + .5.*deltat.*k3z1, z2(n) + ...
        .5.*deltat);
    z2(n+1) = z2(n) + (1/6)*(k1z1 + 2.*k2z1 + 2.*k3z1 + k4z1)*deltat; 
end

a2 = [];
i2 = 1;
for n = 1 : (tmax/deltat)
    if x2(n) > 0 && x2(n+1) < 0 || x2(n) < 0 && x2(n+1) > 0
       x3new = x2(n);
       x4new = x2(n+1);
       m = (x4new-x3new)/deltat;
       if (-x3new/m) - (deltat/2) >= 0 
           a2(i2) = n + 1;
       else
           a2(i2) = n;
       end
       i2 = i2 + 1;
    end
end

fprintf('\nNumber of Points where x is zero: %.0f\n', length(a2));
figure(2);
plot(y2(a2), z2(a2), '.g');
title('Poincare Sections of y vs z');
xlabel('y'); ylabel('z');
end