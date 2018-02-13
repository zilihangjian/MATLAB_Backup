function [maxTheta, maxRange] = HW03_problem01a(v0, deltat)
%function [maxTheta, maxRange] = HW03_problem01(v0, deltat)
%Inputs:
%v0 - Initial Velocity for baseball, in this problem will be set at 110 mph
%(49 m/s)
%deltat - time step for approximation with Euler formula
%Outputs: 
%maxTheta - the angle for the maximum range in degrees
%maxRange - the maximum range for the baseball in meters
%Description: This program calculates the maximum range and the theta that
%yields that maximum range. It plots all subsequent graphs on one plot to
%show the overall range of the ball


clc; close all;
maxRange = 0;
g = 9.8;
v0 = v0/2.23694;%Converts to metric
for theta=0:1:90
    vx(1) = v0.*cosd(theta);
    vy(1) = v0.*sind(theta);
    x(1) = 0;
    y(1) = 0;
    count = 2;
    while y(count-1) >= 0
        v = sqrt(vx(count-1).^2 + vy(count-1).^2);
        C = .0039 + (.0058)/(1 + exp((v - 35)/5));
        %Position
        x(count) = x(count-1)+vx(count-1).*deltat;
        y(count) = y(count-1)+vy(count-1).*deltat;
        %Velocity
        vx(count)= vx(count-1) - (C.*v.*vx(count-1)).*deltat;
        vy(count)= vy(count-1) - (C.*(v.*vy(count-1))).*deltat - g.*deltat;
        count = count + 1;
    end
    figure(1);
    hold on;
    plot(x,y,'r');
    title('Baseball Trajectory');
    xlabel('x [m]');
    ylabel('y [m]');
    if max(x) > maxRange
        maxRange = x(end);
        maxTheta = theta;
    end
end
fprintf('Theta for Maximum Range: %2.0f',maxTheta);
end