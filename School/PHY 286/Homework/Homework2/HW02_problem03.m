function [] = HW02_problem03()
% Inputs - No inputs, the function handles everything already for this
% specific problem
% Outputs - No outputs for the function, the 12 plots displayed will be
% contained within the function
% Description - The Lotka-Volterra predator prey model is described by 
% the coupled differential equations and can be written as
% x' = \alpha*x\ - \Beta*x*y\ and y' = \delta*x*y\ - \Gamma*y\
% x(0) is set to 490 and y(0) is set to 10. The x equation represents the
% prey and the y equation represents the predators. The function uses the
% time length t = 100 and solves for four different deltat values. Those
% values are [1,.5,.1,.01]. The function solves the equations and for each
% set of deltat, it plots the x vs t, y vs t, the phase plot of y vs x
clc; close all;
%Variable Declarations
t = 100;
alpha = .2;
beta = .025;
delta = .1;
gamma = .02;
dt1 = 1;
dt2 = .5;
dt3 = .1;
dt4 = .01;
N1 = ceil(t/dt1);
N2 = ceil(t/dt2);
N3 = ceil(t/dt3);
N4 = ceil(t/dt4);
N = [N1 N2 N3 N4];
xP1 = zeros(1,N(1)); xP1(1) = 490;
yP1 = zeros(1,N(1)); yP1(1) = 10;
xP2 = zeros(1,N(2)); xP2(1) = 490;
yP2 = zeros(1,N(2)); yP2(1) = 10;
xP3 = zeros(1,N(3)); xP3(1) = 490;
yP3 = zeros(1,N(3)); yP3(1) = 10;
xP4 = zeros(1,N(4)); xP4(1) = 490;
yP4 = zeros(1,N(4)); yP4(1) = 10;
t1 = [0:N(1)]*dt1;
t2 = [0:N(2)]*dt2;
t3 = [0:N(3)]*dt3;
t4 = [0:N(4)]*dt4;

%Numerical Soltion for the populations
for i = 1:N(1)
    xP1(i+1) = xP1(i) + (xP1(i).*(alpha - beta.*yP1(i))).*dt1;
    yP1(i+1) = yP1(i) + ((yP1(i).*(delta.*xP1(i)-gamma))).*dt1;
end
for i = 1:N(2)
    xP2(i+1) = xP2(i) + (xP2(i).*(alpha - beta.*yP2(i))).*dt2;
    yP2(i+1) = yP2(i) + ((yP2(i).*(delta.*xP2(i)-gamma))).*dt2;
end
for i = 1:N(3)
    xP3(i+1) = xP3(i) + (xP3(i).*(alpha - beta.*yP3(i))).*dt3;
    yP3(i+1) = yP3(i) + ((yP3(i).*(delta.*xP3(i)-gamma))).*dt3;
end
for i = 1:N(4)
    xP4(i+1) = xP4(i) + (xP4(i).*(alpha - beta.*yP4(i))).*dt4;
    yP4(i+1) = yP4(i) + ((yP4(i).*(delta.*xP4(i)-gamma))).*dt4;
end
%Plotting
figure(1); plot(xP1,yP1), title('x1 vs y1');
figure(2); plot(t1,xP1), title('x1 vs t1');
figure(3); plot(t1,yP1), title('y1 vs t1');

figure(4); plot(xP2,yP2), title('x2 vs y2');
figure(5); plot(t2,xP2), title('x2 vs t2');
figure(6); plot(t2,yP2), title('y2 vs t2');

figure(7); plot(xP3,yP3), title('x3 vs y3');
figure(8); plot(t3,xP3), title('x3 vs t3');
figure(9); plot(t3,yP3), title('y3 vs t3');

figure(10); plot(xP4,yP4), title('x4 vs y4');
figure(11); plot(t4,xP4), title('x4 vs t4');
figure(12); plot(t4,yP4), title('y4 vs t4');
end