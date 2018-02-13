function [] = HW2_p4()
% function [] = HW2_p4()
close all;
t = linspace(0,.00000000033,1000);
omega = 2*pi*(3e9);
expression = exp(-.04)*cos((omega.*t) - (pi/4));
plot(t,expression);
end

