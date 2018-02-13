function [dtheta,time] = ThetaDifference(theta1,theta2, omega0, deltat, tmax, dForce, dFreq, qdamp)
clc; close all;
% function [theta, omega] = EC_nonlin_driven_pendulum(theta0, omega0, deltat, tmax, dForce, dFreq)
%

g = 9.8;
L = 9.8;%
%qdamp = 0.5;

thetaPrev1 = theta1; 
thetaPrev2 = theta2;
omegaPrev = omega0;
time = [0:deltat:tmax];
theta1 = zeros(size(time));
theta2 = zeros(size(time));
omega = zeros(size(time));
count = 1;
for t = time
    omegaNew1 = omegaPrev - ((g./L).*sin(thetaPrev1) + qdamp.*omegaPrev - dForce.*sin(dFreq.*t)).*deltat; 
    thetaNew1 = thetaPrev1 + omegaNew1.*deltat;
    omegaNew2 = omegaPrev - ((g./L).*sin(thetaPrev2) + qdamp.*omegaPrev - dForce.*sin(dFreq.*t)).*deltat; 
    thetaNew2 = thetaPrev2 + omegaNew2.*deltat;
    if thetaNew1 > pi 
        thetaNew1 = thetaNew1 - 2*pi;
    elseif thetaNew1 < -pi
        thetaNew1 = thetaNew1 + 2*pi;
    elseif thetaNew2 > pi 
        thetaNew2 = thetaNew2 - 2*pi;
    elseif thetaNew2 < -pi
        thetaNew2 = thetaNew2 + 2*pi;
    end
    dtheta(count) = abs(thetaNew1 - thetaNew2);
    theta1(count) = thetaPrev1;
    theta2(count) = thetaPrev2;
    omega(count) = omegaPrev;
    count = count+1;
    omegaPrev1 = omegaNew1;
    thetaPrev1 = thetaNew1;
end

str = sprintf('Fd = %0.3f, drive-w = %0.3f, qdamp = %0.3f', dForce, dFreq, qdamp);
figure(); semilogy(time, dtheta,'--k');
ylabel('\theta(t) [rad]');
xlabel('Time, t [s]');
title(str);

end

