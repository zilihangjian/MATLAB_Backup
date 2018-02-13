function [gprime] = eval_gprime(theta,dtheta,m,B,dt,g,v0)
%EVAL_GPRIME Summary of this function goes here
%   Detailed explanation goes here
Theta1 = theta;
Theta2 = theta - dtheta;
g1 = eval_fprime(Theta1, v0, B, m, dt, g);
g2 = eval_fprime(Theta2, v0, B, m, dt, g);
gprime = g1-g2/dtheta;
end

