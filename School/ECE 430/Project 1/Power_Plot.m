function  [probD,probFA,algoTime] = Power_Plot()
% function  [probD,probFA,algoTime] = Power_Plot()
clc; close all;

%Samples
N = 3000;
%Pre Allocation
scale = 3;%[1,N] vector containing sigma values
Ptar = linspace(50e-12,10,N);%Vector containing target power values
LPD = zeros(N,N);%Stores the Likelihood comparison for L1
LPFA = zeros(N,N);%Stores the Likelihood comparison for L2
probD = zeros(1,N);%Vector storing the probability of detection
probFA = zeros(1,N);%Vector stroring the probability of false alarm
gamma = 1;%Threshold value

%Algorithm Implementation
tic;
for j = 1: N
    y = raylrnd(scale,1,N);
    LPD(:,j) = ((y./(scale.^2)).*exp(-(y.^2)./(2.*scale.^2)))./...
        (((y + Ptar(j))./(scale.^2)).*exp((-(y + Ptar(j)).^2)/(2.*scale.^2)));
    LPFA(:,j) = (((y./(scale.^2)).*exp((-(y.^2))/(2.*scale.^2)))./...
        (((y - Ptar(j))./(scale.^2)).*exp(-((y - Ptar(j)).^2)/(2.*scale.^2))));
    probD(j) = (length(find(LPD(:,j) > gamma)))/N;%Probability of Detection 
    probFA(j) = (length(find(LPFA(:,j) > gamma)))/N;%Probability of False Alarm 
end
algoTime = toc;%Algorithm Time
fprintf('Algorithm Time | %f',algoTime);

%Plotting 
subplot(1,2,1)
plot(Ptar, probD,'g');
title('PD vs PTAR'); ylabel('Probability of Detection'); xlabel('Target Power')
subplot(1,2,2)
plot(Ptar, probFA,'g');
title('PFA vs PTAR'); ylabel('Probability of False Alarm'); xlabel('Target Power')
end