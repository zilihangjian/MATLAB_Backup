close all; 
clear;
fc = 8000/44100; % cut-off frequency 
N = 5;
% number of taps
n = -((N-1)/2):((N-1)/2); 
n = n+(n==0)*eps; % avoiding division by zero
[h] = sin(n*2*pi*fc)./(n*pi); % generate sequence of ideal coefficients 
[w] = 0.54 + 0.46*cos(2*pi*n/N); % generate window function 
d = h.*w;
% window the ideal coefficients
[g,f] = freqz(d,1,512,44100); % transform into frequency domain for plotting
figure(1) 
plot(f,20*log10(abs(g))); % plot transfer function axis([0  2*10^4 -70 10]);
figure(2); 
stem(d);
% plot coefficient values
xlabel('Coefficient number'); 
ylabel ('Value'); 
title('Truncated Impulse Response');
figure(3); 
freqz(d,1,512,44100); % use freqz to plot magnitude and phase response axis([0  2*10^4 -70 10]);