function [poincare_theta, poincare_omega] = EC_perturbation_plots(theta0, omega0, deltat, tmax, dForces, dFreq, qdamp)

% function [theta, omega] = EC_nonlin_driven_pendulum(theta0, omega0, deltat, tmax, dForce, dFreq)
%

time = [0:deltat:tmax];
offset = 1/100;
close all % close all figures

for n=1:length(dForces)

	q1 = EC_nonlin_driven_pendulum(theta0, omega0, deltat, tmax, dForces(n), dFreq, qdamp);
	q2 = EC_nonlin_driven_pendulum(theta0+offset, omega0, deltat, tmax, dForces(n), dFreq, qdamp);

	subplot(length(dForces), 1, n); %select the nth subplot and plot
	str = sprintf('Fd = %0.3f, drive-w = %0.3f, qdamp = %0.3f', dForces(n), dFreq, qdamp);
	set(gca, 'Fontsize', 16);
	semilogy(time, abs(q1-q2), '-k'); 
	xlabel('Time, t [s]');
	ylabel('|\theta_1(t) - \theta_2(t)| [rad]');
	ylim([0 2*pi]);
	title(str);
end

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
