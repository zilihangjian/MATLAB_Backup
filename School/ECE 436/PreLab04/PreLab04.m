clc; clear; close all;
%Parameters
Rm = 8.4;%Terminal Resistance
% kt = 0.042;%Torque Constant
km = 0.042;%Motor Back EMF Constant
Jm = 4.0e-6;%Rotor Inertia
Lm = 1.16e-3;%Rotor Inductance
mh = 0.0106;%Load Hub Mass
rh = 0.0111;%Load Hub Radius
Jh = 0.60e-6;%Load Hub Inertia
md = 0.053;%Mass of Disk Load
rd = 0.0248;%Radius of Disk Load
%Assume that Jd is approximated by the formula J = (md*rd^2)/4 due to disk
%shape
Jd = (md*rd^2)/4;%Disk Inertia

Jeq = Jd + Jh + Jm;%Total Inertia of System

tfQUBE= tf([(1/km)], [((Rm*Jeq)/km.^2) , 1]); 

%Question 7 (2V input response)
t = linspace(0,0.60,10000);
inputResponse1 =  2*heaviside(t);%2*u(t)

%Question 9(5V input response)
inputResponse2 =  5*heaviside(t);%5*u(t)

%Plotting
figure()
subplot(2,1,1)
lsim(tfQUBE, inputResponse1,t);
hold on;
lsim(tfQUBE, inputResponse2,t);
title('lsim Response')
legend1String = sprintf('Input | 2\\mu(t)');
legend2String = sprintf('Input | 5\\mu(t)');
legend(legend1String, legend2String);
%Symbolic Transfer Function
syms a b s x 
symTF = a / (b*s + 1); 
symTimeResponse = ilaplace(symTF, x);
hold off;

%Test
subplot(2,1,2);
system1 = 47.619*(1 - exp(-16.4745*t));
system2 = 119.0475*(1 - exp(-16.4745*t));

plot(t,system1);
hold on;
plot(t,system2);
title('Calculated Responses')
legend1String = sprintf('Input | 2\\mu(t)');
legend2String = sprintf('Input | 5\\mu(t)');
legend(legend1String, legend2String);
xlabel('Time [s]');
ylabel('Amplitude [rad/s');
hold off



