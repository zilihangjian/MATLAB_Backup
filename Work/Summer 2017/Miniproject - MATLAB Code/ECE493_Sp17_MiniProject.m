%% =>- %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
%% ECE493/593 Sp17 Problem %%
%
%  The following code is used to generate problems 
%  for the flyback converter.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% HOUSEKEEPING
clear; clc;
addpath(genpath('H:\Code\Matlab\Marks_Functions'));  % Add Directory for Functions
j = sqrt(-1);

%% VARIABLES

PV_low  = 30;
PV_high = 45;

D_low  = 0.4;
D_high = 0.65;

V_dc_out = 200;

%Part A
N2_N1_1 = V_dc_out/PV_high*(1-D_low)/(D_low)
N2_N1_2 = V_dc_out/PV_low*(1-D_high)/(D_high)
