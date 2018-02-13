clc; close all; clear;
wM = 2*pi*1000;
wC = 2*pi*180e3;
Am = 4;%Message Signal Amplitude
t = linspace(0,0.01,360e3);
messSig = Am*cos(wM.*t);
carrSig = cos(wC.*t);
a1 = linspace(0.45,0.55,3);

%Message Signal Attenuated by a factor of 2
xAM = zeros(length(a1),length(t));
figure();
for j = 1: length(a1)
    xAM(j,:) = 0.50*(1 + (a1(j)/2).*(messSig)).*carrSig;
    subplot(3,1,j);
    plot(t, xAM(j,:));
    xlabel('Time [s]');
    ylabel('Amplitude');
    tString = sprintf('\\mu | %g', a1(j));
    title(tString);
end
hold off;

%Extremely Overmodulated Signal
figure()
aOve = 1;
xAMOve = 0.50*(1 + (aOve/2).*(messSig)).*carrSig;
plot(t, xAMOve);
xlabel('Time [s]');
ylabel('Amplitude');
tString = sprintf('\\mu | %g', aOve);
title(tString);

