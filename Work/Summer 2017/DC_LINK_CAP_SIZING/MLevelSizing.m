% Selecting Film Bus Link Capacitors
% For High Performance Inverter Applications
%Analytical Expression for RMS DC Link Capacitor Current in a Three-Level Inverter 
% Selecting Film Bus Link Capacitors For High Performance Inverter Applications

tAmbient = 25;%25 Degrees Celsius
RESR = 1;%Equivalent Series Resistance of Capacitor
Rthca = 1;%thermal resistance between capacitor can and ambient
IN = 20; 
VDC = 540;%DC input voltage
Vcap = (VDC/2);
phi = 1;%power factor
M = 0.602;%Modulation Index
IRMS = sqrt(3*(IN.^2)*M*((sqrt(3)+cos(2*phi)*(2/sqrt(3)))));
IAVG = 0.75*IN*M*cos(phi);
IcapRMS = sqrt(IRMS.^2 - IAVG.^2);
IcapMax = IcapRMS*sqrt(2);



