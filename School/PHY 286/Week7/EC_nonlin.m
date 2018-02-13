function [tperiod] = EC_nonlin(q0, deltat, tmax)
%
% function [tperiod] = EC_nonlin(q0, v0, deltat, tmax)
% solve the non-linear oscillator q'' = -g*sin(q)/L
% q0 is the initial amplitude (at t = 0)
% assume oscillator has zero angular speed 
% 

gamma = 9.8/1; %fixed g=9.8 m/s^2 and L = 1m
xprev = q0; %initial amplitude
vprev = 0; %initial speed = 0
count = 1;
time = [0:deltat:tmax];
for t = time
   vnext = vprev - gamma.*sin(xprev).*deltat;
   xnext = xprev + vnext.*deltat;
   x(count) = xprev;
   v(count) = vprev;
   xprev = xnext;
   vprev = vnext;
   count = count+1;
end

plot(time, x, '--.k');
maxinds = find(x >= q0);
tperiod = time(maxinds(2)) - time(maxinds(1));