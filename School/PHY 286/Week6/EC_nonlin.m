function [tperiod] = EC_nonlin(q0,deltat,tmax)

gamma = 9.8/1;
xprev = q0;
vprev = 0;
count = 1;
time = [0:deltat:tmax];
for t = time
    vnext = vprev - gamma.*sin(xprev).*deltat;
    xnext = xprev + vnext.*deltat;
    x(count) = xprev;
    v(count) = vprev;
    xprev = xnext;
    vprev = vnext;
    count = count +1;
end
    plot(time,x,'--.k');
    
    maxq = q0;
    maxinds = find(x >= maxq);
    
end