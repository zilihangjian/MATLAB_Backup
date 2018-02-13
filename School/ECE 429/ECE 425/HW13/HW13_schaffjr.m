function [] = HW13_schaffjr()
% function [] = HW11_schaffjr
%HW 13 Johnathan Schaff (schaffjr)
close all; clc;

[x,Fs] = audioread('test2.wav');%Save vector for test voice signal
fprintf('Part 2 Complete\n');
sound(x,Fs);
pause(10);

fprintf('Part 3 Complete\n');
L = length(x);%Length of signal
X = fft(x);%Fast Fourier Transform of the signal
mag = abs(X);%Magnitude of fft of original signal
magdB = 20*log10(mag);%Convert the magnitude to decibels
%Flip Signal
magnitudeSpectrum = magdB(1:L/2+1);
magnitudeSpectrum(2:end-1) = 2*magnitudeSpectrum(2:end-1);

pha1 = (angle(X));%Phase of fft of original signal
pha1un = unwrap(pha1);
phaseSpectrum = pha1(1:L/2+1);
phaseSpectrum(2:end-1) = 2*phaseSpectrum(2:end-1);

phaseSpectrumUn = pha1un(1:L/2+1);
phaseSpectrumUn(2:end-1) = 2*phaseSpectrumUn(2:end-1);

fprintf('Part 4 Complete\n');

%FFT Plot
freqVect = Fs*(0:(L/2))/L;%Frequency Vector
figure()
plot(freqVect,magnitudeSpectrum,'b');%Magnitude Spectrum Plot of Original Spectrum
xlabel('Frequency (Hz)');
ylabel('Magnitude (dB)');
title('Magnitude Spectrum of Original Spectrum');

figure()
plot(freqVect,phaseSpectrum,'b');%Phase Spectrum Plot of Original Spectrum
xlabel('Frequency (Hz)');
ylabel('Phase (rad)');
title('Phase Spectrum of Original Spectrum');

figure()
plot(freqVect,phaseSpectrumUn,'b');%Phase Spectrum Plot of Original Spectrum
xlabel('Frequency (Hz)');
ylabel('Phase');
title('Unwrapped Phase Spectrum of Original Spectrum');

% %Freqz Plot for Comparison
% figure()
% freqz(x,1,1024,Fs);

%Filter
W = 2.*[1500 5800]./Fs;
[B1,A1] = butter(7,W, 'bandpass');
fprintf('Part 5 Complete\n');
figure()
freqz(B1,A1,1024,Fs);%Frequency spectrum of filter
title('Frequency Spectrum of Filter');
fprintf('Part 6 Complete\n');

%Applying Filter
y = filter(B1, A1, x);
fprintf('Part 7 Complete\n');
sound(y,Fs);
pause(10);
fprintf('Part 8 Complete\n');

L = length(x);%Length of signal
Y = fft(y);%Fast Fourier Transform of the signal
magY = abs(Y);%Magnitude of fft of original signal
magYdB = 20*log10(magY);%Convert the magnitude to decibels
%Flip Signal
magnitudeSpectrumY = magYdB(1:L/2+1);
magnitudeSpectrumY(2:end-1) = 2*magnitudeSpectrumY(2:end-1);

phaY = (angle(Y));%Phase of fft of original signal
phaYUn = unwrap(phaY);
phaseSpectrumY = phaY(1:L/2+1);
phaseSpectrumY(2:end-1) = 2*phaseSpectrumY(2:end-1);

phaseSpectrumYUn = phaYUn(1:L/2+1);
phaseSpectrumYUn(2:end-1) = 2*phaseSpectrumYUn(2:end-1);

figure()
plot(freqVect,magnitudeSpectrumY,'r');%Magnitude Spectrum Plot of Original Spectrum
xlabel('Frequency (Hz)');
ylabel('Magnitude (dB)');
title('Magnitude Spectrum of Original Spectrum');

figure()
plot(freqVect,phaseSpectrumY,'r');%Phase Spectrum Plot of Original Spectrum
xlabel('Frequency (Hz)');
ylabel('Phase (rad)');
title('Phase Spectrum of Filtered Spectrum');
fprintf('Part 9 Complete\n');

figure()
plot(freqVect,phaseSpectrumYUn,'r');%Phase Spectrum Plot of Original Spectrum
xlabel('Frequency (Hz)');
ylabel('Phase');
title('Unwrapped Phase Spectrum of Filtered Spectrum');
fprintf('Part 9 Complete\n');

% figure()
% freqz(y,1,1024,Fs);

audiowrite('FilteredOutput.wav', y, Fs);
fprintf('Part 10 Complete\n');
end