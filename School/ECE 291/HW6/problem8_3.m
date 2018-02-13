function [] = problem8_3()
% function [] = problem8_3()
% Johnathan Schaff ECE 291
Tinterior = 68; %F
Texterior = linspace(-20, 50, 71);%Evenly distributed temperatures
A = 40; %Area of window in square ft
t = 24; %24 hours in one day
totalIncidentEnergy = 1387.666667 * A;%Incident Energy Averaged from Table 8.2
Rvalues = ((Tinterior - Texterior).*A.*t)./(totalIncidentEnergy/2);

%Plot Generation
figure()
hold on
for j=1: length(Texterior)
    plot(Texterior(j), Rvalues(j),'ob');
    if mod(j-1,10) == 0
        fprintf('Exterior Temperature: %g | R-value: %g\n',Texterior(j),Rvalues(j));
    end
end
xlabel('Exterior Temperature (Celsius)');
ylabel('Minimum R-values');
title('R-values vs Exterior Temperature');
end