function [modSteps] = dModVoice(delt, voiceMod)
% function [stepWave] = delmod(del, waveform)
%del | step size iteration for signal
%stepWave | Output Delta Modulation Signal
%Example | delmod(.07,'FilteredWaveform.wav')
clc; close all;
[voiceSig,Fs] = audioread(voiceMod);%Save vector for test voice signal
sound(voiceSig,Fs);
pause();                       
time = (0:1/Fs:(length(voiceSig)-1)/Fs)';
%Pre Allocation
voiceMod = zeros(1,length(voiceSig)-1);
modSteps = zeros(1,length(voiceSig)-1);

%Delta Modulation
for i = 1:length(voiceSig)-1
    if voiceMod(i) <= voiceSig(i)
        modSteps(i+1) = 1;
        voiceMod(i+1) = voiceMod(i) + delt;
    else
        modSteps(i+1) = 0;
        voiceMod(i+1) = voiceMod(i)-delt;
    end
end



%Plotting
figure()
plot(time,voiceSig)
hold on;
stairs(time,voiceMod)
sound(voiceMod,Fs);%Actual Delta Modulation
pause()
sound(modSteps,Fs);%Steps
pause()
title('Delta Modulation');
xlabel('Time')
ylabel('Amplitude') 
legend('Original Signal', 'Delta Modulation Signal');
hold off

averFilter = movingAverage(voiceMod,7,time);
sound(averFilter, Fs);
end