%The radioactivity equation d/dt N(t) = -N(t) /tau
%The solution to this is N(t) = Noe^(-t/tau), Let N0 = 100
%Solve for two tau values: tau: .5 & tau = 20
%Check you solutions for different step sizes deltat
function [] = eulerDecay(initialValue,timeStep,N)
% Euler Approximation
%
%
clc;
%Variable Declarations
x = zeros(1,N);
t = zeros(1,N);
x(1,1) = initialValue;
tau = .5;
%Time Declaration
for n=1:N+1
    t(1,n) = n*timeStep;
end
for i=2:N
    x(i+1) = initialValue*exp(-t(i)/tau);
end

plot(t,x);

end
