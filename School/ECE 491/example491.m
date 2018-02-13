function [] = example491()
% function [] = example491()
N1 = 10; %Primary Turns
N2 = 1; %Secondary Turns

R1 = 0.10; %Primary Side Winding Resistance 
X1 = 0.22; %Primary Side Leakage Reactance
R2 = 0.00319; %Secondary Side Winding Resistance 
X2 = 0.0073; %Secondary Side Leakage Reactance
RM = 250; %Equivalent Core Resistance 
XM = 1250; %Magnetizing Reactance
ZL = 0.387 + 1i*0.29; %Load Impedance

Z1 = R1 + 1i*X1; %Primary Impedance
ZM = (RM * 1i*XM) / (RM + 1i*XM); %Magnetizing Impedance
Z2 = R2 + 1i*X2; %Secondary Impedance
Z2_P = ((N1/N2)^2)*Z2; %Secondary Impednace Referred to the Primary 
ZL_P = ((N1/N2)^2)*ZL; %Load Impedance Referred to the Primary 

ZSEC_r = Z2_P + ZL_P; %Referred Secondary and Load Impednaces
ZEQ = ZM * ZSEC_r / (ZM+ZSEC_r); %Equivalent Impedance
V1 = 2300




end

