function [] = lorentzFactor()
% function [] = lorentzFactor()
v = linspace(0,.99,100);
gamma = 1./sqrt(1 - v);
figure();
plot(v,gamma);
yLabel = sprintf('\\gamma');
xlabel('v/C'); ylabel(yLabel);
title('Lorentz Factor');
end