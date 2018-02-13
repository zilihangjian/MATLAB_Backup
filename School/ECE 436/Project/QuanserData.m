clc; close all; clear;
% %--------------------------------------------------------------------------
% %First Experiment 1 V Cart Data
% %--------------------------------------------------------------------------
% load('1VCartData')
% step = time(2) - time(1);%Universal Step Size 
% cartP1V = cartPosition;
% gradP1V = gradient(cartP1V,step);
% time1V = time;
% figure()
% subplot(2,1,1);
% plot(time1V, cartP1V);
% title('1V Data');
% subplot(2,1,2);
% plot(time1V, gradP1V);
% title('1V Gradient');
% %Flat Line Detection
% filterGrad1V = movingAverage(gradP1V,11);
% figure()
% hold on;
% plot(time1V, filterGrad1V, time1V, gradP1V);
% [slopeVect1V, ~] = slopeDetermination(filterGrad1V,time1V, step);
% slopeCoeff1V = mean(slopeVect1V);
% fprintf('Cart 1V Slope Coefficient | %g\n', slopeCoeff1V);
% %--------------------------------------------------------------------------
% %Second Experiment 3 V Cart Data
% %--------------------------------------------------------------------------
% load('3VCartData')
% cartP3V = cartPosition;
% gradP3V = gradient(cartP3V,step);
% time3V = time;
% figure()
% subplot(2,1,1);
% plot(time3V, cartP3V);
% title('3V Data');
% subplot(2,1,2);
% plot(time3V, gradient(cartP3V,step));
% title('3V Gradient');
% %Flat Line Detection
% filterGrad3V = movingAverage(gradP3V,11);
% figure()
% hold on;
% plot(time3V, filterGrad3V, time3V, gradP3V);
% [slopeVect3V, ~] = slopeDetermination(filterGrad3V,time3V, step);
% slopeCoeff3V = mean(slopeVect3V);
% fprintf('Cart 3V Slope Coefficient | %g\n', slopeCoeff3V);
%--------------------------------------------------------------------------
%Third Experiment 3 V Cart Data (with Mass)
%--------------------------------------------------------------------------
load('3VMCartData')
step = time(2) - time(1);%Universal Step Size
cartP3VM = cartPosition;
gradP3VM = gradient(cartP3VM,step);
time3VM = time;
figure()
subplot(2,1,1);
plot(time3VM, cartP3VM);
title('3V Data (With Mass)');
subplot(2,1,2);
plot(time3VM, gradient(cartP3VM,step));
title('3V Gradient');
%Flat Line Detection
filterGrad3VM = movingAverage(gradP3VM,11);
figure()
hold on;
plot(time3VM, filterGrad3VM, time3VM, gradP3VM);
[slopeVect3VM, ~] = slopeDetermination(filterGrad3VM,time3VM, step);
slopeCoeff3VM = mean(slopeVect3VM);
fprintf('Cart 3VM Slope Coefficient | %g\n', slopeCoeff3VM);
% %--------------------------------------------------------------------------
% %Fourth Experiment 5 V Cart Data
% %--------------------------------------------------------------------------
% load('5VCartData')
% cartP5V = cartPosition;
% gradP5V = gradient(cartP5V,step);
% time5V = time;
% figure()
% subplot(2,1,1);
% plot(time5V, cartP5V);
% title('5V Data');
% subplot(2,1,2);
% plot(time5V, gradient(cartP5V,step));
% title('5V Gradient');
% %Flat Line Detection
% filterGrad5V = movingAverage(gradP5V,11);
% figure()
% hold on;
% plot(time5V, filterGrad5V, time5V, gradP5V);
% [slopeVect5V, ~] = slopeDetermination(filterGrad5V,time5V, step);
% slopeCoeff5V = mean(slopeVect5V);
% fprintf('Cart 5V Slope Coefficient | %g\n', slopeCoeff5V);
%--------------------------------------------------------------------------
%Fifth Experiment 0V Tilt Data
%--------------------------------------------------------------------------
load('0VTiltData')
cartT0V = cartPosition;
gradT0V = gradient(cartT0V,step);
timeT0V = time;
figure()
subplot(2,1,1);
plot(timeT0V, cartT0V);
title('0V Tilt Data');
subplot(2,1,2);
plot(timeT0V, gradient(cartT0V,step));
title('0V Tilt Gradient');
clear('time', 'cartPosition')
%Flat Line Detection
filterGradT0V = movingAverage(gradT0V,11);
figure()
hold on;
plot(timeT0V, filterGradT0V, timeT0V, gradT0V);
[slopeVectT0V, ~] = slopeDetermination(filterGradT0V,timeT0V, step);
slopeCoeffT0V = mean(slopeVectT0V);
fprintf('Cart T0V Slope Coefficient | %g\n', slopeCoeffT0V);