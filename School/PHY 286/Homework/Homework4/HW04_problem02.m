function [x1,alphaValues1,x2,alphaValues2] = HW04_problem02(x0,alpha,n0,...
    beta,nmax)
%function [x1,alphaValues1,x2,alphaValues2] = HW04_problem02(x0,alpha,n0,...
%beta,nmax)
%Inputs:
%x0: initial value for x alpha: vector containing the alpha integers
%n0: value used in the iterative map function beta: value used in the 
%iterative map function nmax: max number of iterations in for loop
%Outputs: 
%x1: x values for part a alphaValues1: alpha values for part a
%x2: x values for part b alphaValues2: alpha values for part b
%Description: This function generates two different plots of randomly
%generated values based off the range of alpha values supplied. The random
%values are generated by using two different iterative maps
if nargin == 0
    x0 = .5;
    alpha = [1 20];
    n0 = 8;
    beta = 1;
    nmax = 10000;
end

x1 = zeros(nmax,1);
x1(1) = x0;
alphaValues1 = linspace(alpha(1),alpha(end),nmax);
for j=2:(nmax)
    x1(j) = iterativeMap1(x1(j-1),alphaValues1(j),n0,beta);
end
figure();
subplot(1,2,1)
plot(alphaValues1,x1,'.r');
title(sprintf('Bifurcation Plot of \\alpha vs x'));
xlabel(sprintf('\\alpha'));
ylabel('x');
ylim([0 250]);
xlim([1 20]);

%Part 2
x2 = zeros(nmax,1);
x2(1) = x0;
alphaValues2 = linspace(alpha(1),alpha(end),nmax);
for j=2:(nmax)
    x2(j) = iterativeMap2(x2(j-1),alphaValues2(j),n0,beta);
end
subplot(1,2,2);
plot(alphaValues2,x2,'.k');
title(sprintf('Bifurcation Plot of \\alpha vs x'));
xlabel(sprintf('\\alpha'));
ylabel('x');
ylim([0 250]);
xlim([1 20]);
end

%Part a
function [fx1] = iterativeMap1(x, alpha,n,beta)
a = alpha.*x.*(2.^n) + beta;
b = 2.^n;
fx1 = rem(a,b);
end

%Part b
function [fx2] = iterativeMap2(x,alpha,n,beta)
a = floor(x.*(2.^n)).*alpha + beta;
b = 2.^n;
fx2 = rem(a,b);
end