close all; clc;
k = 0.50;
m = 3000;%3kg
f0 = 500;%frequency in Hz
r = 0.80;%radius in meters

%Frequency decreases 1Hz a second
t = linspace(0,100,101);
f = linspace(100,0,101);%f0 is 100 Hz
E = 2.*pi.^2.*k.*m.*r.^2.*f.^2;%Energy of the signal
P = E./t;
figure()
plot(t,P,'ob');
xlabel('Time (s)');
ylabel('Power (W)');
title('Power vs Time');%Linear Decrease of frequency over time
grid on;
