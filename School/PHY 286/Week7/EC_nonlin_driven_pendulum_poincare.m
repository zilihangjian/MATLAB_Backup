function [poincare_theta, poincare_omega] = EC_nonlin_driven_pendulum_poincare(theta0, omega0, deltat, tmax, dForce, dFreq, qdamp, timefactor)

% function [theta, omega] = EC_nonlin_driven_pendulum(theta0, omega0, deltat, tmax, dForce, dFreq)
%

[theta, omega] = EC_nonlin_driven_pendulum(theta0, omega0, deltat, tmax, dForce, dFreq, qdamp);

time = [0:deltat:tmax];
nmax = floor(tmax.*dFreq./timefactor);
for n1=1:nmax
	tindex = find((time > (timefactor*n1/dFreq - deltat/2)) & (time < (timefactor*n1/dFreq + deltat/2)));
	%keyboard
	poincare_theta(n1) = theta(tindex);
	poincare_omega(n1) = omega(tindex);
end

str = sprintf('Poincare section for timefactor = %0.3f, Fd = %0.3f, drive-w = %0.3f', timefactor, dForce, dFreq );
plot(poincare_theta, poincare_omega, '.k');
xlabel('\theta [rad]');
ylabel('\omega, [rad/s]');
title(str);

% ======================== EC_nonlin_driven_pendulum is a subfunction ==============

function [theta, omega] = EC_nonlin_driven_pendulum(theta0, omega0, deltat, tmax, dForce, dFreq, qdamp)

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
    theta(count) = theta_new;
    omega(count) = omega_new;
    count = count+1;
    omega_old = omega_new;
    theta_old = theta_new;
end
