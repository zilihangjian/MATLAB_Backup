% http://eeweb.poly.edu/~yao/EE3414/quantization.pdf
% https://stackoverflow.com/questions/25714491/quantize-data-in-matlab
clc; close all; clear
t = linspace(-1,1,10000);
signal = 1-abs(t);
figure()
plot(t,signal);
bits = 2;
qOut = floor(2^bits*signal)/2^bits;
hold on
plot(t,qOut);
