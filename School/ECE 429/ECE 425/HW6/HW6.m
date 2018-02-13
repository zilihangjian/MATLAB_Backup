function [] = HW6()
% function [] = HW6(freq)
%HW 6 Johnathan Schaff (schaffjr)
clc;
freq1 = 8000;%8000 Hz starting frequency
r = audiorecorder(freq1, 16, 1); %Record voice on single channel with 16 bits at 8kHz
fprintf('Press any key to begin recording\n');
pause();
recordblocking(r,2); %Record for two seconds
fprintf('Recording Complete\n');
x = getaudiodata(r, 'double'); %Initial x[n] saved from recording in double format
x = (0.85/(max(abs(x)))).*x;%Set max amplitude to 0.85
fprintf('MAX of Signal | %g\nMIN of Signal | %g\n', max(x), min(x));
fprintf('Part 1 Complete\n');
fprintf('Press any key to playback audio\n');
pause();
play(r); %Play the audio recording back
fprintf('Part 2 Complete\n');

%Add Noise
noise = randn(length(x),1);%Noise Vector
noise = (.10 / max(abs(noise))).*noise; %Set max amplitude to 0.10
fprintf('MAX of Noise | %g\nMIN of Noise | %g\n', max(noise), min(noise));
fprintf('Part 3 Complete\n');
y = x + noise;%Noise Voice Data
fprintf('Press any key to playback Noisy Waveform\n');
pause();
sound(y, freq1);
fprintf('Part 4 Complete\n');

%Moving Average Filter Design
%Due to MATLAB starting to index at 1 rather than zero, the vector needs to be shifted by 1 to account for it
B = 0.10.*ones(1,10);
A = 1;
z = filter(B,A,y);
fprintf('Part 5 Complete\n');

fprintf('Press any key to playback Filtered Waveform \n');
pause();
sound(z, freq1);%Play the sound at the specified 8kHz frequency
fprintf('Part 6 Complete\n');

%Error Calculation
e = x - z;%Error Sequence
fprintf('Part 7 Complete\n');
relativeE = sqrt(sum(abs(e).^2) / sum(abs(x).^2));%Relative Error
fprintf('Part 8 Complete\n');
fprintf('Relative Error | %g\n', relativeE);
audiowrite(strcat('OriginalWaveform_',num2str(freq1),'.wav'),x,freq1);
audiowrite(strcat('NoisyWaveform_',num2str(freq1),'.wav'),y,freq1);
audiowrite(strcat('FilteredWaveform_',num2str(freq1),'.wav'),z,freq1);
fprintf('Part 9 Complete\n');
fprintf('Part 10: Next Frequency\n');

freq2 = 44100; %44100 Hz
r = audiorecorder(freq2, 16, 1); %Record voice on single channel with 16 bits at 8kHz
fprintf('Press any key to begin recording\n');
pause();
recordblocking(r,2); %Record for two seconds
fprintf('Recording Complete\n');
x = getaudiodata(r, 'double'); %Initial x[n] saved from recording in double format
x = (0.85/(max(abs(x)))).*x;%Set max amplitude to 0.85
fprintf('MAX of Signal | %g\nMIN of Signal | %g\n', max(x), min(x));
fprintf('Part 1 Complete\n');
fprintf('Press any key to playback audio\n');
pause();
play(r); %Play the audio recording back
fprintf('Part 2 Complete\n');

%Add Noise
noise = randn(length(x),1);%Noise Vector
noise = (.10 / max(abs(noise))).*noise; %Set max amplitude to 0.10
fprintf('MAX of Noise | %g\nMIN of Noise | %g\n', max(noise), min(noise));
fprintf('Part 3 Complete\n');
y = x + noise;%Noise Voice Data
fprintf('Press any key to playback Noisy Waveform\n');
pause();
sound(y, freq2);
fprintf('Part 4 Complete\n');

%Moving Average Filter Design
%Due to MATLAB starting to index at 1 rather than zero, the vector needs to be shifted by 1 to account for it
B = 0.10.*ones(1,10);
A = 1;
z = filter(B,A,y);
fprintf('Part 5 Complete\n');

fprintf('Press any key to playback Filtered Waveform \n');
pause();
sound(z, freq2);%Play the sound at the specified 8kHz frequency
fprintf('Part 6 Complete\n');

%Error Calculation
e = x - z;%Error Sequence
fprintf('Part 7 Complete\n');
relativeE = sqrt(sum(abs(e).^2) / sum(abs(x).^2));%Relative Error
fprintf('Part 8 Complete\n');
fprintf('Relative Error | %g\n', relativeE);
audiowrite(strcat('OriginalWaveform_',num2str(freq2),'.wav'),x,freq2);
audiowrite(strcat('NoisyWaveform_',num2str(freq2),'.wav'),y,freq2);
audiowrite(strcat('FilteredWaveform_',num2str(freq2),'.wav'),z,freq2);
fprintf('Part 9 Complete\n');
end