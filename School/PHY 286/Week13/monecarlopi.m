function [mcpi] = monecarlopi(N)
%MONECARLOPI Summary of this function goes here
%   Detailed explanation goes here
rng('shuffle');
x = rand(N,1);
y = rand(N,1);
inds1 = find((x.^2 + y.^2) < 1);
inds2 = find((x.^2 + y.^2) >= 1);
mcpi = 4*length(inds1)/N;

xvals = linspace(0,1,100);
yvals = sqrt(1-xvals.^2);
plot(xvals,yvals,'-k',x(inds1),y(inds1),'.b',x(inds2),y(inds2),'.r');
% disp(sprintf('MC calculation of pi for %d: %0.4f; (error = %E)', N, mcpi);
end
%  n = round(logspace(2,6,50));
% for n1=1:length(n);mcpi(n1) = monecarlopi(n(n1)); end
% plot(n,mcpi,'-',n',ones(size(n)).*pi,'--');


