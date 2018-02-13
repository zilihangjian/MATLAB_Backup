function [] = multilevelPowerLossIGBT()
% function [] = multilevelPowerLoss()
clc;close all; clear;
%Curve Fitting
%5 Coefficients needed from curve fitting
%Equations: uON = u0 + r0*iC | Eswitch = (A0 + B0*iC + C0*iC^2)*(Uc/Ubase)
%Test Calculations for DF75R12W1H4F_B11 

%Load Data
load('CurrentSwitchingLossData')

%IGBT Curve Fitting
%VCE vs IC
[Vx, Vy] = parseData(VCE_IC_VGE_13V);
thresInd = find(Vx >= 1.5, 1 );
Vx = Vx(thresInd:end);
Vy = Vy(thresInd:end);
fV = fit(Vx, Vy,'poly1');
figure()
plot(fV,Vx,Vy);
coeffIGBT = coeffvalues(fV);
title('IGBT VCE and IC Characteristics')
xlabel('VCE')
ylabel('IC')
r0T = 1/coeffIGBT(1);
u0T = -coeffIGBT(2)/coeffIGBT(1);

%IC vs EON
[EONx, EONy] = parseData(EON_IC_T_125);
fON = fit(EONx, EONy,'poly2');
figure()
plot(fON,EONx,EONy);
coeffEON = coeffvalues(fON);
title('Switching Loss (EON)')
xlabel('IC Current')
ylabel('Energy')
CTON = coeffEON(1);
BTON = coeffEON(2);
ATON = coeffEON(3);

%IC vs EOFF
[EOFFx, EOFFy] = parseData(EOFF_IC_T_125);
fOFF = fit(EOFFx, EOFFy,'poly2');
figure()
plot(fOFF,EOFFx,EOFFy);
coeffEOFF = coeffvalues(fOFF);
title('Switching Loss (EOFF)')
xlabel('IC Current')
ylabel('Energy')
CTOFF = coeffEOFF(1);
BTOFF = coeffEOFF(2);
ATOFF = coeffEOFF(3);

%EON and EOFF Coefficients for IGBT
AT = ATON + ATOFF; 
BT = BTON + BTOFF;
CT = CTON + CTOFF;

%IGBT Diode Curve Fitting
%VF vs IF
[Forx, Fory] = parseData(VF_IF_T_150);
thresInd = find(Forx >= 0.70, 1 );
Forx = Forx(thresInd:end);
Fory = Fory(thresInd:end);
fFor = fit(Forx, Fory,'poly1');
figure()
plot(fFor,Forx,Fory);
coeffDio = coeffvalues(fFor);
title('Diode Forward Characteristics')
xlabel('IF')
ylabel('VF')
r0D = 1/coeffDio(1);
u0D = -coeffDio(2) / coeffDio(1);

%IF vs ERR
[ERRx, ERRy] = parseData(ERR_IF);
fRR = fit(ERRx, ERRy,'poly2');
figure()
plot(fRR,ERRx,ERRy);
coeffERR = coeffvalues(fRR);
title('Switching Loss (EOFF)')
xlabel('IF Current')
ylabel('Energy')
CD = coeffERR(1);
BD = coeffERR(2);
AD = coeffERR(3);
axis([0,30,0,4e-5]);

%The Uc/Ubase is a scale factor for the curves. Ubase is what the original
%datasheet curve was measured at for DC voltage, Uc is the voltage that is
%the intended test voltage for determining power loss
Ubase = 600;
Uc = 540;

%Power Factor and Power Factor Angle
pf = 0.85;
phi = acos(pf);
fc = 60;
IC = 500;
m = 0.80;

%Power Loss Equations taken from paper:
%Power Loss-Oriented Evaluation of High Voltage IGBTs and Multilevel Converters in Transformerlesss Traction Applications 
%--------------------------------------------------------------------------
%Flying Capacitor / 2 Level Converter
%--------------------------------------------------------------------------

%Clampped Capacitor Sizing
% Imax = %Maximum current
% n = %Number of nest FC cells/levels
% deltaUC = %maximum permissible voltage ripple across the power semiconducotrs
C = (Imax/(fc*n*deltaUC));

P_COND_IGBT = ((u0T*IC)/(2*pi)) + ((r0T*IC^2)/8) + ...
    (m*cos(phi))*(((u0T*IC)/8) + ((r0T*IC^2)/(3*pi)));%Conduction Loss for IGBT 

P_COND_DIODE = ((u0D*IC)/2*pi) + ((r0D*IC^2)/8) - ...
    ((m*cos(phi))*(((u0D*IC)/8) + ((r0D*IC^2)/3*pi)));%Conduction Loss for Diode 

