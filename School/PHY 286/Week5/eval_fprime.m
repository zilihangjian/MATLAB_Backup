function [fprime] = eval_fprime(theta,dtheta,m,B,dt,g,v0)
%EVAL_FPRIME Summary of this function goes here
%   Detailed explanation goes here
Theta1 = theta;
Theta2 = theta - dtheta;
f1 = twoD_projectile(Theta1, v0, B, m, dt, g);
f2 = twoD_projectile(Theta2, v0, B, m, dt, g);
fprime = f1-f2/dtheta;
end

