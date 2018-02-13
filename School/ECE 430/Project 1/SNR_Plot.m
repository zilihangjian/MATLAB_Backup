function  [probD,probFA,algoTime] = SNR_Plot(Ptar)
% function  [probD,probFA,algoTime] = SNR_Plot(Ptar)
clc; close all;

%Pre Allocation
N = 3000;%Samples
scale = linspace(Ptar/30, Ptar*30, N);%[1,N] vector containing sigma values
LPD = zeros(N,N);%Stores the Likelihood comparison for L1
LPFA = zeros(N,N);%Stores the Likelihood comparison for L2
probD = zeros(1,N);%Vector storing the probability of detection
probFA = zeros(1,N);%Vector stroring the probability of false alarm
SNR = zeros(1,N);%SNR vector
gamma = 1;%Threshold Value

%Algorithm Implementation
tic;
for j = 1: N
    y = raylrnd(scale(j),1,N);
    LPD(:,j) = ((y./(scale(j).^2)).*exp(-(y.^2)./(2.*scale(j).^2)))./...
        (((y + Ptar)./(scale(j).^2)).*exp((-(y + Ptar).^2)/(2.*scale(j).^2)));
    LPFA(:,j) = (((y./(scale(j).^2)).*exp((-(y.^2))/(2.*scale(j).^2)))./...
        (((y - Ptar)./(scale(j).^2)).*exp(-((y - Ptar).^2)/(2.*scale(j).^2))));
    SNR(j) = Ptar / (sum(y.^2)./N);%SNR
    probD(j) = (length(find(LPD(:,j) > gamma)))/N;%Probability of Detection 
    probFA(j) = (length(find(LPFA(:,j) > gamma)))/N;%Probability of False Alarm 
end
algoTime = toc;%Algorithm Time
fprintf('Algorithm Time | %f',algoTime);

%Plotting 
subplot(1,2,1);
plot(10*log10(SNR), probD,'g');
title('PD vs SNR'); ylabel('Probability of Detection'); xlabel('SNR')
subplot(1,2,2);
plot(10*log10(SNR), probFA,'g');
title('PFA vs SNR'); ylabel('Probability of False Alarm'); xlabel('SNR')
end