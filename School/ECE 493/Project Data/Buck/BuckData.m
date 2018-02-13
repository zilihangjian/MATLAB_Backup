clear; close all;
clc;
load('BuckData');
figure()
hold on
plot(Time, IOUT,'r');
plot(Time, VDS0,'b');
plot(Time, VDS1,'g');
xlabel('Sampling(time)')
ylabel('IOUT')
title('Buck Converter');
hold off

%Processing
%Measured with Data Cursor on Graph
t1Ind = 2172;
t2Ind = 2174;
del_t1 = abs(Time(t1Ind) - Time(t2Ind));
numTimePoints = length(t1Ind:t2Ind);
E1 = ((sum(VDS0(t1Ind:t2Ind,1))./numTimePoints) + ...
    (sum(IOUT(t1Ind:t2Ind,1))./numTimePoints)).*del_t1;
P1 = E1 ./del_t1;

E2 = ((sum(VDS1(t1Ind:t2Ind,1))./numTimePoints) + ...
    (sum(IOUT(t1Ind:t2Ind,1))./numTimePoints)).*del_t1;
P2 = E2 ./del_t1;

figure()
hold on;
plot(Time(t1Ind:t2Ind,1), VDS1(t1Ind:t2Ind,1),'r');
plot(Time(t1Ind:t2Ind,1), VDS0(t1Ind:t2Ind,1),'b');
xlabel('Sampling')
ylabel('VDS')
title('Switching Loss')
hold off

fprintf('ENERGY OFF | %dJ\nENERGY ON | %dJ\n',E1,E1);
fprintf('POWER OFF | %fW\nPOWER ON | %fW\n',P1,P2);


