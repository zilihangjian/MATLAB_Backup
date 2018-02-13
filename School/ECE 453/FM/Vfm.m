clc; close all; clear;
Ac = 10;
B = 0.01;
fc = 1e4;
fm = 1e3;
t = linspace(0,0.001,1e6);
vFM = Ac*cos(2*pi*fc*t + B*sin(2*pi*fm*t));
figure()
plot(t,vFM);


TT = cos(B*cos(2*pi*fm.*t).*cos(2*pi*fm.*t));
figure()
plot(t,TT); 