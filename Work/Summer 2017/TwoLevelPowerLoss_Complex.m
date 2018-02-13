%2 Level Power Loss
%M modulation index
%phi displacement power factor angle (phase angle between the current and
%voltage)
%B boundary condition
%Imax maximum current through the MOSFET
%Ron MOSFET datasheet characteristic
%Rd dynamic resistance associated with the diode IF_VF curve
%Vd bias voltage associated with the diode IF_VF curve

%Boundary Condition Equation
%Imax*sin(B) = Vd / Ron
%B = asin(Vd /(Ron*Imax))
%From Investigation and Implementation of MOSFETs losses Equations in a
%Three-Phase Inverter
clc; clear
P_FET_COND = @(Imax, B, M, phi, Ron, Rd,Vd)(((1/(8*pi))*(Imax^2)*Ron)*[pi + B + ...
    M*cos(phi + B) + M*cos(phi) - 0.50*sin(2*B) + 0.50*M*cos(phi - B) + ...
    0.50*M*cos(phi) - (1/6)*M*cos(phi + (3*B)) - (1/6)*M*cos(phi)] + ...
    ((1/(8*pi))*Ron*Imax.^2)*[B - M*cos(phi) + M*cos(phi - B) - ...
    0.50*sin(2*B)*0.50*M*cos(phi) + 0.50*M*cos(phi + B) + (M/6)*cos(phi) - ...
    (M/6)*cos(phi - (3*B))] + ((1/(4*pi))*(Ron/(Ron+Rd).^2))* ...
    [(((Rd^2)*(Imax^2))*(2*pi - 4*B + 2*sin(2*B))) + (Vd^2)*(pi - 2*B) + ...
    4*Rd*Imax*cos(B)] + ((M/12)*(Rd^2)*(Imax^2))*[-9*cos(B - phi) ...
    - 9*cos(B + phi) + 3*cos(3*B - phi) + cos(3*B + phi)] - ...
    (M*Vd^2)*[cos(phi - B) + cos(phi + B)] - (0.50*M*Rd*Imax)*...
    [(2*pi - 4*B)*cos(phi) + sin(2*B - phi) + sin(2*B + phi)]); %#ok<NBRAK>

P_DIODE_COND = @(Imax, B, M, phi, Ron, Rd, Vd) (((1/(4*pi))*(1/(Rd + Ron)^2))*...
    [0.50*M*(Ron - Rd)*(-Vd)*Ron*Imax*(pi-2*B)*cos(phi) + sin(2*B - phi) + sin(2*B + phi)] + ...
    (M*Ron*Vd^2)*[cos(phi - B) + cos(phi + B)] + ((M*Rd*(Ron^2)*Imax^2)/12)*[...
    -9*cos(phi+B) - 9*cos(phi - B) + cos(phi - 3*B) + cos(phi + 3*B)] + ...
    2*(Ron - Rd)*Vd*Ron*Imax*cos(B) - (Ron*Vd^2)*(pi - 2*B) + ...
    ((Rd*(Ron^2)*(Imax^2))/4)*(2*pi - B + 2*sin(2*B)));%#ok<NBRAK>

%From Design of a 48 V three-phase inverter for automotive applications
%Accounts for both the diode and the MOSFET in the inverter
Psw = @(VDC,tr,tdON, Qrr, IoutRMS,tf, tdOFF, fsw) (VDC*fsw*(IoutRMS*(sqrt(2)/pi))...
    *((((tr + tdON))/2) + ((tf + tdOFF)/2)) + (1.25*Qrr));


%Universal Constants
fsw = 50e3;%50kHz Switching Frequency
M = 1;%Modulation Index of 1 | Can be altered
VDC = 48;%48 Volt DC Input
fc = 300;%Load frequency of 300 Hz
%Diode Characteristics based on C3D08060A Zener Diode RecTM
Rd = 0.0724;
Vd = 0.9099;
Imax = 51.25;
phi = ((pi/180));
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
B_CAS300M12BM2 = asin(Vd /(RDS_ON_CAS300M12BM2*Imax));
PLOSS_CAS300M12BM2 = P_FET_COND(Imax, B_CAS300M12BM2, M, phi, RDS_ON_CAS300M12BM2, Rd, Vd) + ...
    P_DIODE_COND(Imax, B_CAS300M12BM2, M, phi, RDS_ON_CAS300M12BM2,Rd, Vd) + ...
    Psw(VDC,tr_CAS300M12BM2,tdON_CAS300M12BM2, Qrr, Imax/sqrt(2),tf_CAS300M12BM2, tdOFF_CAS300M12BM2, fsw);
%--------------------------------------------------------------------------
%WAS300M12BM2
%--------------------------------------------------------------------------
RDS_ON_WAS300M12BM2 = 4.2e-3;
tr_WAS300M12BM2 = 69e-9;
tdON_WAS300M12BM2 = 76e-9;
tf_WAS300M12BM2 = 43e-9;
tdOFF_WAS300M12BM2 = 168e-9;
B_WAS300M12BM2 = asin(Vd /(RDS_ON_WAS300M12BM2*Imax));
PLOSS_WAS300M12BM2 = P_FET_COND(Imax, B_WAS300M12BM2, M, phi, RDS_ON_WAS300M12BM2, Rd,Vd) + ...
    P_DIODE_COND(Imax, B_WAS300M12BM2, M, phi,RDS_ON_WAS300M12BM2,Rd, Vd) + ...
    Psw(VDC, tr_WAS300M12BM2, tdON_WAS300M12BM2, Qrr,Imax/sqrt(2), tf_WAS300M12BM2, tdOFF_WAS300M12BM2, fsw);

%--------------------------------------------------------------------------
%CAS325M12HM2
%--------------------------------------------------------------------------
%Estimate the time values based on the energy graphs geometry
RDS_ON_CAS325M12HM2 = 3.6e-3;
tr_CAS325M12HM2 = 22.9e-9;
tdON_CAS325M12HM2 = 45e-9;
tf_CAS325M12HM2 = 62.5e-9;
tdOFF_CAS325M12HM2 = 125e-9;
B_CAS325M12HM2 = asin(Vd /(RDS_ON_CAS325M12HM2*Imax));
PLOSS_CAS325M12HM2 = P_FET_COND(Imax, B_CAS325M12HM2, M, phi, RDS_ON_CAS325M12HM2, Rd,Vd) + ...
    P_DIODE_COND(Imax, B_CAS325M12HM2, M, phi,RDS_ON_CAS325M12HM2,Rd, Vd) + ...
    Psw(VDC, tr_CAS325M12HM2,tdON_CAS325M12HM2, Qrr, Imax/sqrt(2),tf_CAS325M12HM2, tdOFF_CAS325M12HM2, fsw);

fprintf('CAS300M12BM2 2 Level Loss | %f W\n',PLOSS_CAS300M12BM2);
fprintf('WAS300M12BM2 2 Level Loss | %f W\n',PLOSS_WAS300M12BM2);
fprintf('CAS325M12HM2 2 Level Loss | %f W\n',PLOSS_CAS325M12HM2);


