%% ECE493/593 Sp17 Mini Project =>- %%
%% =>- %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
%
%  The following code is to determine the inverter loss
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Calculate the RL and for the Simulation
clc

Vout = 120;
Pout = 300;
pf = 0.95
Sout = Pout/pf;
Iout_rms = Sout/Vout;
fc = 60;

R = Pout/(Iout_rms)^2
XL = Sout*sin(acos(pf))/(Iout_rms)^2
L = XL/(2*pi*fc)
