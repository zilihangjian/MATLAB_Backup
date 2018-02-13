function [] = stateDetectionE()
% function [] = stateDetectionE()
clc; close all;
N = 4000;%Samples
Ptar = 80e-6;%Target Power Gotten from Part I
sig = linspace(Ptar/30, 30*Ptar, N);
for a = 1: N
    y = raylrnd(sig(a),1,N);
    Pd = 0;
    Pfa = 0;
    for k = 1: N
        L1(k) = (((y(k)/(sig(a)^2))*exp(-(y(k)^2)/(2*sig(a)^2)))/...
            (((y(k) + Ptar)/(sig(a).^2))*exp((-(y(k) + Ptar)^2)/(2*sig(a)^2))));
        L2(k) = ((((y(k)/(sig(a).^2))*exp((-(y(k)^2))/(2*sig(a)^2)))/...
            (((y(k) - Ptar)/(sig(a)^2))*exp(-((y(k)-Ptar).^2)/(2*sig(a)^2)))));
        if L1(k) > 1
            Pd = Pd + 1;
        end
        if L2(k) > 1
            Pfa = Pfa + 1;
        end
    end
    PdVect(a) = Pd /N;
    PfaVect(a) = Pfa / N;
    SNR(a) = (Ptar / (sum(y.^2)./N));
end

subplot(2,2,1)
plot(log10(SNR), PdVect,'r');
title('PD')
ylabel('Probability')
xlabel('SNR')
subplot(2,2,2)
plot(log10(SNR),PfaVect,'b');
title('PFA')
ylabel('Probability')
xlabel('SNR')

%Plot compared to the target Return Power
Pvect = linspace(1e-15, 15, N);
s = 5;
for a = 1: N
    y = raylrnd(s,1,N);
    Pd = 0;
    Pfa = 0;
    for k = 1: N
        L1(k) = ((y(k)/(s^2))*exp(-(y(k)^2)/(2*s^2)))/...
            (((y(k) + Pvect(a))/(s^2))*exp((-(y(k) + Pvect(a))^2)/(2*s^2)));
        L2(k) = ((y(k)/(s^2))*exp((-(y(k)^2))/(2*s^2)))/...
            (((y(k) - Pvect(a))/(s^2))*exp(-((y(k)-Pvect(a)).^2)/(2*s^2)));
        if L1(k) > 1
            Pd = Pd + 1;
        end
        if L2(k) > 1
            Pfa = Pfa + 1;
        end
    end
    PdVect(a) = Pd /N;
    PfaVect(a) = Pfa / N;
end

subplot(2,2,3)
plot((Pvect), (PdVect),'r');
title('PD')
ylabel('Probability')
xlabel('Power')
subplot(2,2,4)
plot((Pvect), (PfaVect),'b');
title('PFA')
ylabel('Probability')
xlabel('Power')
end