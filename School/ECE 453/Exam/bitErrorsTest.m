simulations = 1000;
close all; clc;
summations = ones(2,simulations);
%Vector storing the number of instances of receiving a 0 or receiving a 1
for j = 1: simulations
    [zeroReceive, oneRecieve] = bitErrors(60, .10);%Function call for bitErrors
    summations(1,j) = zeroReceive;
    summations(2,j) = oneRecieve;
end
prob_r0 = sum(summations(1,:)) / simulations;
prob_r1 = sum(summations(2,:)) / simulations;