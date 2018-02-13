%Design Problem
%Assumptions: That the peak to peak ripple is exactly 5% in both cases for
%simplicity. Peaked an arbitrary frequency and matched the corresponding
%inductor and capacitance value based off the static ripple and static
%frequency. Maintained basic boost converter configuration. Also made the
%thermal heatsink temperature the maximum allowable temperature
clc; close all; clear;
D = 0.80;%Duty Cycle
Iout = 0.50;%Output Current (A)
Pout = 100;%Output Power (W)
Iin = 2.50;%Input Current (A)
Vin = 40;%Input Voltage (V) 
Vout = 200;%Output Voltage (V)
RDS_on = 50e-3;
Qrr = 10e-9;
Vf = 0.50;%Forward Voltage (V)
Ta = 40;%Ambient Temperature (C)
Ts = 85;%Heatsink Temperature (C)
tON = 20e-9;%On Time (s)
tOFF = 50e-9;%Off Time (s)
fValue = 125e3;%125kHz gate frequency

fs = linspace(20e3, 200e3,1000);%vary frequency from [20,200] kHz
%Equations
%5% ripple value for inductor current
iLMax = Iin * 1.05;
iLMin = Iin * 0.95;
iLpp = iLMax - iLMin;
L = ((Vin*D)./(iLpp.*fs));
figure()
hold on;
plot(fs,L,'r');
[~,index] = min(abs(fs - fValue));
plot(fValue,L(index),'go');
xlabel('Frequency')
ylabel('Inductor');
title('Frequency vs Inductor')

%5% ripple value capacitor voltage
VcMax = Vout * 1.05;
VcMin = Vout * 0.95;
Vcpp = VcMax - VcMin;
C = ((Vout * (1-D))./(8.*L.*Vcpp.*fs.^2));
figure()
hold on;
plot(fs,C,'r');
plot(fValue,C(index),'go');
xlabel('Frequency')
ylabel('Capacitor');
title('Frequency vs Capacitor')

%Power Loss
iQ1func = @(t) (((iLMax - iLMin/D).*t).^2);
iQ1RMS = sqrt(integral(iQ1func,0,D)); 
PcondQ1 = (iQ1RMS.^2).*RDS_on;
PswQ1 = 0.50*Vout*Iin*(tON + tOFF);
PcondD1 = Vf*Iin*(1-D);
PswD1 = Qrr.*Vout.*fs;
PQ1TOT = PcondQ1 + PswQ1;
PQ2TOT = PcondD1 + PswD1;
PTOT = PQ1TOT + PQ2TOT;
Rsa = (Ts - Ta)./(PTOT(index));
figure()
hold on
plot(fs,PTOT,'r');
plot(fValue, PTOT(index), 'go');
xlabel('Frequency')
ylabel('Power Loss');
title('Frequency vs Power Loss')

%Results
fprintf('Topology | Boost\nSwitchs | 2: 1 Diode and 1 MOSFET\n');
fprintf('Inductor Value | %d H\nCapacitor Value | %d F\n',L(index), C(index));
fprintf('Frequency | %d Hz\n', fValue);
fprintf('Total Power Loss | %f W\n', PTOT(index));
fprintf('Thermal Resistance | %f Ohms\n',Rsa);