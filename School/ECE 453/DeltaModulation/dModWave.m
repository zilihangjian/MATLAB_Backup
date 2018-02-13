clc; clear; close all;

%Signal & Time
t = linspace(0,2*pi,300);
signal = 2*sin(t);
leng = length(signal);

%Modulation Step
delt = 0.5;

%Pre Allocation
deltaMod = zeros(1,leng);
modSteps = zeros(1,leng);
demodSteps = zeros(1,leng);

%Delta Modulation
for i = 1:leng-1
    if signal(i) > deltaMod(i)
        modSteps(i) = 1;
        deltaMod(i+1)=deltaMod(i) + delt;
    else
        modSteps(i) = 0;
        deltaMod(i+1) = deltaMod(i) - delt;
    end
end

%Modulation Plot
figure()
subplot(2,1,1);
stairs(t,deltaMod,'b');
hold on
plot(t,signal,'r');
hold off
title('Delta Modulation (Stairs Function)');
subplot(2,1,2);
plot(t,deltaMod,'b');
hold on
plot(t,signal,'r');
hold off
title('Delta Modulation (Plot Function)');