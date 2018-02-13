function [pValues, meanVector, sortedSum] = ...
    part1c(trials, n, lowerLimit, upperLimit)
clc; close all;

% Variable Declaration
if n <= 1
    error('n must be greater than 1');
end

rng('shuffle');
mu = (lowerLimit + upperLimit)/2; %Average value of a uniform distribution
var = ((lowerLimit - upperLimit)^2)/12;%Variance of a uniform distribution 
simVector = lowerLimit + (upperLimit - lowerLimit).*rand(n, trials);
%Creates an n x trials sized matrix that represents running however many
%trials with n as the number of values included in the trials. One column
%is one trial with n values in that trial. 

meanVector = mean(simVector);
%Creates a 1xtrials vector, where each column is 1 trial and represents a
%value of Mn
sumVector = sum(simVector) ./ n;
sortedSum = sort(sumVector);
%Sorts the values in the sumVector from least to greatest for plotting
%purposes

%Normal Distribution Approximation via CLT
normalDist = @(xBar)((xBar - mu) / (sqrt(var) / sqrt(n)));
%Anonymous function for the normal distribution 
normalVector = normalDist(sortedSum(:));
pValues = normcdf(normalVector);

figure()
histogram(meanVector, 'normalization', 'pdf')
title(strcat('PDF for Mn | n = ', num2str(n)));
xlabel('Distribution Values')
ylabel('Concentration');

end