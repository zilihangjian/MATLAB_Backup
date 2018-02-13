function [z] = HW8()
% function [] = HW8()
%HW 8 Johnathan Schaff (schaffjr)
clc; close all; clear
freq1 = 11025;%11025 Hz starting frequency
r = audiorecorder(freq1, 16, 1); %Record voice on single channel with 16 bits at 8kHz
fprintf('Press any key to begin recording\n');
pause();
recordblocking(r,1); %Record for one second
fprintf('Recording Complete\n');
fprintf('Part 1 Complete\n');

x = getaudiodata(r, 'double'); %Initial x[n] saved from recording in double format
x = x - mean(x);%Zero Mean Signal
fprintf('Part 2 Complete\n');

x = (0.45/(max(abs(x)))).*x;%Set max amplitude to 0.45
fprintf('Part 3 Complete\n');

fprintf('MAX of Signal | %g\nMIN of Signal | %g\n', max(x), min(x));
fprintf('Press any key to playback audio\n');
pause();
play(r); %Play the audio recording back
fprintf('Part 4 Complete\n');

audiowrite(strcat('OriginalWaveform_',num2str(freq1),'.wav'),x,freq1);
fprintf('Part 5 Complete\n');

%Multipath Generation
h = [0.85, zeros(1,3400), 0.55, zeros(1,1600), 0.40, zeros(1,3000), 0.30, ...
    zeros(1,2200), 0.20];
fprintf('Part 6 Complete\n');

y = conv(h,x);%Multipath Convolution
fprintf('Part 7 Complete\n');

ty = (0:length(y)-1)/freq1;%Accounts for time based off number of sampling points and sampling frequency
plot(ty,y,'r');
xlabel('Time (s)'); ylabel('Amplitude'); title('Convolution Plot')


n = rand(length(y),1) - 0.50;%Zero mean random noise vector
n =(.10 / max(abs(n))).*n;%Normalized random noise vector
fprintf('MAX of Noise | %g\nMIN of Noise | %g\n', max(n), min(n)); 
y = n + y;%Noise Corrupted Signal
fprintf('Part 8 Complete\n');

fprintf('Press any key to playback audio\n');
pause();
sound(y,freq1); %Play corrupted Audio
fprintf('Part 9 Complete\n');

%Cross Correlation
[z,~] = xcorr(x,y);
Ey = sum(y.^2);%Energy of Y Signal
Ex = sum(x.^2);%Energy of X Signal
z = z.*(1/(sqrt(Ex)*sqrt(Ey)));%Normalized Cross Correlation
fprintf('Part 10 Complete\n');

%Plotting
%Sampled for 1 second at a frequency of 11025 Hz
figure()
t = (0:length(z)-1)/freq1;%Accounts for time based off number of sampling points and sampling frequency
plot(t,z,'r');
xlabel('Time (s)'); ylabel('Amplitude'); title('Multi-path Plot')
fprintf('Part 11 Complete\n');

end