clear; close all;
clc;
load('tek0001ALL');

Rcheck = 0.11;
CH4 = CH4.*(1/Rcheck);%Due to osciloscope measuring voltage and not current
%need to voltage across known resistance to find the current

figure()
plot(time, CH2,'r');
xlabel('Sampling')
ylabel('Channel 2 Voltage')
title('Double Pulse');

figure()
plot(time, CH3,'b');
xlabel('Sampling')
ylabel('Channel 3 Voltage')
title('Double Pulse');

figure()
plot(time, CH4,'g');
xlabel('Sampling')
ylabel('Channel 4 Current')
title('Double Pulse');

%All Plots
figure()
hold on;
plot(time, CH2,'r');
plot(time, CH3,'b');
plot(time, CH4,'g');
legend('VGS','VDS','IDS','Location','northwest')
xlabel('Sampling')
ylabel('All Channels')
title('All Waveforms');
hold off

%Processing
%Measured with Data Cursor on Graph
t1 = 3.794e-05;
t2 = 3.808e-05;

del_t1 = abs(t1-t2);

t1Ind = find(time == t1);
t2Ind = find(time == t2);
numTimePoints = length(t1Ind:t2Ind);
EOFF = ((sum(CH3(t1Ind:t2Ind,1))./numTimePoints) + ...
    (sum(CH4(t1Ind:t2Ind,1))./numTimePoints)).*del_t1;
POFF = EOFF ./del_t1;
%Turn Off Plot
figure()
hold on;
plot(time(t1Ind:t2Ind,1), CH2(t1Ind:t2Ind,1),'r');
plot(time(t1Ind:t2Ind,1), CH3(t1Ind:t2Ind,1),'b');
plot(time(t1Ind:t2Ind,1), CH4(t1Ind:t2Ind,1),'g');
legend('VGS','VDS','IDS','Location','northwest')
xlabel('Sampling')
ylabel('All Channels')
title('Turn Off Waveforms');
hold off

t3 = 4.8e-05;
t4 = 4.814e-05;
del_t2 = abs(t3-t4);

%Energy Calculation

t3Ind = find(time == t3);
t4Ind = find(time == t4);
numTimePoints2 = length(t3Ind:t4Ind);
EON = ((sum(CH3(t3Ind:t4Ind,1))./numTimePoints2) + ...
    (sum(CH4(t3Ind:t4Ind,1))./numTimePoints2)).*del_t2;
PON = EON./del_t2;

%Turn On Plot
figure()
hold on;
plot(time(t3Ind:t4Ind,1), CH2(t3Ind:t4Ind,1),'r');
plot(time(t3Ind:t4Ind,1), CH3(t3Ind:t4Ind,1),'b');
plot(time(t3Ind:t4Ind,1), CH4(t3Ind:t4Ind,1),'g');
legend('VGS','VDS','IDS','Location','northwest')
xlabel('Sampling')
ylabel('All Channels')
title('Turn On Waveforms');
hold off

fprintf('ENERGY OFF | %dJ\nENERGY ON | %dJ\n',EOFF,EON);
fprintf('POWER OFF | %fW\nPOWER ON | %fW\n',POFF,PON);


