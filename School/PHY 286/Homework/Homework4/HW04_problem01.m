function [bifurcation,x] = HW04_problem01(x0,mu,nmax)
%function [] = HW04_problem01(x0,mu,nmax)
%Inputs: 
%x0: the intital x value for the vector x
%mu: a vector that contains mu values
%nmax: number of iterations for the loop
%Outputs 
%bifurcation: all the mu values in the vector
%x: all the x values in the vector 
%Description: This function calculates the bifurcation plot based off the
%initial x value and the mu values supplied to the function. It then
%displays the hardcoded values for determining the Feigenbaum parameter and
%displays those values

if nargin == 0
    mu = 2.8;
    x0 = .5;
    nmax = 100000;
end

x = zeros(nmax,1);
x(1) = x0;
if size(mu) == 1
    muStep = mu/nmax;
    bifurcation = zeros(nmax,1);
    bifurcation(1) = mu;
    for n=2:nmax
        x(n) = f_logisitic(x(n-1),mu);
        bifurcation(n) = mu;
        mu = mu + muStep;
    end

elseif length(mu) > 1
    bifurcation = linspace(mu(1),mu(end),nmax);
    for n=2:nmax
        x(n) = f_logisitic(x(n-1),bifurcation(n-1));
    end
end
plot(bifurcation,x,'.k');
xlabel(sprintf('\\mu'));
ylabel('x[n]');
title(sprintf('Bifurcation Plot of \\mu vs x'));
ylim([0,1]);
xlim([2.6,3.8]);
f1 = 3.04;
f2 = 3.47;
f3 = 3.56;
feigenbaum = (f2 - f1)/(f3 - f2);
fprintf('mu 1: %f, mu 2: %f, mu 3: %f, Feigenbaum Parameter: %f\n',...
    f1,f2,f3,feigenbaum);

end

%Subfunction creating logisitic Map
function [fx] = f_logisitic(x, mu)
fx = mu.*x.*(1-x);
end