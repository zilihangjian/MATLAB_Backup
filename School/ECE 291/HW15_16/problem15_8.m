%Cold Resevoir Temperature of 70C
%Plot efficiency of the geothermal fluid temperature from 100C to 300C 
%If a minimum efficiency of 5% is necessary to make the utilization of the
%resource economical, what minimum geothermal fluid temperature is needed
clc; clear; close all;
Tc = 70 + 273;%Cold Resevoir Temperature in Kelvin
Th = linspace(100,300,1000) + 273; %Geothermal Fluid Temperature in Kelvin
eff = (1/3) .* (100.*(1 - (Tc ./Th)));%Vector of efficiencies
%Plotting
figure()
plot(Th, eff, 'r')
xlabel('Geothermal Fluid Temperature (K)')
ylabel(sprintf('\\eta'));
title(sprintf('\\eta vs Temperature'));
minInd = find(eff < 5, 1, 'last' );
fprintf('Minimum Efficiency %f | Minimum Temperature (K) %f\n', ...
    eff(minInd), Th(minInd));