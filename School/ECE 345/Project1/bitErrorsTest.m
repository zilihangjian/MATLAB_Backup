function [prob_r1, prob_r0] = bitErrorsTest(simulations)
% function [prob_r1, prob_r0] = bitErrorsSimulation(simulations)
%Inputs: simulations, integer value for the number of interations to run a
%specific number of relay events
%Outputs: prob_r1, the probability of receiving a 1
%         prob_r0, the probability of receiving a 0
%Description: This function takes the input for the number of simulations
%and tests the first part for Project 1 a).
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
end