%Question 7 
clc; clear; close all;
t = linspace(0,2.5,10000);
% zeta23b = (-log(OS_23B) / sqrt((pi^2) + log(OS_23B)^2));
% wn23B = (pi/(Tp_23B*sqrt(1-zeta23b^2)));
zeta = 0.20833;
wn = 19.842;
sys = tf([(wn^2)],[1,(2*zeta*wn), wn^2]);
sys %#ok<NOPTS>
inputResponse = 20*heaviside(t-1.5);%u(t)
figure()
lsim(sys,inputResponse,t);

%OS and Tp Calculations
const1 = sqrt(1-zeta^2);
Tp = 1.5 + pi/(wn*const1);
fprintf('Peak Time | %g seconds\n',Tp);
OS = exp(-(zeta*pi/const1))*100;
fprintf('Overshoot | %g Percent\n',OS);