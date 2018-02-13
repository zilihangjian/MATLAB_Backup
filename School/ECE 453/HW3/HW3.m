clc; clear; close all;
%Problem 4.1
%Part a
% https://www.mathworks.com/matlabcentral/answers/318969-fm-modulation-without-using-fmmod
%Frequency Modulated Signal
fs = 1e7;
fc = 5e6;
fDev = pi*1e5;
t = linspace(0,1e-6,fs);
mT = 3 + 2.*sin(pi.*1e4.*t);
int_x = cumsum(mT)/fs;
xfm = cos(2*pi*fc*t).*cos(2*pi*fDev*int_x)-sin(2*pi*fc*t).*sin(2*pi*fDev*int_x);
xi = cos(2*pi*fDev*int_x);
xq = sin(2*pi*fDev*int_x) ; 
figure()
plot(t,xfm);
%Part b

%Phase Modulated Signal
% 
% t = linspace(0,1e-4,12e6);
% Ac = 5;
% wc = 2*pi*5e6;
% kp = 20;
% mesSig = 3 + 2*sin(pi*(1e4).*t);
% 
% phiPM = Ac*cos(wc.*t + kp*mesSig);
% 
% figure()
% plot(t,phiPM);