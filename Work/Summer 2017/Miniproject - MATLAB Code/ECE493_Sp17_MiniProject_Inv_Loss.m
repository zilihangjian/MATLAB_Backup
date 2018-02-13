%% ECE493/593 Sp17 Mini Project =>- %%
%% =>- %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
%
%  The following code is to determine the inverter loss
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% HOUSEKEEPING
clear; clc;
addpath(genpath('H:\Code\Matlab\Marks_Functions'));  % Add Directory for Functions
j = sqrt(-1);

%% VARIABLES GIVEN IN PROBLEM
VDC = 200;
Vout = 120;
ma = 120*sqrt(2)/VDC

fs = 50e3;
fc = 60;

Pout = 300;
pf = 0.95

%% Device Parameters - From Datasheet
% Infineon IPL65R070C7

R_dson = 0.062;
td_on = 14e-9;
tr = 6e-9;
td_off = 92e-9;
tf = 11e-9;

ton = td_on + tr;
toff = td_off + tf;

R_jc = 0.74;
R_ja = 62

%% Abmient Conditions
Ta = 40;
Tj_max = 100;
R_cs = 1;

%% Calculate the Current Through the Device
Sout = Pout/pf;
Iout_rms = Sout/Vout;
Iout_pk = Iout_rms*sqrt(2);

%% Calculate the RMS Current and the Conduction Loss
I_q1_rms = Iout_pk/2
Pq1_con = (I_q1_rms)^2*R_dson

%% Calculate the Switching Loss
Pq1_sw = 1/2*(Iout_pk*2/pi)*fs/fc*VDC*(ton+toff)
Pq1_tot = Pq1_con+Pq1_sw
Ploss_inv = 4*Pq1_tot

%% Calculate the Thermal Impedance of the Heatsink
Ts = Tj_max - Pq1_tot*(R_cs + R_jc);
Rsa = (Ts - Ta)/Ploss_inv;

%% Calculate the size of the DC Bus
dV = 0.05
C = Pout/(2*pi*fc*VDC*2*(dV*VDC))

%% Calculate the filter elements.
f_crn = 1/10*fs
Lf = 100e-6;
Cf = 1/(2*pi*f_crn)^2/Lf





