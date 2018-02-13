clear; close all; clc;
N = 1000;%Sampling
%Theta Expressions
theta1 = linspace(0,pi/2,N);
theta2 = linspace(pi/2,pi,N);
%Directivity Expresion (D(theta))
rho1 = 2.*sin(theta1).*cos(theta1);
rho2 = -cos(theta2)/5;

%Plotting
figure()
polar(theta1,rho1,'--r');
hold on%Due to nature of polar, first one must be plotted before hold on can be called
polar(theta2,rho2,'--r');
%Symmetric about the x-axis
polar(-theta1,rho1, '--r');
polar(-theta2,rho2,'--r');