function [theta,t] = NonLinearPendulum(q0,deltat,tmax)
%NONLINEARPENDULUM Summary of this function goes here
%   Detailed explanation goes here
theta0 = linspace(pi/180,pi/2,25);
% for i=1:length(theta0)
    theta(1)= q0;
    omega(1) = 0;
    count = 1;
    g = 9.8;
    l = 1;
    time = [0:deltat:tmax+1];
    for t = time
        theta(count+1) = theta(count) - ((g/l)*sin(theta(1)).*deltat);
        omega(count+1) = omega(count) + theta(count+1).*deltat;
        count = count + 1;
    end
    
    figure(1); plot(time,theta);
% end

end

