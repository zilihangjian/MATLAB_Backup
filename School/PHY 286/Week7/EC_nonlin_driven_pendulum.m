function [theta, omega] = EC_nonlin_driven_pendulum(theta0, omega0, deltat, tmax, dForce, dFreq, qdamp)
clc; 
% function [theta, omega] = EC_nonlin_driven_pendulum(theta0, omega0, deltat, tmax, dForce, dFreq)
%

g = 9.8;
L = 9.8;%
%qdamp = 0.5;

theta_old = theta0; 
omega_old = omega0;
time = [0:deltat:tmax];
theta = zeros(size(time));
omega = zeros(size(time));
%theta(1) = theta0;
%omega(1) = omega0;
count=1;
for t = time
    omega_new = omega_old - ((g./L).*sin(theta_old) + qdamp.*omega_old - dForce.*sin(dFreq.*t)).*deltat; 
    theta_new = theta_old + omega_new.*deltat;
    if theta_new > pi
        theta_new = theta_new - 2*pi;
    elseif theta_new < -pi
        theta_new = theta_new + 2*pi;
    end
    theta(count) = theta_old;
    omega(count) = omega_old;
    count = count+1;
    omega_old = omega_new;
    theta_old = theta_new;
end

str = sprintf('Fd = %0.3f, drive-w = %0.3f, qdamp = %0.3f', dForce, dFreq, qdamp);
figure(); plot(time, theta,'--k');
ylabel('\theta(t) [rad]');
xlabel('Time, t [s]');
title(str);

% figure(); plot(theta,omega);
end
