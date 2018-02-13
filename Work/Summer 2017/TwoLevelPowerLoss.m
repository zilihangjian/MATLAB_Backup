%2 Level 3 Phase Inverter Power Loss
clc; clear

%From Design of a 48 V three-phase inverter for automotive applications
%Accounts for both the diode and the MOSFET in the inverter
P_FET_COND = @(RDS_ON, IDrms)(RDS_ON*((IDrms^2)/sqrt(2)));

P_SW = @(VDC,tr,tdON, Qrr, IoutRMS,tf, tdOFF, fsw) (VDC*fsw*(IoutRMS*(sqrt(2)/pi))...
    *((((tr + tdON))/2) + ((tf + tdOFF)/2)) + (1.25*Qrr));

%Universal Constants
fsw = 50e3;%50kHz Switching Frequency
VDC = 48;%48 Volt DC Input
fc = 300;%Load frequency of 300 Hz
Imax = 51.25;
%Diode Characteristics based on C3D08060A Zener Diode RecTM
Qrr = 0;%Value not provided by data sheet, so the reverse recovery
%characteristics will be ignored in our assumptions
%--------------------------------------------------------------------------
%CAS300M12BM2
%--------------------------------------------------------------------------
RDS_ON_CAS300M12BM2 = 4.2e-3;
tr_CAS300M12BM2 = 69e-9;
tdON_CAS300M12BM2 = 76e-9;
tf_CAS300M12BM2 = 43e-9;
tdOFF_CAS300M12BM2 = 168e-9;
PLOSS_CAS300M12BM2 = P_FET_COND(RDS_ON_CAS300M12BM2,Imax) + ...
    P_SW(VDC,tr_CAS300M12BM2,tdON_CAS300M12BM2, Qrr, Imax/sqrt(2),tf_CAS300M12BM2, tdOFF_CAS300M12BM2, fsw);
%--------------------------------------------------------------------------
%WAS300M12BM2
%--------------------------------------------------------------------------
RDS_ON_WAS300M12BM2 = 4.2e-3;
tr_WAS300M12BM2 = 69e-9;
tdON_WAS300M12BM2 = 76e-9;
tf_WAS300M12BM2 = 43e-9;
tdOFF_WAS300M12BM2 = 168e-9;
PLOSS_WAS300M12BM2 = P_FET_COND(RDS_ON_WAS300M12BM2,Imax) + ...
    P_SW(VDC, tr_WAS300M12BM2, tdON_WAS300M12BM2, Qrr,Imax/sqrt(2), tf_WAS300M12BM2, tdOFF_WAS300M12BM2, fsw);

%--------------------------------------------------------------------------
%CAS325M12HM2
%--------------------------------------------------------------------------
%Estimate the time values based on the energy graphs geometry
RDS_ON_CAS325M12HM2 = 3.6e-3;
tr_CAS325M12HM2 = 22.9e-9;
tdON_CAS325M12HM2 = 45e-9;
tf_CAS325M12HM2 = 62.5e-9;
tdOFF_CAS325M12HM2 = 125e-9;
PLOSS_CAS325M12HM2 = P_FET_COND(RDS_ON_CAS325M12HM2,Imax) + ...
    P_SW(VDC, tr_CAS325M12HM2,tdON_CAS325M12HM2, Qrr, Imax/sqrt(2),tf_CAS325M12HM2, tdOFF_CAS325M12HM2, fsw);

fprintf('CAS300M12BM2 2 Level Loss | %f W\n',PLOSS_CAS300M12BM2);
fprintf('WAS300M12BM2 2 Level Loss | %f W\n',PLOSS_WAS300M12BM2);
fprintf('CAS325M12HM2 2 Level Loss | %f W\n',PLOSS_CAS325M12HM2);


