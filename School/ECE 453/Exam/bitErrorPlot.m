function [] = bitErrorPlot(simulations, errorRate)
% function [] = bitErrorPlot(simulations)
%Inputs: simulations, integer value for the number of simulations supplied
%to the function bitErrors
%        errorRate, floating value from 0 < errorRate < 1 that represents
% the error rate in transmission for each relay
% Outputs: No formal outputs, function generates a plot of number of relays
% vs the probability of receiving a zero
%Description: This function deals with the solution to Project 1 Bit Errors
%part b, by running 40 relays and simulating each set of relays n number of
%times using the function bitErrors to simulate each relay 
%Example function call for part b: bitErrorPlot(100000,0.10)
clc; close all;
rng('shuffle');
probabilities = ones(2,40);
relayVector = linspace(1,40,40);
summations = ones(2,simulations);
for j = 1: 40
    for i = 1:simulations
        [zeroReceive, oneRecieve] = bitErrors(j, errorRate);
        summations(1,i) = zeroReceive;
        summations(2,i) = oneRecieve;
    end
    probabilities(1,j) = sum(summations(1,:)) / simulations;
    probabilities(2,j) = sum(summations(2,:)) / simulations;
end

plot(relayVector(:),probabilities(1,:), 'b');
title('Probability of Zero Receieved vs Number of Relays');
xlabel('Number of Relays');
ylabel('Probability of Zero Received');
end