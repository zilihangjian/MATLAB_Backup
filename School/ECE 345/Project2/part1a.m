function [] = part1a()
% function [] = part1a()
clc; close all;

%Normalized Approximations for the PDFS via CLT
M2approx = @(y)(2*sqrt(3/pi)*exp((-(y-0.5).^2)/(1/12)));
M4approx = @(y)(2*sqrt(6/pi)*exp((-(y-0.5).^2)/(1/24)));
M25approx = @(y)(5*sqrt(6/pi)*exp((-(y-0.5).^2)/(1/150)));
M100approx = @(y)(10*sqrt(6/pi)*exp((-(y-0.5).^2)/(1/600)));

figure();
hold on
fplot(M2approx, [0,1]);
fplot(M4approx, [0,1]);
legend('n=2', 'n=4');
xlabel('Distribution Values');
ylabel('Concentrations');
title('PDF Approximations for n = 2,4');

figure();
hold on;
fplot(M25approx, [0,1]);
fplot(M100approx, [0,1]);
xlabel('Distribution Values');
ylabel('Concentrations');
title('PDF Approximations for n = 25,100');
legend('n=25', 'n=100');

figure();
hold on;
fplot(M2approx, [0,1]);
fplot(M4approx, [0,1]);
fplot(M25approx, [0,1]);
fplot(M100approx, [0,1]);
legend('n=2', 'n=4','n=25', 'n=100');
xlabel('Distribution Values');
ylabel('Concentrations');
title('PDF Approximations for n = 2,4,25,100');
end