%% ECE 291 HW 3 Problem 1
% Determines the mass of CO2 produced per MJ in various reactions
%Johnathan Schaff
clc; clear; close all;
n = [2,3,4,5,6,7,8];%mole ratios from CO2 to (ethane:octane)
moleWeight = [30,44,58,72,86,100,114];%ethane to octane 
moleWeightCO2 = 44;
energyWeight = [51.9, 50.3, 49.5, 48.7, 48.1,48.1, 46.8];%ethane to octane
solutionVector = ((moleWeight.*energyWeight)./n)/moleWeightCO2;
for j = 1: length(solutionVector)
    fprintf('n | %d Mass per MegaJoule | %f grams\n',n(j), (1000/solutionVector(j)));
end