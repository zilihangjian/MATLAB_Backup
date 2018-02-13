function [] = HW03_problem02(deltat, tmax, theta0,omega0)
%function [] = HW03_problem02(deltat, tmax, theta0,omega0)
%Inputs
%deltat - time step for the Euler Cromer method
%tmax - maximum time value to be calculated
%theta0 - initial theta value in degrees
%omega0 - initial angular velocity 
%Output - Null
%Description: This problem calculates and shows the amplitude vs time
%period of a harmonic and anharmonic pendulum using the Euler Cromer method
%Normal call for function HW03_problem02(.01,100,.2,0)

close all; clc;
%Variable Declaration
alpha1 = 1; alpha2 = 3; k = 1;

%Part 1: alpha = 1, k = 1
[theta1,p1_1] = pendulumPeriod(deltat,tmax,theta0,omega0,alpha1,k);
[theta2,p1_2] = pendulumPeriod(deltat,tmax,.7,omega0,alpha1,k);
[theta3,p1_3] = pendulumPeriod(deltat,tmax,1,omega0,alpha1,k);

if p1_1 == p1_2 && p1_2 == p1_3
    figure(1);
    period1 = p1_1*ones(size(theta1));
    plot(theta1,period1,'k');
    title('Amplitude vs Time Period');
    xlabel('Theta [Degrees]');
    ylabel('Time Period [s]');
end
    
%alpha = 3;
hold on; figure();

[theta2_1,p2_1] = pendulumPeriod(deltat,tmax,theta0,omega0,alpha2, .2);
[theta2_2,p2_2] = pendulumPeriod(deltat,tmax,theta0,omega0,alpha2, .3);
[theta2_3,p2_3] = pendulumPeriod(deltat,tmax,theta0,omega0,alpha2, .4);
[theta2_4,p2_4] = pendulumPeriod(deltat,tmax,theta0,omega0,alpha2, .5);
[theta2_5,p2_5] = pendulumPeriod(deltat,tmax,theta0,omega0,alpha2, .6);
[theta2_6,p2_6] = pendulumPeriod(deltat,tmax,theta0,omega0,alpha2, .7);
[theta2_7,p2_7] = pendulumPeriod(deltat,tmax,theta0,omega0,alpha2, .8);
[theta2_8,p2_8] = pendulumPeriod(deltat,tmax,theta0,omega0,alpha2, .9);
[theta2_9,p2_9] = pendulumPeriod(deltat,tmax,theta0,omega0,alpha2, 1);

figure(2); hold on; title('Amplitude vs Time Period'); 
xlabel('Theta [Degrees]'); ylabel('Time Period [s]');

period2_1 = p2_1*ones(size(theta2_1)); plot(theta2_1,period2_1,'k');
period2_2 = p2_2*ones(size(theta2_2)); plot(theta2_2,period2_2,'k');
period2_3 = p2_3*ones(size(theta2_3)); plot(theta2_3,period2_3,'k');
period2_4 = p2_4*ones(size(theta2_4)); plot(theta2_4,period2_4,'k');
period2_5 = p2_5*ones(size(theta2_5)); plot(theta2_5,period2_5,'k');
period2_6 = p2_6*ones(size(theta2_6)); plot(theta2_6,period2_6,'k');
period2_7 = p2_7*ones(size(theta2_7)); plot(theta2_7,period2_7,'k');
period2_8 = p2_8*ones(size(theta2_8)); plot(theta2_8,period2_8,'k');
period2_9 = p2_9*ones(size(theta2_9)); plot(theta2_9,period2_9,'k');

end

function [theta,period] = pendulumPeriod(deltat,tmax,theta0,...
    omega0,alpha,k)
%function [theta,period] = pendulumGenerator(deltat,tmax,theta0,...
%    omega0,alpha,k)
%Inputs
%deltat - Time Step for Euler Cromer method
%tmax - Maximum value for loop
%theta0 - Initial Theta value in degrees
%omega0 - Initial Angular Velocity 
%alpha -  exponent value for general harmonic equation
%k - coefficient in general harmonic equation
%Outputs
%theta - vector containing all the theta displacement values for the
%pendulum 
%period - the period for the oscillator based off the general equation
%Description: This function generates the theta and omega values for a
%general oscillator using a Euler Cromer method of approximation

theta = zeros(tmax/deltat);
omega = zeros(tmax/deltat);
t = zeros(tmax/deltat);
theta(1) = theta0;
omega(1) = omega0;
t(1) = 0;
index = 1;
while t(index) <= tmax
    omega(index+1) = omega(index) - (k.*(theta(index).^alpha)).*deltat;
    theta(index+1) = theta(index) + omega(index+1).*deltat;
    t(index+1) = t(index) + deltat;
    index = index + 1;
end
maxinds = find(theta >= theta0);
period = t(maxinds(2)) - t(maxinds(1));

end