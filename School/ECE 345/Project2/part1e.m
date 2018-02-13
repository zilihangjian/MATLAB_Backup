function [] = part1e()
% function [] = part1e()
%CDF Experimental
[pValues1, ~, sum1] = part1c(1e6,2,0,1);
[pValues4, ~, sum4] = part1c(1e6,100,0,1);
clc; close all
%CDF Approximation
syms y 
M2approx = (2*sqrt(3/pi)*exp((-(y-0.5).^2)/(1/12)));
M100approx = (10*sqrt(6/pi)*exp((-(y-0.5).^2)/(1/600)));
M2cdf = int(M2approx) +.50;
M100cdf = int(M100approx) + .50;

%Plotting
figure();
hold on;
ezplot(M2cdf);
plot(sum1, pValues1);
title('CDF Overlay for n = 2');
legend('Approximation','Experimental') 
xlabel('Distribution Values');
ylabel('Probability');

figure();
hold on;
ezplot(M100cdf);
plot(sum4, pValues4);
title('CDF Overlay for n = 100')
legend('Approximation','Experimental') 
xlabel('Distribution Values');
ylabel('Probability');

figure();
hold on;
plot(sum1, pValues1);
plot(sum4, pValues4);
title('CDF Overlay for n = 2,100')
legend('n = 2','n = 100') 
xlabel('Distribution Values');
ylabel('Probability');


end