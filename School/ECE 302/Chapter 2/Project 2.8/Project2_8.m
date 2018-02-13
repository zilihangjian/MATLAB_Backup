%Project 2.8
clc; clear;
%vt = A*exp(-t/2*R*C)
R = 5000;
L = 1e-6;
C = 10e-12;
v0 = 3.3;
i0 = 0;
dv0 = ((-1/(R*C))*v0);
A = v0/exp(-0/2*R*C);
t = linspace(0,50e-9);
vt = A*exp(-t/2*R*C);
plot(t,vt);
disp(vt);