clc; close all;
distanceOffset = [10,20,30,40,50];
XtalkValues = [126.3715, 229.7317, 304.6690, 505.1985, 382.9089];
figure();
plot(distanceOffset, XtalkValues,'r-o');
xlabel('Distance Offset (MIL)');
ylabel('CrossTalk Values (mV)');
title('CrossTalk vs Distance Offset');

eyeVolts = [3.0905, 3.0287, 3.0464, 2.8962, 2.9139];
figure();
plot(distanceOffset, eyeVolts,'b-o');
xlabel('Distance Offset (MIL)');
ylabel('Open Eye Voltage (V)');
title('Open Eye Voltage vs Distance Offset');

figure();
plot(TimeDelayps, FEXTmV,'g-o');
xlabel('Time Delay (ps)');
ylabel('CrossTalk Values (mV)');
title('CrossTalk vs Time Delay');

figure();
plot(eVTime, eV,'k-o');
xlabel('Time Delay (ps)');
ylabel('Eye Opening Voltage');
title('Eye Opening Voltage vs Time Delay');

