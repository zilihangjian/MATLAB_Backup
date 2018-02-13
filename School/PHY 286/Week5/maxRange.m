function [thetaMax,rangeMax] = maxRange(N,theta,dtheta,m,B,dt,g,v0)
%MAXRANGE Summary of this function goes here
%   Detailed explanation goes here

count = 3;
t(3) = theta;
t(2) = theta-dtheta;
t(1) = theta - 2*dtheta;
while count < N
    f1 = twoD_projectile(t(count), v0, B, m, dt, g);
    f2 = twoD_projectile(t(count-1), v0, B, m, dt, g);
    gt = f1-f2/dtheta;
    gtprime = eval_gprime(theta, dtheta, m, B, dt, g, v0);
    t(count+1) = t(count) - gt/gtprime;
    f3 = twoD_projectile(t(count+1), v0, B, m, dt, g);
    if f1(1) < f3(1)
        thetaMax = t(count+1);
        rangeMax = f3(1);
    else 
        thetaMax = t(count);
        rangeMax = f1(1);
    end
    count = count + 1;
end

end