P_SWITCH_IGBT = fc*(Uc/Ubase)*(((IC*BT)/pi) + ((CT/4)*IC^2)); %Switching Loss for IGBT

P_SWITCH_DIODE = fc*(Uc/Ubase)*((AD/2) + ((BD/pi)*(IC)) + ((CD/4)*IC^2)); %Switching Loss for IGBT

numSwitch = 12;
P_TOTAL_FC = numSwitch*(P_COND_IGBT + P_COND_DIODE + P_SWITCH_IGBT + P_SWITCH_DIODE);%Total Power Loss for 3 Level Flying Capacitor Topology

%--------------------------------------------------------------------------
%Three Level NPC
%--------------------------------------------------------------------------

%Outer Switches
P_COND_IGBT1 = m*(((u0T*IC)/(4*pi))*(((pi - phi)*cos(phi)) + sin(phi)) + ...
    ((r0T*IC^2)/(6*pi))*(1 + 2*cos(phi) + cos(phi)^2));%Conduction Loss for IGBT 1

%Inner Switches
P_COND_IGBT2 = (((u0T/pi)*IC) + ((r0T/4)*IC^2)) + ...
    m*(((u0T/(4*pi))*IC)*(phi*cos(phi) - sin(phi)) - ...
    (((r0T*IC^2)/(6*pi))*(1 + 2*cos(phi) + cos(phi)^2)));%Conduction Loss for IGBT 2

P_COND_D1_D2 = m*(((u0D/(4*pi))*IC) * (-phi*cos(phi) + sin(phi)) + ...
    ((r0D/(6*pi)*IC^2)*(1 - 2*cos(phi) + cos(phi)^2)));%Conduction Loss for D1/D2

P_COND_DNPC = (((u0D/pi)*IC) + (r0D/4)*IC^2) + ...
    m*((u0D/(4*pi)*IC)*(((2*phi - pi)*cos(phi)) - 2*sin(phi)) -  ...
    ((r0D/(3*pi))*IC^2)*(1 + cos(phi)^2));%Conduction Loss for the Neutral Point Diode

P_SWITCH_IGBT1 = fc*(Uc/Ubase)*(((BT/2*pi)*IC)*(1 + cos(phi)) +  ...
    ((CT/4*pi)*IC^2)*(cos(phi)*sin(phi) + (pi - phi))); %Switching Loss for IGBT1

P_SWITCH_IGBT2 = fc*(Uc/Ubase)*(((BT/2*pi)*IC)*(1 - cos(phi)) + ...
    (CT/4*pi)*IC^2)*(phi - (cos(phi)*sin(phi))); %Switching Loss for IGBT2

P_SWITCH_D1 = fc*(Uc/Ubase)*(((AD/(2*pi))*phi) +  ((BD/(2*pi))*(1-cos(phi))*IC) + ...
    (((CD/4*pi)*IC^2)*(phi - (cos(phi)*sin(phi))))); %Switching Loss for D1

P_SWITCH_D2 = 0; %Switching Loss for D2

P_SWITCH_DNPC = fc*(Uc/Ubase)*(((AD/(2*pi))*(pi-phi)) + ((BD/(2*pi))*IC*(cos(phi) + 1)) + ...
    (CD/4*pi)*IC^2)*(cos(phi)*sin(phi) + (pi-phi)); %Switching Loss for Neutral Point Diode

P_TOTAL_NPC = (numSwitch/2)*(P_COND_IGBT1 + P_COND_IGBT2 + P_SWITCH_IGBT1 + P_SWITCH_IGBT2 + ...
    P_COND_DNPC + P_SWITCH_DNPC) + numSwitch*(P_COND_D1_D2 + P_SWITCH_D1 + P_SWITCH_D2);
    
%Summation of Power Loss for the 3 Level Neutral Point Clamped Topology

%Results
fprintf('3 Level FC 3 Phase Power Loss | %f\n3 Level NPC 3 Phase Power Loss | %f\n',...
    P_TOTAL_FC, P_TOTAL_NPC);
str1 = 'AT | %g\nBT | %g\nCT | %g\nAD | %g\nBD | %g\nCD | %g\nUc | %g\nUbase | %g\n';
str2 = 'fc | %g\nphi | %g\nu0D | %g\nr0D | %g\nu0T | %g\nr0T | %g\nIC | %g\n';
text = strcat(str1,str2);
fprintf(text,AT,BT,CT,AD,BD,CD,Uc,Ubase,fc,phi,u0D,r0D,u0T,r0T,IC);
end