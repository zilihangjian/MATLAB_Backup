function [spatialMatrix] = createSineWave(amp, bias, freq, ph, t,SNR_dB)
%function [spatialMatrix] = createSineWave(amp, bias, freq, ph, t, samples,SNR_dB)
close all
%Variable Declaration
amplitude = amp; offset = bias;
frequency = freq; phase = ph;
samples = 2*frequency;%Nyquist Theorem
time = linspace(0,t,samples);%Time Vector
outWave = amplitude.*sin(frequency.*time + phase) + offset;
[noisyOutWave, ~] = awgn(outWave,SNR_dB);
time = time'; outWave = outWave'; noisyOutWave = noisyOutWave';
spatialMatrix = cat(2,time,noisyOutWave);

figure();
plot(time, noisyOutWave,'b');
hold on; 
plot(time, outWave,'r');
title('Plot Overlay');
legend('AWGN Altered Wave','Orignal Sine Wave');
xlabel('Time Dimension');
ylabel('Amplitude');

end