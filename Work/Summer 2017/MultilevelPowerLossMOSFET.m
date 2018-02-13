clc; close all;
%--------------------------------------------------------------------------
%Three Level Flying Capacitor Inverter
%--------------------------------------------------------------------------
P_COND_FC = @(RDS_ON, Imax) 0.25*RDS_ON*Imax^2;%Per Switch | 12 Switches total in Three Level

P_SW_FC = @(Eon, Eoff,fsw,VDC,Imax, Vref, Iref)(1/(2*pi))*...
    ((VDC*Imax)/(Vref*Iref))*(Eon+Eoff)*fsw;

%--------------------------------------------------------------------------
%Three Level Neutral Point Clamped Inverter
%--------------------------------------------------------------------------
% High-Efficiency NPC Multilevel Converter using Super-Junction MOSFETS
%Notes:
%phi is the phase angle of current leg

%Outer Switch Conduction Loss (FET 1 and FET 4)
P_COND_NPC_OUTERSW = @(RDS_ON, Imax, M, phi) ((M*RDS_ON*Imax^2)/(12*pi))*[12 + 4*cos(2*phi)];

%Inner Switch Conduction Loss (FET 2 and FET 3)
P_COND_NPC_INNERSW = @(iLOAD, RDS_ON) (RDS_ON*iLOAD^2);

%Outer Switch Switching Loss (FET 1 and Fet 4)
P_SW_NPC_OUTERSW = @(tRise, tFall, fsw, Vin, Imax, phi) ...
    (((tRise + tFall)*fsw*Vin*Imax)/(2*pi))*(1 + cos(phi));

%Inner Switch Switching Loss (FET 2 and Fet 3)
P_SW_NPC_INNERSW = @(tRise, tFall, fsw, Vin, Imax, phi) ...
    (((tRise + tFall)*fsw*Vin*Imax)/(2*pi))*(1 - cos(phi));

%NPC Diode Conduction Loss
P_DIODE_NPC_COND =  @(Vf, Imax, M, phi) ((Vf*2*Imax/pi) + ((Vf*Imax*M)/(4*pi)))*...
    ([(4*phi - 2*pi)*cos(phi) - 4*sin(phi)]);

%Universal Constants
fsw = 50e3;%50kHz Switching Frequency
M = 1;%Modulation Index of 1 | Can be altered
VDC = 48;%48 Volt DC Input
fc = 300;%Load frequency of 300 Hz
phiV = [0,2*pi/3,4*pi/3];
Imax = 60;
for j = 1:3
    phi = phiV(j);
    %NPC Diode Charactistics | Powerex CS240650
    Vf = 1.07;
    
    %GaN Device | GS66516T
    RDS_ON_GS66516T = 25e-3;
    tRise_GS66516T = 12.4e-9;
    tFall_GS66516T = 22e-9;
    Eon_GS66516T = 134.1e-6;
    Eoff_GS66516T = 14.7e-6;
    Vref_GS66516T = 40;
    Iref_GS66516T = 20;
%     %GaN Device | GS66508T
%     RDS_ON_GS66508T = 50e-3;
%     tRise_GS66508T = 3.7e-9;
%     tFall_GS66508T = 5.2e-9;
%     Eon_GS66508T = 47.5e-6;
%     Eoff_GS66508T = 7.5e-6;
%     Vref_GS66508T = 400;
%     Iref_GS66508T = 15;
    
    
    %NPC Loss Approximation
    %GS66516T
    P_NPC_GS66516T(j) = ...
        P_COND_NPC_OUTERSW(RDS_ON_GS66516T, Imax, M, phi) + ...
        P_COND_NPC_INNERSW(Imax/sqrt(2), RDS_ON_GS66516T) + ...
        P_SW_NPC_OUTERSW(tRise_GS66516T, tFall_GS66516T, fsw, VDC, Imax, phi)  + ...
        P_SW_NPC_INNERSW(tRise_GS66516T, tFall_GS66516T, fsw, VDC, Imax, phi);
%         + ...
%         P_DIODE_NPC_COND(Vf, Imax, M, phi);
%     
%     %GS66508T
%     P_NPC_GS66508T = ...
%         P_COND_NPC_OUTERSW(RDS_ON_GS66508T, Imax, M, phi) + ...
%         P_COND_NPC_INNERSW(Imax/sqrt(2), RDS_ON_GS66508T) + ...
%         P_SW_NPC_OUTERSW(tRise_GS66508T, tFall_GS66508T, fsw, VDC, Imax, phi)  + ...
%         P_SW_NPC_INNERSW(tRise_GS66508T, tFall_GS66508T, fsw, VDC, Imax, phi) + ...
%         P_DIODE_NPC_COND(Vf, Imax, M, phi);
    fprintf('Phase Angle 1 | %f\n', phi);
    fprintf('GS66516T NPC Loss | %f W\n\n',P_NPC_GS66516T(j));
%     fprintf('GS66508T NPC Loss | %f W\n',P_NPC_GS66508T);
end


%FC Loss Approximation
%GS66516T
P_FC_GS66516T = ...
    P_COND_FC(RDS_ON_GS66516T, Imax) + ...
    P_SW_FC(Eon_GS66516T, Eoff_GS66516T,fsw,VDC,Imax, Vref_GS66516T, Iref_GS66516T);

% %GS66508T
% P_FC_GS66508T = ...
%     P_COND_FC(RDS_ON_GS66508T, Imax) + ...
%     P_SW_FC(Eon_GS66508T, Eoff_GS66508T,fsw,VDC,Imax, Vref_GS66508T, Iref_GS66508T);

fprintf('GS66516T FC Loss | %f W\n\n',P_FC_GS66516T);
% fprintf('GS66508T FC Loss | %f W\n',P_FC_GS66508T);
GS66516T_FC_TOTAL_LOSS = P_FC_GS66516T*12;
GS66516TNPC_TOTAL_LOSS = 3*sum(P_NPC_GS66516T);
fprintf('GS66516T FC Total Loss | %f W\n',GS66516T_FC_TOTAL_LOSS);
fprintf('GS66516T NPC Total Loss | %f W\n',GS66516TNPC_TOTAL_LOSS);