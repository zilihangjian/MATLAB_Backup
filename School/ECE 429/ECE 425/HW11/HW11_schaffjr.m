function [] = HW11_schaffjr()
% function [] = HW11_schaffjr
%HW 11 Johnathan Schaff (schaffjr)
close all; clc;
[x,Fs] = audioread('test_voice.wav');%Save vector for test voice signal
fprintf('Part 1 Complete\n');
figure()
freqz(x,1,1024, Fs);
title('Unfiltered Spectrum')

fprintf('Part 2 Complete\n');
sound(x,Fs);
pause(4);
% window the ideal coefficients
N = 7; %filter order / Number of taps
wc1 = (2*pi*1620)/8000;%Lower cutoff frequency
wc2 = (2*pi*3500)/8000;%Upper cutoff frequency 
n = -((N-1)/2):((N-1)/2); %Symmetric about zero
n = n+(n==0)*eps; % avoiding division by zero
h = -(sin(n*wc2) - sin(n*wc1))./(n*pi); % generate sequence of ideal coefficients
h(ceil(N/2)) = 1 + h(ceil(N/2));%Accounts for band stop
windFunc = rectwin(N)';%Rectangular Window Function 
d = h.*windFunc;%Filter Coefficients after windowing
fprintf('Part 3 Complete\n');
figure()
freqz(d,1,1024,Fs); % transform into frequency domain for plotting 
title('Filter Spectrum')
fprintf('Part 4 Complete\n');

%Filtering Operation
y = filter(h,1,x);
fprintf('Part 5 Complete\n');
sound(y,Fs);
fprintf('Part 6 Complete\n');
audiowrite('FilteredWaveform.wav', y,Fs);
fprintf('Part 7 Complete\n');
figure()
freqz(y,1,1024,Fs);
title('Filtered Spectrum')

%Output for Report
%Cutoff Frequencies
fprintf('Stopband Edge 1 | %g\nStopband Edge 2 | %g\n', wc1,wc2);
fprintf('Stopband Frequency 1 | %g\nStopband Frequency 2 | %g\n', ...
    (wc1*(8000)/(2*pi)),(wc2*(8000)/(2*pi)));
coeff = sprintf('%g, ', h);
fprintf('Filter Coefficients | %s\n',coeff);
index = sprintf('%g, ', round(n));
fprintf('Filter Indexes | %s\n',(index));
fprintf('Filter Order | %g\n', N);
fprintf('Window Function | Rectangular\n');
end