function [convolN2,convolN4] = part1b()
% function [] = Project2_conv()
clear; close all;

%Precise PDF Estimation for n = 2
%NormalizationFactor = n*(length(unitStep)/4) 
unitStep = ones(1,100);
normalizationFactor2 = 2*(length(unitStep)/4);
convolN2 = conv(unitStep, unitStep) ./ normalizationFactor2;
figure();
plot(linspace(0,1,length(convolN2)), convolN2);
title('Precise PDF Via Convolution for n = 2');
xlabel('Distribution Values')
ylabel('Concentration');

%Precise PDF Estimation for n = 3
normalizationFactor3 = 3*(length(unitStep)/4);
convolN3 = conv(unitStep, convolN2) ./ normalizationFactor3;
figure()
plot(linspace(0,1,length(convolN3)), convolN3);
title('Precise PDF Via Convolution for n = 3');
xlabel('Distribution Values')
ylabel('Concentration');

%Precise PDF Estimation for n = 4
normalizationFactor4 = 4*(length(unitStep)/4);
convolN4 = conv(convolN2,convolN2)./normalizationFactor4;
figure()
plot(linspace(0,1,length(convolN4)), convolN4);
title('Precise PDF Via Convolution for n = 4');
xlabel('Distribution Values')
ylabel('Concentration');

%Precise PDF Estimation for n = 5
normalizationFactor5 = 5*(length(unitStep)/4);
convolN5 = conv(unitStep,convolN2)./normalizationFactor5;
figure()
plot(linspace(0,1,length(convolN5)), convolN5);
title('Precise PDF Via Convolution for n = 5');
xlabel('Distribution Values')
ylabel('Concentration');

figure();
hold on;
plot(linspace(0,1,length(convolN2)), convolN2);
plot(linspace(0,1,length(convolN3)), convolN3);
plot(linspace(0,1,length(convolN4)), convolN4);
plot(linspace(0,1,length(convolN5)), convolN5);
end