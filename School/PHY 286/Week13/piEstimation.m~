function [pi_approximation] = piEstimation(dx)
%PIESTIMATION Summary of this function goes here
%   Detailed explanation goes here

x = [-1:dx:1];
Yx = zeros(size(x));
count = 1;
for n1=1: length(Yx)
    x0 = x(n1);
    dy(count) = sqrt(1-x0.^2);
    Yx(n1) = dx.*trapz(dy);
    count = count + 1;
end

pi_approximation = sum(dy);

end

