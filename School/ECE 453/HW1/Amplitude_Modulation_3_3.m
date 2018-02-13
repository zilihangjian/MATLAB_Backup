%Plots for the Amplitude Modulation of Message and Carrier Signals for
%Problem 3.3
clear; close all;
%Form of the message signal | AM*cos(wc*t)
%Form of the carrier signal | 10*cos(wc*t)
%AM is the different specified Amplitudes

%Variable Declaration / Initialization
AM = [4,10,20];%Amplitudes for the three different message signals
AC = 10;%Amplitude for the Carrier Signal
freqM = 50;%Arbitrary Frequency for the Message Signal
wcM = 2*pi*freqM;
freqC = 10*freqM;%Arbitrary Frequency for the Carrier Signal
wcC = 2*pi*freqC;
fs = 10000;%Sampling rate
time = 0: 1/fs : 0.10;%Time Duration
carr = AC*cos(wcC*time);%Carrier signal

%Carrier Signal
figure();
plot(time,carr);
xlabel('Time (s)');
ylabel('Amplitude');
title('Carrier Signal');
cString = sprintf('Carrier | %g Hz', freqC);
legend(cString);

%Message Signal
figure('units','normalized','outerposition',[0 0 1 1])
messSig = zeros(length(AM), length(time));
messSigPha = zeros(length(AM), length(time));
for j = 1: length(AM)
    subplot(1,length(AM),j)
    messSig(j,:) = AM(j).*cos(wcM.*time);%Message Signal
    messSigPha(j,:) = AM(j).*cos((wcM.*time) - (pi));%Message Signal
    plot(time,messSig(j,:));
    xlabel('Time (sec)');
    ylabel('Amplitude');
    tString1 = sprintf('Message Signal %g',j);
    title(tString1);
    lString1 = sprintf('AM %g | %g HZ', AM(j), freqM);
    legend(lString1);
end

%Amplitude Modulated Signals
modSig = zeros(length(AM), length(time));
for j = 1: length(AM)
    figure()
    modSig(j,:) = (AC + AM(j).*cos(wcM.*time)).*cos(wcC*time);%Modulated Signal
    hold on;
    plot(time,modSig(j,:));
    plot(time,(messSig(j,:) + AC), time, (messSigPha(j,:) - AC));
    xlabel('Time (sec)');
    ylabel('Amplitude');
    tString2 = sprintf('Modulated Signal %g',j);
    title(tString2);
end