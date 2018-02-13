[x, Fs] = audioread('test2.wav');
% Play x[k]  
r = audioplayer(x, Fs);
play(r);

T = 1/Fs;
L = 10000; %  Length of signal in milliseconds
t = (0:L-1)*T; %  time vector
%  4. Get the magnitude and phase spectra of x[k] with fft command and plot it. (Note: x-axis unit needs to be Hz and y-axis unit needs to be dB (magnitude spectrum) or radian (phase spectrum)) a. Since fft(x) will generate a complex valued array, you need to use Matlab
%  command ‘abs’ and ‘angle’ to get magnitude and phase spectrum of your
%  signal. b. You only need to plot the first-half of you FFT result. Why?
clc; close all;
FastFourier = fft(x);
%Magnitude of signal
P2 = abs(FastFourier/L); %find magnitude of each Fourier value
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);
%Phase of the signal
P3 = angle(FastFourier); %find angle of each Fourier value
P4 = P3(1:L/2+1);

f = Fs*(0:(L/2))/L; % Frequency Values
figure()
plot(f,P1)
title('Amplitude Spectrum of X(t)')
xlabel('f (Hz)')
ylabel('|P1(f)|')
figure()
plot(f, P4);
title('Phase Spectrum of X(t)')
xlabel('f (Hz)')
ylabel('Phase (Radians)')
%  5. The signal (x[k]) is corrupted by low-frequency and high-frequency noises.  Based on the magnitude spectrum you got in step 4, design a bandpass digital IIR filter to remove these noises. 
W1 = 1350.0/Fs * 2;
W2 = 5688.0/Fs * 2;
[b,a] = butter(12,[W1, W2],'bandpass');
%  6. Plot the frequency response spectra of the bandpass filter with freqz command (x-axis unit: Hz) 
figure()
freqz(b,a,1024,Fs);
%  7. Use the bandpass filter you designed to filter the x[k] and save your result into y[k]. 
y = filter(b,a,x);
%  8. Play y[k].
r = audioplayer(y, Fs);
play(r);
%  9. Get the magnitude and phase spectra of y[k] with fft command and plot it. (Note: x-axis unit needs to be Hz and y-axis unit needs to be dB (magnitude spectrum) or radian (phase spectrum)) 
FastFourier = fft(y);
P2 = abs(FastFourier/L); %find magnitude of each Fourier value
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);
P3 = angle(FastFourier); %find angle of each Fourier value
P4 = P3(1:L/2+1);

f = Fs*(0:(L/2))/L; % Frequency Values
figure()
plot(f,P1)
title('Amplitude Spectrum of Y(t)')
xlabel('f (Hz)')
ylabel('|P1(f)|')
figure()
plot(f, P4);
title('Phase Spectrum of Y(t)')
xlabel('f (Hz)')
ylabel('Phase (Radians)')
%  10. Save y[k] into a wav format file.
audiowrite('FilteredFightSong.wav', y, Fs);