function [y,t] = ClassEuler(N)
%CLASSEULER Summary of this function goes here
%   Detailed explanation goes here
dt = [0.01 0.02 0.03 0.04 0.05];

for i=1:length(dt)
    t = [0:N-1]*dt(i);
    y = zeros(1,N);
    y(1) = 2;
    for n=2:N
        y(1,n) = y(1) + dt(i)*4.*exp(.8.*(t(n-1))) - .5.*y(n-1);
    end
    
    an = (4/1.3).*(exp(.8.*t) - exp(-.5.*t)) + 2.*exp(-.5.*t);
    error = abs((an(length(an))) - y(length(y)))/(an(length(an)))*100;
    fprintf('Error: %f',error);
end
    plot(t,y,'r',t,an,'b');
end

