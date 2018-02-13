clc; close all;
%Output Current vs Inductance
fs = 50e3;%Switching Frequency 
D = 0.50;% Duty Cycle
L = (7.5*(1-D))./ (iLpp.*fs);%Inductance Values
figure()
plot(L, iOUT,'r')
xlabel('Inductance');
ylabel('Output Current');
title('Output Current vs Inductance')

%Output Current vs ur
u0 = pi*4e-7;%Magnetic Permeability H/m
le= 0.1204;%length in m
Ae = 0.0001204;%Area in m
N = [5,6];%Number of turns
ur1 = (le.*L) ./ (u0.*N(1).^2.*Ae);%Relative Permeability 
ur2 = (le.*L) ./ (u0.*N(2).^2.*Ae);%Relative Permeability 
figure()
hold on
plot(ur1,iOUT, 'g');
plot(ur2,iOUT, 'k');
legend('N | 5','N | 6'); 
xlabel('Relative Permeability')
ylabel('Output Current')
title('Output Current vs Relative Permeability');



