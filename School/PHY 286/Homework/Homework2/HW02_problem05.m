function [vx1,vy1,vx2,vy2] = HW02_problem05(theta, v0, B, m, deltat, g,...
    altitude,accuracy)
%function [] = HW02_problem05(theta, v0, B, m, deltat, g)
% Inputs - theta in degrees[0,90] for normal results of projectile motion
% - v0 is the initial speed (in m/s) -B - drag coefficient (kg/m)
% - m - mass of object (in kg) - deltat - time step (in s)
% g - gravitational acceleration (m/s^2)- altitude is the target altitude
% (in m), can be positive or negative, - accuracy is the threshold number  
% for finding the targets y postion relative to the path of the shell
% Outputs - vx2 and vy2 are the matrices containing the function with drag
% force, vx3 and vy3 are the matrices containing the function with drag
% force and density approximation
% Description: This function plots the trajectories of a shell with and
% without density approximation and with drag force. It also will show the
% location of a target a specified altitude on the plot

clc; close all;
% Drag Force
vx1(1) = v0.*cosd(theta);
vy1(1) = v0.*sind(theta);
x1(1) = 0;
y1(1) = 0;
targetX1(1) = 0;
targetY1(1) = 0;
targets1 = 0;
count = 2;
while y1(count-1) >= 0 || y1(count-1) >= altitude
    v2 = sqrt(vx1(count-1).^2 + vy1(count-1).^2);
    adx = B.*v2.*vx1(count-1)./m;
    ady = B.*v2.*vy1(count-1)./m + g;
    x1(count) = x1(count-1)+vx1(count-1).*deltat;
    y1(count) = y1(count-1)+vy1(count-1).*deltat;
    vx1(count)= vx1(count-1)-adx.*deltat;
    vy1(count)= vy1(count-1)-ady.*deltat;
    altitudeDifference = abs(y1(count-1) - altitude); 
    if altitudeDifference <= accuracy
        hold on;
        targets1 = targets1 + 1;
        plot(x1(count-1),y1(count-1),'ro');
        targetX1(targets1) = x1(count-1);%Stores x-coordinate of target
        targetY1(targets1) = y1(count-1);%Stores y-coordinate of target
    end
    count = count +1;
end
title('Cannon Shell Trajectory');
plot(x1,y1,'r');

%Drag Force && Density Calculations
vx2(1) = v0.*cosd(theta);
vy2(1) = v0.*sind(theta);
x2(1) = 0;
y2(1) = 0;
targetX2(1) = 0;
targetY2(1) = 0;
targets2 = 0;
%Drag Variables
p(1) = 100;%Random Value for sealevel density 
y0 = 1.0e4;%Approximation for density equation from book
count = 2;
while y2(count-1) >=0 || y2(count-1) >= altitude
    v3 = sqrt(vx2(count-1).^2 + vy2(count-1).^2);
    x2(count) = x2(count-1)+vx2(count-1).*deltat;
    y2(count) = y2(count-1)+vy2(count-1).*deltat;
    p(count) = p(1).*exp(-y2(count-1)/y0);
    adx = (p(count)/p(1)).*B.*v3.*vx2(count-1)./m;
    ady = (p(count)/p(1)).*B.*v3.*vy2(count-1)./m + g;
    vx2(count)= vx2(count-1)-adx.*deltat;
    vy2(count)= vy2(count-1)-ady.*deltat;
     altitudeDifference = abs(y2(count-1) - altitude); 
    if altitudeDifference <= accuracy
        targets2 = targets2 + 1;
        plot(x2(count-1),y2(count-1),'go');
        targetX2(targets2) = x2(count-1);%Stores x-coordinate of target
        targetY2(targets2) = y2(count-1);%Stores y-coordinate of target
    end
    count = count +1;
end

plot(x2,y2,'g');
end