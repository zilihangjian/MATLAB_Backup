% https://www.mathworks.com/help/signal/ref/square.html
% https://www.mathworks.com/help/matlab/ref/diff.html
clc; clear; close all;
t = 0:1/1e3:5;
y = square(2*pi*(0.50)*t,50) + 2;...
%     +randn(size(t))/10;
dutyC = dutycycle(y,t);

figure()
plot(t,y);
ylabel('Amplitude [V]');
xlabel('Time [s]');

%Approximate Derivative
h = 1e-2;%Step Size
Y = diff(y)/h;
figure()
plot(Y);
ylabel('Amplitude [V]');
xlabel('Time [s]');
