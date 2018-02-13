function [range1,range2] = HW03_problem01b(v1,v2,deltat)
%function [range1,range2] = HW03_problem01b(v1,v2,deltat)
%Inputs 
% - v1: in mph of the first ball checked. For this problem 100 mph
% - v2: in mph of the second ball checked. For this problem 120 mph
% - deltat: time step for the Euler Cromer method
%Outputs
% - range1: the maximum range for each theta value, starting with theta =
% 0 to theta = 90
% - range2: the maximum range for each theta value, starting with theta = 0
% to theta = 90
%Description: This program will take two input velocities and plot the
%maximum range vs theta for both to compare how far both balls will go
%depending on the theta value. The subfunction called will then rely on
%this technique to solve a specific pr+oblem related to the green monster 

clc; close all;
v1 = v1/2.23694;
v2 = v2/2.23694;
figure(1);
range1 = rangeCalculation(v1,deltat);
range2 = rangeCalculation(v2,deltat);
theta = 0:1:90;
hold on;
plot(theta,range1,'r');
title('Maximum Range vs Theta');
xlabel('theta [Degrees]');
ylabel('range [m]');
plot(theta,range2,'b');
%Green Monster Calculations
hold off;
[xM,yM] = greenMonster(120,38,.01);
figure(2);
hold on;
title('Green Monster Trajectory');
plot(xM,yM,'g');    
plot(96.012,11.33,'rx');
xlabel('x [m]');
ylabel('y [m]');

end

function [range] = rangeCalculation(v0,deltat)
%Inputs
% v0 - input velocity of the ball, already converted to metric
% deltat -  time step for Euler Cromer
%Output
% range - returns a vector for maximum range vs theta
%Description: Will calculate the maximum range at that theta and store the
%value in the range vector, which will be returned after each theta has
%been tested
g = 9.8;
range = zeros(1,90);
rangeCount = 1;
for theta=0:1:90
    vx1(1) = v0.*cosd(theta);
    vy1(1) = v0.*sind(theta);
    x1(1) = 0;
    y1(1) = 0;
    count = 2;
    while y1(count-1) >= 0
        v = sqrt(vx1(count-1).^2 + vy1(count-1).^2);
        C = .0039 + (.0058)/(1 + exp((v - 35)/5));
        %Position
        x1(count) = x1(count-1)+vx1(count-1).*deltat;
        y1(count) = y1(count-1)+vy1(count-1).*deltat;
        %Velocity
        vx1(count)= vx1(count-1) - (C.*v.*vx1(count-1)).*deltat;
        vy1(count)= vy1(count-1) - (C.*(v.*vy1(count-1))).*deltat - g.*deltat;
        count = count + 1;
    end
    range(rangeCount) = x1(end);
    rangeCount = rangeCount + 1;
end

end

function [x,y] = greenMonster(v0,theta0,deltat)
%Input 
%v0 - ball velocity in mph
%theta0 - initial angle in degrees
%deltat - time step 
% Output 
% x - a vector that represents the x values of the trajectory
% y - a vector that represents the y values of the trajectory
% Description
% Uses the initial velocity and theta to determine the trajectory of the ball.
% This specific case is associated with the Green Monster at Fenway Park
g = 9.8;
v0 = v0/2.23694;
vx(1) = v0.*cosd(theta0);
vy(1) = v0.*sind(theta0);
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
end