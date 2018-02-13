%Buck Boost Converter
%Voltage Ripple vs Duty Cycle
close all;
dutyCycle = linspace(0,1,1000);
Vout = 15;
fs = 50e3;
Rload = 10;
C = 100e-6;
Vripple = Vout.*dutyCycle ./ (fs*Rload*C);
figure()
plot(dutyCycle, Vripple,'r')
title('Duty Cycle vs Voltage Ripple');
xlabel('Duty Cycle');
ylabel('Voltage Ripple');

