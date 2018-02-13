function [] = part1d()
%function [] = part1d()
[~, normVector1, ~] = part1c(1e6,2,0,1);
[~, normVector2] = part1c(1e6,4,0,1);
[~, normVector3] = part1c(1e6,25,0,1);
[~, normVector4, ~] = part1c(1e6,100,0,1);
[convolN2,convolN4] = part1b();
M2approx = @(y)(2*sqrt(3/pi)*exp((-(y-0.5).^2)/(1/12)));
M4approx = @(y)(2*sqrt(6/pi)*exp((-(y-0.5).^2)/(1/24)));
M25approx = @(y)(5*sqrt(6/pi)*exp((-(y-0.5).^2)/(1/150)));
M100approx = @(y)(10*sqrt(6/pi)*exp((-(y-0.5).^2)/(1/600)));
clc; close all;

%n = 2
figure()
hold on;
histogram(normVector1, 'Normalization', 'pdf','DisplayStyle', 'stairs');
plot(linspace(0,1,length(convolN2)), convolN2);
fplot(M2approx, [0,1]);
title('PDF Comparison for n = 2')
xlabel('Distribution Values')
ylabel('Concentration');
legend('MATLAB', 'PRECISE', 'APPROXIMATE')

%n = 4
figure()
hold on;
histogram(normVector2, 'Normalization', 'pdf','DisplayStyle', 'stairs');
plot(linspace(0,1,length(convolN4)), convolN4);
fplot(M4approx, [0,1]);
title('PDF Comparison for n = 4')
xlabel('Distribution Values')
ylabel('Concentration');
legend('MATLAB', 'PRECISE', 'APPROXIMATE')

%n = 25
figure()
hold on;
histogram(normVector3, 'Normalization', 'pdf', 'DisplayStyle', 'stairs');
fplot(M25approx, [0,1]);
title('PDF Comparison for n = 25')
xlabel('Distribution Values')
ylabel('Concentration');
legend('MATLAB', 'APPROXIMATE')

%n = 100
figure()
hold on;
histogram(normVector4, 'Normalization', 'pdf', 'DisplayStyle', 'stairs');
fplot(M100approx, [0,1]);
title('PDF Comparison for n = 100')
xlabel('Distribution Values')
ylabel('Concentration');
legend('MATLAB', 'APPROXIMATE')

end