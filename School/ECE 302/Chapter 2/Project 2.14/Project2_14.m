%Project 2.14, Cmpute the signal values of the original 8000 samples/sec
%waveform over the period of 0 < t < 2 msec for a totla of 17 samples.
%Assume signal peaks of +-1 for the sine wave
%Part 1 and 2
clc; clear;
x = linspace(0, 2e-3, 17);
y = sin(2*pi*1000*x);
stem(x,y)
title('Sampling Waveform');
orig_samp = 12.5e-6;%This is the sampling rate originally used
Sample = transpose(0:16);
Time = zeros(17,1);
Time = Time + orig_samp*(Sample);
Value = zeros(17,1);
for n=1:17
    Value(n,1) = y(n);
end
T = table(Sample, Time, Value);
disp(T);
    
%Part 3
hold on;
Xi = 0:20.833333e-6:2e-3;
Yi = interp1(x,y,Xi);
stem (Xi,Yi,'xr');


