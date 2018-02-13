Vin = 450;
R = 5;
C = 5.5e-3;
ma = 0.723;
L = 5e-3;
fs = 50e3;
fc = 60;
Ta = 40;
Rjc = 2;%C/W
Rcs = 1;%C/W
Rds_on = 100e-3;
tON = 100e-9;
tOFF = 100e-9;

%a)
Vdc = (Vin*sqrt(2))/ma;
Vr = Vdc;
P0 = C*2*pi*fc*Vdc*2*Vr;
