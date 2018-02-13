function [prob] = bonusSolution(method, errors, n, errorRate)
% function [prob] = bonusSolution(method,n, errors, errorRate)

if nargin < 1
    error('Missing Input for Solution Method');
end

if nargin < 2
    errors = 1000;
    n = 10^9;
    errorRate = 10^-6;
end

if nargin < 4
    n = 10^9;
    errorRate = 10^-6;
end

if isequal(method, 'Binomial')
    [prob] = binomialSolution(n,errors,errorRate);
elseif isequal(method, 'Poisson')
    [prob] = poissonSolution(n,errors,errorRate);
elseif isequal(method, 'Normal')
    [prob] = normalSolution(n,errors,errorRate);
else
    error('Invalid Solution Method');
end

end

function [prob] = binomialSolution(n, errors, errorRate)
% function [] = binomialSolution(n, errors, errorRate)
% Inputs: n: integer value representing the number of bits in a transmission
% errors: integer values reperesenting the number of error bits in a
% transmission
% errorRate: floating point value between 0 and 1 that represents the
% percentage chance of error occuring

%Variable Declaration
format long;
eRateStr = num2str(errorRate);
invRateStr = num2str('.999999');
Psum = cell(1,errors+1);
string1 = strcat(eRateStr, '^1');
part1 = vpa(string1);
string2 = strcat(invRateStr,'^',int2str(n));
part2 = vpa(string2);
Psum{1} = part1*part2;
nString = int2str(n);
keyboard

for k = 1: errors
    kString = int2str(k);
    string = strcat('exp(gammaln(', nString,'+1)-gammaln(',kString,...
        '+1)-gammaln(',int2str(n-k+1), '))');
    comb = vpa(string);
    stringk1 = strcat(eRateStr, '^',int2str(k));
    partk1 = vpa(stringk1);
    stringm2 = strcat(invRateStr,'^',int2str(n-k));
    partm2 = vpa(stringm2);
    Psum{k+1} = comb * partk1 * partm2;
end

prob = vpa('0');

for j = 1: errors+1
    prob = prob + Psum{j};
end

end

function [prob] = poissonSolution(n,errors,errorRate)
% function [prob] = poissonSolution(n,errors,errorRate)
gamma = n*errorRate;
gammaString = int2str(gamma);
expCoefficient = vpa('exp(-1000)');
Psum = cell(1,errors+1);
Psum{1} = expCoefficient;
for k = 1: errors
    kString = int2str(k);
    string = strcat('(',gammaString, '^', kString,...
        ')', '/factorial(', kString ,')');
    expression = vpa(string);
    Psum{k+1} = expression * expCoefficient;
end

prob = vpa('0');

for j = 1: errors+1
    prob = prob + Psum{j};
end

end

function [prob] = normalSolution(n,errors, errorRate)
% function [prob] = normalSolution(n,errors, errorRate)
% Inputs: n: integer value representing the number of bits in a transmission
% errors: integer values reperesenting the number of error bits in a
% transmission
% errorRate: floating point value between 0 and 1 that represents the
% percentage chance of error occuring
mu = n*errorRate;
var = n*errorRate;
sigmaS = var \ sqrt(n);
zValue = (errors - mu)/sigmaS;
prob = normcdf(zValue);

end