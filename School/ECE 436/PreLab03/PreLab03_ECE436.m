clc; clear; close all;
%Parameters
Rm = 8.4;%Terminal Resistance
kt = 0.042;%Torque Constant
km = 0.042;%Motor Back EMF Constant
Jm = 4.0e-6;%Rotor Inertia
Lm = 1.16e-3;%Rotor Inductance
mh = 0.0106;%Load Hub Mass
rh = 0.0111;%Load Hub Radius
Jh = 0.60e-6;%Load Hub Inertia
md = 0.053;%Mass of Disk Load
rd = 0.0248;%Radius of Disk Load
%Approximate Jd based of (md*rd^2)
Jd = (md*rd^2)/4;

%Assumed that a 3 V step input corresponds to 3dirac(t) which corresponds
%to 3/s in the laplace domain for determining the transfer function
system = tf([1], [(Lm/kt)*(Jm+Jh+Jd), (Rm/kt)*(Jm+Jh+Jd), km]);
t = linspace(0,2,10000);

%Unit Step Function
inputResponse1 = 3*heaviside(t);

%Dirac Function
inputResponse2 = 3*zeros(1,length(t));
inputResponse2(1) = 1;

%Plotting
figure()
subplot(2,1,1);
lsim(system, inputResponse1,t);
title('Unit Step Response')
subplot(2,1,2);
lsim(system, inputResponse2,t);
title('Dirac Function Reponse')