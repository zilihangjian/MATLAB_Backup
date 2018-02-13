function [] = HW13_schaffjr(p,n)
% function [] = HW13()
% Write a matlab program to simulate the 1-D random walk case
% (Sn vs n) for the following cases:
% – p = 0.50;
% – p = 0.40;
% – P = 0.60;
% In each case, do three simulations for n=1 to 100. Plot all the three
% simulations in each case in one graph. You need to have one plot for each
% case.
% HW13([.40,.50,.60], 100)
clc; close all;

%Variable Declaration
datarand = rand(length(p),n);
walkValues = zeros(length(p),n);
walks = zeros(length(p), n);
for z = 1: length(p)
    walks(z,:) = datarand(z,:) <= p(z);
end

figure();
hold on;
for k = 1: length(p)
    for j = 1: n
        if walks(k,j) == 1
            walkValues(k,j+1) = walkValues(k,j) + 1;
        else
            walkValues(k,j+1) = walkValues(k,j) - 1;
        end
    end
    plot(walkValues(k,:));
end

end