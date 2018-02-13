clc; clear
load('tek0000ALL');
figure()
plot(time, CH2,'r');
xlabel('Time(s)')
ylabel('Channel 2 Voltage')
title('Voltage vs Time');

figure()
plot(time, CH3,'b');
xlabel('Time(s)')
ylabel('Channel 3 Voltage')
title('Voltage vs Time');

figure()
plot(time, CH4,'g');
xlabel('Time(s)')
ylabel('Channel 4 Current')
title('Current vs Time');

%All Plots
figure()
hold on;
plot(time, CH2,'r');
plot(time, CH3,'b');
plot(time, CH4,'g');
legend('VGS','VDS','IDS','Location','northwest')
xlabel('Time(s)')
ylabel('All Channels')
title('Channels vs Time');
hold off
